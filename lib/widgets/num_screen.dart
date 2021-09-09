import 'package:flutter/material.dart';

class NumberKeyBoard extends StatelessWidget {
  const NumberKeyBoard(
      {Key? key, required this.pressAddString, required this.removeString})
      : super(key: key);
  final Function pressAddString, removeString;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < 3; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int j = 1; j <= 3; j++)
                  Number(number: (j + i * 3).toString(), press: pressAddString)
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Number(number: '.', press: pressAddString),
              Number(number: '0', press: pressAddString),
              Container(
                width: 80,
                height: 80,
                child: IconButton(
                    onPressed: () {
                      removeString();
                    },
                    icon: Icon(Icons.backspace),
                    color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Number extends StatelessWidget {
  final String number;
  final Function press;
  const Number({Key? key, required this.number, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        press(number);
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: number.toString() == '5'
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.5),
              )
            : BoxDecoration(),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(color: Color(0xFF003282), fontSize: 38.38),
          ),
        ),
      ),
    );
  }
}
