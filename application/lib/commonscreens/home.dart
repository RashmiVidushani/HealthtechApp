import 'package:application/Widgets/colors.dart';
import 'package:application/commonscreens/login.dart';
import 'package:application/commonscreens/registration.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //login
    final loginbtn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Ilogin()));
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    //registration
    final registration = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 39, 187, 59),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Iregister()));
          },
          child: const Text(
            "Register",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Health Tech",
                  style: TextStyle(
                      fontSize: 38,
                      color: Appcolor.home,
                      backgroundColor: Appcolor.white,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Row(children: [
              Text(
                "Guidelines",
                style: TextStyle(
                    fontSize: 20,
                    color: Appcolor.black,
                    fontWeight: FontWeight.w500),
              ),
              Expanded(child: Container()),
              Text(
                "More details",
                style: TextStyle(
                    fontSize: 15,
                    color: Appcolor.hom,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(Icons.arrow_forward, size: 20, color: Appcolor.homeicons)
            ]),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 175,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 10, 139, 75),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(80)),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(5, 10),
                          blurRadius: 10,
                          color: Appcolor.hometit.withOpacity(0.2))
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Step 1:  Register to Health tech.",
                        style: TextStyle(fontSize: 18, color: Appcolor.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Step 2:  Create or import a wallet.",
                        style: TextStyle(fontSize: 18, color: Appcolor.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Text(
                            "Video guide",
                            style:
                                TextStyle(fontSize: 15, color: Appcolor.black),
                          ),
                          Icon(
                            Icons.play_arrow_rounded,
                            size: 40,
                            color: Appcolor.homeicons,
                          )
                        ],
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Options",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Appcolor.homeicons),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            loginbtn,
            const SizedBox(
              height: 50,
            ),
            registration,
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
