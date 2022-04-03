import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rioappone/models/signin_request_model.dart';
import 'package:rioappone/screens/home/home_srcreen.dart';
import 'package:rioappone/screens/sigup/sigup_screen.dart';
import 'package:rioappone/services/api_service.dart';
import 'package:rioappone/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  String? apiUrl;

  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loaduser();
  }

  void _loaduser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      apiUrl = (prefs.getString('apiUrl') ?? "0");
      userName = (prefs.getString('userName') ?? "");
      password = (prefs.getString('password') ?? "");
      //debugPrint('loaduer username:s $userName password $password');
    });
  }

  void _setapiUrl(apiUrl) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      apiUrl = apiUrl;
      prefs.setString('apiUrl', apiUrl);
    });
  }

  void _setUser(userName) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('userName', userName);
    });
  }

  void _setPassword(password) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('password', password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 20.0,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30, top: 50),
            child: Text(
              "SIGN IN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.person),
              "Username",
              "Username",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Username can\'t be empty.';
                }

                return null;
              },
              // ignore: sdk_version_set_literal
              (onSavedVal) => {
                _setUser(onSavedVal),
                userName = onSavedVal,
              },
              initialValue: userName ?? "",
              obscureText: false,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              //textColor: Colors.white,
              //hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.lock),
              "Password",
              "Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Password can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                _setPassword(onSavedVal),
                password = onSavedVal,
              },
              initialValue: password ?? "",
              obscureText: hidePassword,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              //textColor: Colors.white,
              //hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 25,
              ),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Forget Password ?',
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Sign In",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isApiCallProcess = true;
                  });

                  SigInRequestModel model = SigInRequestModel(
                    email: userName,
                    password: password,
                  );

                  APIService.login(model).then(
                    (response) {
                      setState(() {
                        debugPrint('movieTitle: $response');
                        isApiCallProcess = false;
                      });

                      if (response) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                        // Navigator.pushNamedAndRemoveUntil(
                        //   context,
                        //   '/home',
                        //   (route) => false,
                        // );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Invalid Username/Password !!",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: Colors.blue.shade900,
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 0,
              ),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 14.0),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Dont have an account? ',
                    ),
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SigupScreen()));
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 0,
              ),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 14.0),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Server: ',
                    ),
                    TextSpan(
                      text: (apiUrl == "0" && apiUrl == ' ')
                          ? "Add Address"
                          : apiUrl,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            addressController.text = apiUrl ?? '';
                          });
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _PopupAddApiUrl(apiUrl),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _PopupAddApiUrl(String? api) {
    return AlertDialog(
        title: const Text("Add Address Server"),
        content: TextField(
          controller: addressController,
        ),
        actions: <Widget>[
          MaterialButton(
              elevation: 5.0,
              child: const Text('Submit'),
              onPressed: () {
                _setapiUrl(addressController.text.toString());
                Navigator.of(context).pop();
                setState(() {
                  String address = addressController.text
                      .toString()
                      .replaceAll(RegExp(r' '), '');
                  if (address.isNotEmpty) {
                    apiUrl = address;
                  }
                });
              })
        ]);
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
