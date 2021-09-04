import 'package:flutter/material.dart';
import 'package:wallet_app/routes/Sig%20In/LogIN/SigIn_Screen.dart';
import 'package:wallet_app/widgets/num_screen.dart';

class CreatePIN extends StatefulWidget {
  const CreatePIN({Key? key}) : super(key: key);

  @override
  _CreatePINState createState() => _CreatePINState();
}

class _CreatePINState extends State<CreatePIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create a PIN',
          style: TextStyle(
              color: Color(0xFF0D1F3C),
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEDF1F9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SingIn()));
          },
        ),
      ),
      backgroundColor: Color(0xFFEDF1F9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Enhance the security of your account by creating \na PIN code',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Color(0xFF485068)),
          ),
          // const SizedBox(
          //   height: 149,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: i < _password.length
                        //     ? Color(0xFF75BF72)
                        //     : Color(0xFF9EA5B1),
                        color: Color(0xFF75BF72)),
                  ),
                )
            ],
          ),
          NumberKeyBoard()
        ],
      ),
    );
  }
}
