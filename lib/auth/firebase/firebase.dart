import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firecontroller.dart';

class LoginPage extends StatelessWidget {
  final LoginController c;

  LoginPage(this.c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => c.email.value = value,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) => c.password.value = value,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 8),
            c.loading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: c.submit,
                    child: Text('Login'),
                  ),
            SizedBox(height: 8),
            Text(c.errorMessage.value),
          ],
        ),
      ),
    );
  }
}
