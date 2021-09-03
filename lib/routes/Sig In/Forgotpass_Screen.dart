import 'package:flutter/material.dart';
import 'package:wallet_app/routes/Sig%20In/SigIn_Screen.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffedf1f9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          "Forgot PassWord?",
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
              height: 178,
            ),
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
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email address',
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffB5BBC9)),
                          ),
                    ),
                    
                    SizedBox(height: 50),
                    TextButton(
                          style: TextButton.styleFrom(
                              fixedSize: Size(200, 46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23),
                              ),
                              backgroundColor: Color(0xff347AF0)),
                          onPressed: () {},
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
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
}
