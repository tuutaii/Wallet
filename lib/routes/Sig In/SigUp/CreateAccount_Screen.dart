import 'package:flutter/material.dart';
import 'package:wallet_app/routes/Onboard/onboard_Screen.dart';
import 'package:wallet_app/routes/Sig%20In/Firebase_Account/createAcc_firebase.dart';
import 'package:wallet_app/routes/Sig%20In/LogIN/SigIn_Screen.dart';
import 'package:wallet_app/widgets/build_email.dart';
import 'package:wallet_app/widgets/build_pass.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passWord = TextEditingController();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    bool isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffedf1f9),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SingIn()));
          },
        ),
        title: Text(
          "Create Account!",
          style: TextStyle(
              fontSize: 26, color: Colors.black, fontWeight: FontWeight.w600),
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
                      ? Image.asset('assets/images/office.png')
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
                          TextFieldWidget(
                              text: 'First Name', controller: _firstName),
                          TextFieldWidget(
                            text: 'Last Name',
                            controller: _lastName,
                          ),
                          TextFieldWidget(text: 'Email', controller: _email),
                          PasswordFieldWidget(
                              pass: 'Password', controller: _passWord),
                          !isKeyBoard
                              ? SizedBox(
                                  height: 19,
                                )
                              : Container(),
                          SizedBox(
                            height: 13,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                fixedSize: Size(200, 46),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                backgroundColor: Color(0xff347AF0)),
                            onPressed: () {
                              if (_firstName.text.isNotEmpty &&
                                  _email.text.isNotEmpty &&
                                  _passWord.text.isNotEmpty) {
                                setState(() {                            
                                  isloading = true;
                                });

                                createAccount(_firstName.text, _lastName.text,
                                        _email.text, _passWord.text)
                                    .then((user) {
                                  if (user != null) {
                                    setState(() {
                                      isloading = false;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => SingIn()));
                                    print("Account Created Sucessfull");
                                  } else {
                                    print("Login Failed");
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Center(child: Text('Error')),
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
                              }
                            },
                            child: const Text(
                              "Let’s Get Started",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SingIn()));
                                },
                                child: Text(
                                  'Login',
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
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ),
    );
  }
}
