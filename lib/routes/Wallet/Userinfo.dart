import 'package:flutter/material.dart';

class Userinfo extends StatelessWidget {
  final bool isBalance;
  final String firstName, lastName;
  final double balance;
  final Function buttonShowHide;
  final String email;

  const Userinfo({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.balance = .0,
    required this.isBalance,
    required this.buttonShowHide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 1)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xffDBDDEF),
                        width: 1,
                      )),
                  child: Image.asset("assets/images/bts.png")
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, $firstName $lastName',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('$email')
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff6495ED),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${isBalance ? (balance).toStringAsFixed(4) : "********"} ICX",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () => buttonShowHide(),
                            child: isBalance
                                ? Text("HIDE",
                                    style: TextStyle(color: Colors.white))
                                : Text("SHOW",
                                    style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      Text(
                        "${isBalance ? (balance * 1.49).toStringAsFixed(4) : "********"} \$",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
