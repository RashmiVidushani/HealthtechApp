import 'package:application/individual_dash/individual.dart';
import 'package:application/individual_dash/irecord.dart';
import 'package:application/model/i_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Ipersonal extends StatefulWidget {
  const Ipersonal({Key? key}) : super(key: key);

  @override
  State<Ipersonal> createState() => _IpersonalState();
}

class _IpersonalState extends State<Ipersonal> {
  final _auth = FirebaseAuth.instance;
  late String username, phone, email;
  getUsername(username) {
    this.username = username;
  }

  getEmail(email) {
    this.email = email;
  }

  getPhone(phone) {
    this.phone = phone;
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  // string for displaying the error Message
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  //final searchEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final emailEditingController = TextEditingController();

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
    //updte button
    final update = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            updateDetailsToFirestore(emailEditingController.text);
          },
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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Irecord()));
          },
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
        onChanged: (value) => setState(() => username = value),
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

    //phone field
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
        onChanged: (value) => setState(() => phone = value),
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
            return ("Please Enter Your Email");
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
        onChanged: (value) => setState(() => email = value),
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
                      "Individual dashboard-> Personal details ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 15),
                    Text("Welcome to your profile ${loggedInUser.username}. ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                    Text("      Username: ${loggedInUser.username}. ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                    Text("Phone: ${loggedInUser.phone}. ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                    Text("Email: ${loggedInUser.email}. ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),

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

  updateDetailsToFirestore(String text) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.username = usernameEditingController.text;
    userModel.phone = phoneEditingController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .update(userModel.toMap());
    print("updated user");
    Fluttertoast.showToast(msg: "Account Updated successfully :) ");
  }
}
