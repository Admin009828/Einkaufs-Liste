import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const SafeArea(
          child: Column(
        children: [
          SizedBox(height: 50),

          // logo
          Icon(
            Icons.lock,
            size: 100,
          ),

          SizedBox(height: 50),

          // welcome back,
          Text(
            'Welcome back!',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),

          SizedBox(
            height: 25,
          ),

          // username textfield
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          ),

          // password textfield

          // forgot password

          // sing in button

          // or continue with

          // google + apple sign in buttons

          // not a member? register now
        ],
      )),
    );
  }
}
