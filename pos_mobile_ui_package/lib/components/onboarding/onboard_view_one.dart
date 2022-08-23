import 'package:flutter/material.dart';

class OnboardingViewOne extends StatelessWidget {
  OnboardingViewOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(color: Colors.green),
      child: Column(
        children: [
          Text(
            'Page One',
            style: TextStyle(fontSize: 45.0),
          ),
        ],
      ),
    );
  }
}
