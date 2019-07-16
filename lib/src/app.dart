import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import 'package:login_bloc/blocs/provider.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {

    return Provider(
      child: MaterialApp(
        title: 'Log me in',
        home: Scaffold(
          body: LoginScreen(),
        )
      ),
    );

  }
}