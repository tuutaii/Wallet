import 'package:flutter/material.dart';

class Newpass extends StatefulWidget {
  const Newpass({Key? key}) : super(key: key);

  @override
  _NewpassState createState() => _NewpassState();
}

class _NewpassState extends State<Newpass> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    bool isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffedf1f9),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "Create New Password",
          style: TextStyle(
              fontSize: 26, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffedf1f9),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Text(
                'Enter your registrated email address to receive password reset instruction',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            !isKeyBoard
                ? SizedBox(
                    height: 70,
                  )
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
                    TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure == false
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                    ),
                    SizedBox(height: 25),
                    TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure == false
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                    ),
                    SizedBox(height: 100),
                    Positioned(
                        bottom: 60,
                        left: (MediaQuery.of(context).size.width - 200) / 2,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              fixedSize: Size(200, 46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23),
                              ),
                              backgroundColor: Color(0xff347AF0)),
                          onPressed: () {},
                          child: const Text(
                            'Ssubmit',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
