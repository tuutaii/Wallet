import 'package:flutter/material.dart';


class NumberKeyBoard extends StatelessWidget {
  const NumberKeyBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < 3; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int j = 1; j <= 3; j++)
                  Number(number: (j + i * 3).toString(), press: 0)
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Number(number: '.', press: 0),
              Number(number: '0', press: 0),
              Container(
                width: 80,
                height: 80,
                child: IconButton(
                  icon: Icon(Icons.backspace),
                  color: Colors.black,
                  onPressed: () {},
                ),
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
  final press;
  const Number({Key? key, required this.number, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
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
