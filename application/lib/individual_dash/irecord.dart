import 'package:application/individual_dash/individual.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Irecord extends StatefulWidget {
  const Irecord({Key? key}) : super(key: key);

  @override
  State<Irecord> createState() => _DgeneralState();
}

class _DgeneralState extends State<Irecord> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  final bloodEditingController = TextEditingController();
  //final searchEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  final dobEditingController = TextEditingController();
  final weightEditingController = TextEditingController();
  final heightEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //search feild
    /* final searchField = TextFormField(
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
*/
    //add button
    final add = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: const Text(
            "Add Record",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    //refresh button
    final refresh = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: const Text(
            "Refresh",
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

    //Dob field
    final dobField = TextFormField(
        autofocus: false,
        controller: dobEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Dob Number cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          dobEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.date_range),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Date of birth",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //height field
    final heightField = TextFormField(
        autofocus: false,
        controller: heightEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your height");
          }
          // reg expression for height validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid height");
          }
          return null;
        },
        onSaved: (value) {
          heightEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.numbers_outlined),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Height",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //weight field
    final weightField = TextFormField(
        autofocus: false,
        controller: weightEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your weight");
          }
          // reg expression for height validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid height");
          }
          return null;
        },
        onSaved: (value) {
          weightEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.numbers_sharp),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Weight",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //blood field
    final bloodField = TextFormField(
        autofocus: false,
        controller: bloodEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your blood");
          }
          // reg expression for height validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid blood");
          }
          return null;
        },
        onSaved: (value) {
          bloodEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.numbers_sharp),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Blood group",
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
                      "Individual dashboard -> Individual Records ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500),
                    ),
                    /*   const SizedBox(height: 25),
                    searchField,
                    const SizedBox(height: 20),
                    search,*/
                    const SizedBox(height: 20),
                    usernameField,
                    const SizedBox(height: 20),
                    dobField,
                    const SizedBox(height: 20),
                    heightField,
                    const SizedBox(height: 20),
                    weightField,
                    const SizedBox(height: 20),
                    bloodField,
                    const SizedBox(height: 20),
                    add,
                    const SizedBox(height: 20),
                    refresh,
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
                                  builder: (context) => const Individual()));
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
/*
class Search {
  searchByUsername(String search) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: search.substring(0, 1).toUpperCase())
        .get();
  }
}
*/