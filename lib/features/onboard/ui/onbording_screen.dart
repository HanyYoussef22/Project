import 'package:flutter/material.dart';

import 'widgets/doc_logo_name.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child:Column(
            children: [
              DocLogoName(),
            ],
          )
      ),
    );
  }
}
