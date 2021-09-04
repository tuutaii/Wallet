import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/routes/Sig%20In/Welcom/Welcome_Screen.dart';
import 'package:wallet_app/widgets/onboard_widgets.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  // Show skip button
  bool skip = true;

  // Button next last page
  String textButton = 'Next Step';
  Color colorTextButton = Color(0xff347AF0);
  Color colorButton = Colors.white;

  int currentPage = 0;
  PageController _pageController =
      new PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xffedf1f9),
        actions: [
          Visibility(
            visible: skip,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  _pageController.jumpToPage(3);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: 19,
                      color: Color(0xff347AF0),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: PageView(
              controller: _pageController,
              children: [
                OnboardWidget('desktop', 'Welcome to\n Whollet',
                    'Manage all your crypto assets! It’s simple\n and easy!'),
                OnboardWidget(
                  'idea',
                  'Nice and Tidy Crypto\n Portfolio!',
                  'Keep BTC, ETH, XRP, and many other\n ERC-20 based tokens.',
                ),
                OnboardWidget(
                  'mobile',
                  'Receive and Send Money\n to Friends!',
                  'Send crypto to your friends with a personal\n message attached.',
                ),
                OnboardWidget(
                  'social',
                  ' Your Safety is Our\n Top Priority',
                  'Our top-notch security features will keep\n you completely safe.',
                ),
              ],
              onPageChanged: (value) => {setCurrentPage(value)},
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width) / 2,
            top: (MediaQuery.of(context).size.width) / 2,
            child: Row(
              children: List.generate(4, (index) => getIndicator(index)),
            ),
          ),
          Positioned(
            bottom: 60,
            left: (MediaQuery.of(context).size.width - 200) / 2,
            child: InkWell(
              onTap: () {
                (currentPage != 3) ?
                _pageController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut) : Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
              },
              child: Container(
                height: 46,
                width: 200,
                decoration: BoxDecoration(
                    color: colorButton,
                    border: Border.all(width: 2, color: Color(0xff347AF0)),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                    child: Text(
                  textButton,
                  style: TextStyle(
                      fontSize: 19,
                      color: colorTextButton,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 10 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: (currentPage == pageNo) ? Color(0xff347AF0) : Colors.grey),
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {
      if (currentPage == 3) {
        skip = false;
        textButton = "Let's Get Started";
        colorTextButton = Colors.white;
        colorButton = Color(0xff347AF0);
      } else {
        skip = true;
        textButton = 'Next Step';
        colorTextButton = Color(0xff347AF0);
        colorButton = Colors.white;
      }
    });
  }
}
