import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

InputDecoration txtDecoration(hintText) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    hintText: hintText,
  );
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(decoration: txtDecoration('First Name')),
          TextFormField(decoration: txtDecoration('Last Name')),
          TextFormField(decoration: txtDecoration('Username')),
          TextFormField(decoration: txtDecoration('Email')),
          TextFormField(
            decoration: txtDecoration('Password'),
            obscureText: true,
          ),
          TextFormField(
            decoration: txtDecoration('Confirm Password'),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
