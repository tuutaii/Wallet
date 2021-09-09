import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_network/flutter_icon_network.dart';
import 'package:wallet_app/routes/Onboard/onboard_Screen.dart';
import 'package:crypt/crypt.dart';

Future<User?> createAccount(
    String firstname, String lastname, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    print("Account created Succesfull");

    final wallet = await FlutterIconNetwork.instance!.createWallet;
    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "last_name": lastname,
      "first_name": firstname,
      "email": email,
      "address": wallet.address,
      "primary_key": wallet.privateKey,
      "status": "Unavalible",
      "uid": _auth.currentUser!.uid,
      'pin': {
        'pin': Crypt.sha256('1111', rounds: 10000, salt: 'tuutaii').hash
      },
    });

    return userCrendetial.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    print("Login Sucessfull");
    _firestore.collection('users').doc(_auth.currentUser!.uid).get().then(
        (value) => userCredential.user!.updateDisplayName(value['last_name']));

    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Onboard()));
    });
  } catch (e) {
    print("error");
  }
}
