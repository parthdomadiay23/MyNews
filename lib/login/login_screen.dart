// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prodt/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'WellCome To MyNews',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Sign in',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              textColor: Colors.blue,
              child: Text(
                'Forgot Password',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                    ),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                child: Text('Login'),
                onPressed: () {
                  gotoNextScreen();
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Does not have account?'),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  gotoNextScreen() {
    if (isValid()) {
      Navigator.pushReplacementNamed(context, Routes.Home);
    }
  }

  bool isValid() {
    if (nameController.text == null || nameController.text == "") {
      Fluttertoast.showToast(msg: "Enter Username");
      return false;
    }
    if (passwordController.text == null || passwordController.text == "") {
      Fluttertoast.showToast(msg: "Enter Password");
      return false;
    }
    return true;
  }
}
