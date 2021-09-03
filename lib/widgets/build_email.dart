import 'package:flutter/material.dart';

class Buildemail extends StatefulWidget {
  const Buildemail({Key? key}) : super(key: key);

  @override
  _BuildemailState createState() => _BuildemailState();
}

class _BuildemailState extends State<Buildemail> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Email address',
          labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xffB5BBC9)),
          ),
    );
  }
}
