import 'package:flutter/material.dart';
import 'package:wallet_app/routes/Onboard/onboard_Screen.dart';
import 'package:wallet_app/routes/Sig%20In/Firebase_Account/createAcc_firebase.dart';
import 'package:wallet_app/routes/Sig%20In/SigIn_Screen.dart';

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
  bool _isObscure = true;
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
                  SizedBox(height: 40,),
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
                          field(size, 'First Name', "First Name", _firstName),
                          field(size, 'Last Name', "Last Name", _lastName),
                          field(size, 'Email', "Email", _email),
                          TextField(
                            controller: _passWord,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffB5BBC9)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure == false
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Color(0xFFB5BBC9),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                )),
                          ),
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
                                            builder: (_) => Onboard()));
                                    print("Account Created Sucessfull");
                                  } else {
                                    print("Login Failed");
                                    setState(() {
                                      isloading = false;
                                    });
                                  }
                                });
                              } else {
                                print("Please enter Fields");
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
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  Widget field(Size size, String hintText, String lableText,
      TextEditingController cont) {
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
