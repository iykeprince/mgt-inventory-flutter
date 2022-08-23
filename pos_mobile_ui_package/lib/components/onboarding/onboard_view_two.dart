import 'package:flutter/material.dart';

class OnboardingViewTwo extends StatelessWidget {
  const OnboardingViewTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.red),
      padding: const EdgeInsets.all(40),
      child: const Text(
        'Page Two',
        style: TextStyle(fontSize: 45.0),
      ),
    );
  }
}
