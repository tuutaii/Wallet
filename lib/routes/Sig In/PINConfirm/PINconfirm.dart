import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/num_screen.dart';

class ConfirmPIN extends StatefulWidget {
  const ConfirmPIN({Key? key}) : super(key: key);

  @override
  _ConfirmPINState createState() => _ConfirmPINState();
}

class _ConfirmPINState extends State<ConfirmPIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirm PIN',
          style: TextStyle(
              color: Color(0xFF0D1F3C),
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEDF1F9),
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
            )),
      ),
      backgroundColor: Color(0xFFEDF1F9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Repeat a PIN code to continue ',
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
                        shape: BoxShape.circle, color: Color(0xFF75BF72)),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
