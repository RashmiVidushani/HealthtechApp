import 'package:application/commonscreens/login.dart';
import 'package:application/hospital_dash/hdoctor.dart';
import 'package:application/hospital_dash/hpatient.dart';
import 'package:application/hospital_dash/hrecord.dart';
import 'package:application/hospital_dash/hstatistic.dart';
import 'package:application/model/i_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:application/Widgets/colors.dart' as color;

class Hospital extends StatefulWidget {
  const Hospital({Key? key}) : super(key: key);

  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
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
    //hstat
    final hstat = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Hstatistic()));
          },
          child: const Text(
            "Statistical data",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    //hdoc
    final hdoc = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Hdoctor()));
          },
          child: const Text(
            "Doctor Details",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
/*Hospital dashboard->statistical data 
Hospital dashboard->Patient details 
Hospital dashboard->Doctor Details 
Hospital dashboard->Patient records  */
    //Patient details
    final hpatient = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Hpatient()));
          },
          child: const Text(
            "Patient details ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    //Patient records
    final hrec = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Hrecord()));
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
              "Hospital dashboard  ",
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
            hstat,
            const SizedBox(
              height: 20,
            ),
            hdoc,
            const SizedBox(
              height: 20,
            ),
            hpatient,
            const SizedBox(
              height: 20,
            ),
            hrec,
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
