import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_icon_network/flutter_icon_network.dart';
import 'package:wallet_app/routes/Sig%20In/Register/CreateAccount_Screen.dart';




Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await FlutterIconNetwork.instance!
      .init(host: "https://bicon.net.solidwallet.io/api/v3", isTestNet: true);
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
