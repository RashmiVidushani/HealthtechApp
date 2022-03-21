import 'package:application/commonscreens/registration.dart';
import 'package:application/hospital_dash/hdoctor.dart';
import 'package:application/hospital_dash/hospital.dart';
import 'package:application/hospital_dash/hstatistic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Widgets/colors.dart' as AppColor;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Health Tech',
      debugShowCheckedModeBanner: false,
      home: Hospital(),
    );
  }
}
