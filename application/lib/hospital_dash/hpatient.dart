import 'package:application/hospital_dash/hospital.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Hpatient extends StatefulWidget {
  const Hpatient({Key? key}) : super(key: key);

  @override
  State<Hpatient> createState() => _HpatientState();
}

class _HpatientState extends State<Hpatient> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  final searchEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //search feild
    final searchField = TextFormField(
        autofocus: false,
        controller: searchEditingController,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Empty search bar");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid username(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          searchEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Search by username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //search button
    final search = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: const Text(
            "Search",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    //add button
    final update = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: const Text(
            "Update",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    //records button
    final records = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: const Text(
            "Records",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

//username field
    final usernameField = TextFormField(
        autofocus: false,
        controller: usernameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Username cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          usernameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final phoneField = TextFormField(
        autofocus: false,
        controller: phoneEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Phone Number cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          phoneEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter patient Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
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
                      "Hospital dashboard-> Patient details ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 25),
                    searchField,
                    const SizedBox(height: 20),
                    search,
                    const SizedBox(height: 20),
                    usernameField,
                    const SizedBox(height: 20),
                    phoneField,
                    const SizedBox(height: 20),
                    emailField,
                    const SizedBox(height: 20),
                    update,
                    const SizedBox(height: 20),
                    records,

                    const SizedBox(height: 25),
                    //backbutton
                    TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 70),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Hospital()));
                        },
                        child: const Icon(Icons.arrow_back_rounded)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Search {
  searchByUsername(String search) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: search.substring(0, 1).toUpperCase())
        .get();
  }
}
