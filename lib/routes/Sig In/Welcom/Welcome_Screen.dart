import 'package:flutter/material.dart';
import 'package:wallet_app/routes/Sig%20In/LogIN/SigIn_Screen.dart';
import 'package:wallet_app/routes/Sig%20In/SigUp/CreateAccount_Screen.dart';


class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF347AF0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                  height: 29,
                ),
                Column(
                  children: const [
                    Text(
                      'Welcome to',
                      style:
                          TextStyle(color: Color(0xFF81FFFFFF), fontSize: 28),
                    ),
                    Text(
                      'WHOLLET',
                      style: TextStyle(color: Colors.white, fontSize: 48),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 300,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(200, 46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23),
                          ),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingIn()));
                      },
                      child: const Text(
                        'Sign In',
                        style:
                            TextStyle(color: Color(0xFF347AF0), fontSize: 19),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CreateAccount()));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
