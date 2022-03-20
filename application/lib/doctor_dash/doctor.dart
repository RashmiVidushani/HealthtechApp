import 'package:application/commonscreens/login.dart';
import 'package:application/doctor_dash/dgeneral.dart';
import 'package:application/doctor_dash/dpatient.dart';
import 'package:application/doctor_dash/drecord.dart';
import 'package:application/doctor_dash/dstatistic.dart';
import 'package:application/model/i_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:application/Widgets/colors.dart' as color;

class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
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
    //Istat
    final dstat = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Dstatistic()));
          },
          child: const Text(
            "Statistical data",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    /* Doctor dashboard-> Statistical data 
Doctor dashboard-> General data 
Doctor dashboard-> Patient details 
Doctor dashboard-> Patient records*/
    //dgeneral
    final dgeneral = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Dgeneral()));
          },
          child: const Text(
            "General Data",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    //Patient details
    final dpatient = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Dpatient()));
          },
          child: const Text(
            "Patient details ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    //Patient records
    final drecords = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Drecord()));
          },
          child: const Text(
            "Patient records",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: color.Appcolor.white,
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Health Tech",
              style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 10, 139, 75),
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            const Text(
              "Doctor Dashboard  ",
              style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w500),
            ),
            ActionChip(
                label: const Text("Logout"),
                onPressed: () {
                  logout(context);
                }),
            const SizedBox(
              height: 25,
            ),
            dstat,
            const SizedBox(
              height: 20,
            ),
            dgeneral,
            const SizedBox(
              height: 20,
            ),
            dpatient,
            const SizedBox(
              height: 20,
            ),
            drecords,
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Ilogin()));
  }
}
