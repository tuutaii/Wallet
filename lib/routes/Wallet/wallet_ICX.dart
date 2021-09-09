import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icon_network/flutter_icon_network.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/routes/Sig%20In/Firebase_Account/createAcc_firebase.dart';
import 'package:wallet_app/routes/Wallet/Userinfo.dart';
import 'package:wallet_app/widgets/build_email.dart';
import 'package:wallet_app/widgets/content.dart';

class Walletthome extends StatefulWidget {
  const Walletthome({Key? key}) : super(key: key);

  @override
  _WalletthomeState createState() => _WalletthomeState();
}

class _WalletthomeState extends State<Walletthome> {
  String uid = '';
  double _balance = 0;
  String _firstName = '',
      _lastName = '',
      _primaryKey = '',
      _email = '',
      _address = '';
  bool _isBalance = false;

  final TextEditingController _icxController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String status = "Tranfers";

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
              Map<String, dynamic> data =
                  documentSnapshot.data() as Map<String, dynamic>;
              _firstName = data['first_name'];
              _lastName = data['last_name'];
              _email = data['email'];
              _primaryKey = data['primary_key'];
              _address = data['address'];
            });
          }
        },
      );
    }
  }

  void loadBalance() async {
    if (_primaryKey != '') {
      final balance = await FlutterIconNetwork.instance!
          .getIcxBalance(privateKey: _primaryKey);
      if (_balance != balance.icxBalance)
        setState(() {
          _balance = balance.icxBalance;
        });
    }
  }

  void showHideBalance() {
    setState(() {
      _isBalance = !_isBalance;
    });
  }

  Future<void> transferICX() async {
    setState(() {
      status = "Loading";
    });
    final tHash = await FlutterIconNetwork.instance!.sendIcx(
        yourPrivateKey: _primaryKey,
        destinationAddress: _addressController.text,
        value: _icxController.text);
    _showTransferDialog(
      idTransaction: tHash.txHash.toString(),
      from: _address,
      to: _addressController.text,
      values: _icxController.text,
      context: context,
    );
    setState(() {
      status = "Transfer";
      _icxController.clear();
      _addressController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_address);
    loadID();
    loadBalance();
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
                    email: _email,
                    firstName: _firstName,
                    lastName: _lastName,
                    isBalance: _isBalance,
                    balance: _balance,
                    buttonShowHide: showHideBalance),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text('Transfer ICX',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
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
                  height: 50,
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
                  onPressed: () {
                    transferICX();
                  },
                  child: const Text(
                    'Transfer',
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
                    onPressed: () {
                       Clipboard.setData(ClipboardData(text: _address));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Copy my address',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.copy_rounded,
                          color: Colors.black,
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showTransferDialog(
      {required String idTransaction,
      required String from,
      required String to,
      required String values,
      required BuildContext context}) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm:ss').format(now);
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: Center(
            child: const Text(
              'Transaction Successfully!',
              style: TextStyle(
                fontWeight: FontWeight.w800
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("data"),

                Content(title: 'Time:', content: formattedDate),
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Content(title: 'Total amount:', content: values),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Content(title: 'Transaction ID:', content: idTransaction),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Content(title: 'From:', content: from),
             
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Content(title: 'To:', content: to),
               
              ],
            ),
          ),
        );
      },
    );
  }
}
