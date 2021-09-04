import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wallet_app/routes/Sig%20In/Firebase_Account/createAcc_firebase.dart';
import 'package:wallet_app/routes/Sig%20In/SigUp/CreateAccount_Screen.dart';
import 'package:wallet_app/routes/Wallet/wallet_ICX.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'f1'

      ),
      home: CreateAccount()
    );
  }

}
