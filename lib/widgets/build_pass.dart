import 'package:flutter/material.dart';

class Buildpass extends StatefulWidget {
  const Buildpass({Key? key}) : super(key: key);

  @override
  _BuildpassState createState() => _BuildpassState();
}

class _BuildpassState extends State<Buildpass> {
  bool _isObscure = true;
  String password = '';
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => setState(() => this.password = value),
      onSubmitted: (value) => setState(() => this.password = value),
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
                _isObscure == false ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          )),
    );
  }
}
