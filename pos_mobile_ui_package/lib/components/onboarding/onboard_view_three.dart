import 'package:flutter/material.dart';

class OnboardingViewThree extends StatelessWidget {
  const OnboardingViewThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.blue),
      padding: const EdgeInsets.all(40),
      child: const Text(
        'Page Three',
        style: TextStyle(fontSize: 45.0),
      ),
    );
  }
}
