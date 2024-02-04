import 'package:flutter/material.dart';
import 'package:project/core/theming/style/colors.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen'),
      ),
      body: const Column(
        children: [
          Center(
            child: Center(child: Text('Home Screen')),
          )
        ],
      ),
    );
  }
}
