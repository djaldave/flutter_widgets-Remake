import 'package:Flutter_Widgets/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/auth_model.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

InputDecoration txtDecoration(var str) {
  return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: str,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.fromLTRB(15, 15, 10, 8),
      errorStyle: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold));
}

class LoginFormState extends State<LoginForm> {
  final _bottomSpace = 10.0;
  final _formKey = GlobalKey<FormState>();
  final emailExp =
      new RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
  final passTxtController = TextEditingController();
  final emailTxtController = TextEditingController();

  @override
  void dispose() {
    passTxtController.dispose();
    emailTxtController.dispose();
    super.dispose();
  }

  _login() async {
    if (_formKey.currentState.validate()) {
      String email = emailTxtController.text;
      String password = passTxtController.text;

      var loginRes = await authenticate(email, password);

      if (loginRes.errMsg == null) {
        // print(loginRes.token);
        Provider.of<AuthModel>(context, listen: false).login(loginRes.token);
        Navigator.pushNamedAndRemoveUntil(
            context, '/homepage', (Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${loginRes.errMsg}")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(height: 70),
          TextFormField(
              controller: emailTxtController,
              decoration: txtDecoration('Username'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter your username';
                }
                return null;
              }),
          SizedBox(height: _bottomSpace),
          TextFormField(
              obscureText: true,
              decoration: txtDecoration('Password'),
              controller: passTxtController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter your password';
                }

                return null;
              }),
          SizedBox(height: _bottomSpace),
          ElevatedButton(child: Text('Login'), onPressed: _login),
          SizedBox(height: 50),
          Text('Don\'t have an account?',
              style: TextStyle(color: Colors.white)),
          ElevatedButton(
              child: Text('Register Now'),
              onPressed: () {
                Navigator.pushNamed(context, '/registration');
              }),
        ]) //Column

        ); //Form
  }
}
