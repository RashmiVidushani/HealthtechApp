// ignore_for_file: unnecessary_const

import 'dart:async';
import 'package:application/individual_dash/individual.dart';
import 'package:application/model/i_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<Welcome> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    startTime();
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Individual()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            Text("${loggedInUser.username}",
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "WELCOME!",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 10, 139, 75),
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Health Tech",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 10, 139, 75),
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              "Your digital Health manager",
              style: const TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 1, 26, 13),
                  fontWeight: FontWeight.w700),
            ),
            const Padding(padding: const EdgeInsets.only(top: 20.0)),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
