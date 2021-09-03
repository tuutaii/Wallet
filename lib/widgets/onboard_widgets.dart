import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardWidget extends StatefulWidget {
  final String img;
  final String title;
  final String data;
  OnboardWidget(this.img, this.title, this.data);

  @override
  _OnboardWidgetState createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends State<OnboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf1f9),
      body: Column(
        children: [
          Container(
            height: 214,
            width: 318,
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${widget.img}.png'))),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(widget.title,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Text(widget.data,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
