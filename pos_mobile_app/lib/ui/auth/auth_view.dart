import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/auth/auth_view_model.dart';
import 'package:stacked/stacked.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.nonReactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Auth Screen',
              style: TextStyle(fontSize: 50.0),
            )
          ],
        ),
      ),
    );
  }
}
