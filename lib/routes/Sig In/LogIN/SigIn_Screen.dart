import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/routes/Sig%20In/Firebase_Account/createAcc_firebase.dart';
import 'package:wallet_app/routes/Sig%20In/SigUp/CreateAccount_Screen.dart';
import 'package:wallet_app/routes/Wallet/wallet_ICX.dart';
import 'package:wallet_app/widgets/build_email.dart';
import 'package:wallet_app/widgets/build_pass.dart';
import '../PassWord/Forgotpass_Screen.dart';

class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  bool isloading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _passWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: isloading == false
          ? SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  !isKeyBoard
                      ? Image.asset('assets/images/login.png')
                      : Container(),
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
                          TextFieldWidget(text: 'Email', controller: _email),
                          PasswordFieldWidget(
                              pass: 'Password', controller: _passWord),
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
                                            builder: (_) => Walletthome()));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('User not found'),
                                          );
                                        });
                                    setState(() {
                                      isloading = false;
                                    });
                                  }
                                });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Please enter all Fields'),
                                      );
                                    });
                                setState(() {
                                  isloading = false;
                                });
                              }
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
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
                                          builder: (context) =>
                                              CreateAccount()));
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
            )
          : Center(
              child: Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ),
    );
  }
}
