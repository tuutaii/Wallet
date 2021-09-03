import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:wallet_app/routes/Sig%20In/SigIn_Screen.dart';


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
      home: SingIn(),
    );
  }

}
