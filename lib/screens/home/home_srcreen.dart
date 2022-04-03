import 'package:flutter/material.dart';
import 'package:rioappone/screens/home/components/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background(),
    );
  }
}
