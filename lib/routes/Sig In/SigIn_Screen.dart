import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/routes/Onboard/onboard_Screen.dart';
import 'package:wallet_app/routes/Sig%20In/CreateAccount_Screen.dart';
import 'package:wallet_app/routes/Sig%20In/Firebase_Account/createAcc_firebase.dart';

import 'Forgotpass_Screen.dart';

class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  bool isloading = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _passWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffedf1f9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Welcome Back!",
          style: TextStyle(
              fontSize: 26,
              color: Color(0xff0d1f3c),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffedf1f9),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            !isKeyBoard ? Image.asset('assets/images/login.png') : Container(),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    field(size, 'Email', _email),
                    field(size, 'PassWord', _passWord),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forgot()));
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff347AF0)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 90),
                    TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(200, 46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23),
                          ),
                          backgroundColor: Color(0xff347AF0)),
                      onPressed: () {
                        setState(() {
                          isloading = true;
                        });
                        if (_email.text.isNotEmpty &&
                            _passWord.text.isNotEmpty) {
                          setState(() {
                            isloading = true;
                          });

                          logIn(_email.text, _passWord.text).then((user) {
                            if (user != null) {
                              print("Login Sucessfull");
                              setState(() {
                                isloading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Onboard()));
                            } else {
                              print("Login Failed");
                              setState(() {
                                isloading = false;
                              });
                            }
                          });
                        } else {
                          print("Please fill form correctly");
                        }

                        print('Email:${_email.text}');
                        print('Password:${_passWord.text}');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont't have an account?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff347AF0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget field(Size size, String lableText, TextEditingController cont) {
    return Container(
      height: size.height / 15,
      width: size.width,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: lableText,
          labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xffB5BBC9)),
        ),
      ),
    );
  }
}
