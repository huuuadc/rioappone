import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? userName = "No Name", password;

  @override
  void initState() {
    super.initState();
    _loaduser();
  }

  void _loaduser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("userName");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: userName!.isNotEmpty
                ? Text(userName!.substring(0, 7))
                : const Text(""),
            accountEmail: Text(userName!),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://toigingiuvedep.vn/wp-content/uploads/2021/01/hinh-nen-cute-de-thuong-cun-yeu.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://toigingiuvedep.vn/wp-content/uploads/2021/01/anh-dai-dien-cho-cute-de-thuong.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Farorite"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Frends"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Request"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Setting"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text("Policies"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Sign Out"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Exit"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
