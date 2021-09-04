import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_network/flutter_icon_network.dart';
import 'package:wallet_app/routes/Sig%20In/Firebase_Account/createAcc_firebase.dart';
import 'package:wallet_app/routes/Sig%20In/Welcom/Userinfo.dart';
import 'package:wallet_app/widgets/build_email.dart';

class Walletthome extends StatefulWidget {
  const Walletthome({Key? key}) : super(key: key);

  @override
  _WalletthomeState createState() => _WalletthomeState();
}

class _WalletthomeState extends State<Walletthome> {
  String uid = '';
  double _balance = 0;
  String _firstName = '', _lastName = '', _primaryKey = '', _address = '';
  bool _isBalance = false;
  

  final TextEditingController _icxController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void loadID() {
    if (uid == '')
      setState(() {
        print("Set IDDD");
        uid = FirebaseAuth.instance.currentUser!.uid;
      });
  }

  void loadData() {
    if (uid != '') {
      FirebaseFirestore.instance.collection('users').doc(uid).get().then(
        (DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists && _primaryKey == '') {
            setState(() {
              print(documentSnapshot.data());
              // _primaryKey = documentSnapshot.get('primary_key');
              _address = documentSnapshot.get('address');
              _firstName = documentSnapshot.get('first_name');
              _lastName = documentSnapshot.get('last_name');
            });
          }
        },
      );
    }
  }
  

  // void loadBalance() async {
  //   if (_primaryKey != '') {
  //     final balance = await FlutterIconNetwork.instance!
  //         .getIcxBalance(privateKey: _primaryKey);
  //     if (_balance != balance.icxBalance)
  //       setState(() {
  //         _balance = balance.icxBalance;
  //       });
  //   }
  // }

  void showHideBalance() {
    setState(() {
      _isBalance = !_isBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadID();
    loadData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffedf1f9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3783F5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Wallet ICX',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logOut(context);
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Userinfo(
                    firstName: _firstName,
                    lastName: _lastName,
                    isBalance: _isBalance,
                    buttonShowHide: showHideBalance),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text('Tranger ICX',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFieldWidget(
                      text: 'EnterICX', controller: _icxController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFieldWidget(
                      text: 'Enter destination address',
                      controller: _addressController),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: Size(200, 46),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.blue,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: Colors.white),
                  onPressed: () {},
                  child: const Text(
                    'Transger',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Coppy my address',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.copy_rounded,color: Colors.black,)
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
