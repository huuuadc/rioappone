import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:rioappone/screens/signin/signin_screen.dart';
import 'package:rioappone/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:rioappone/services/config.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Config.appName,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            //themeMode: themeProvider.themeMode,
            home: const SignInScreen(),
          );
        },
      );
}
