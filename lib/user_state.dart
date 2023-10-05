import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaam_dhundo/Jobs/jobScreen.dart';
import 'package:kaam_dhundo/LoginPage/login.dart';

class UserState extends StatelessWidget {
  const UserState({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.data == null) {
          print('User is not login yet');
          return Login();
        } else if (userSnapshot.hasData) {
          print('User already logged in yet');
          return JobScreen();
        } else if (userSnapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                'An error has occurred. Try again later',
              ),
            ),
          );
        } else if (userSnapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Text('Something went wrong'),
          ),
        );
      },
    );
  }
}
