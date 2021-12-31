import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kindergarten/login.dart';
import 'package:kindergarten/teacher/AddFeeds.dart';
import 'package:kindergarten/teacher/Addgrades.dart';
import 'package:kindergarten/user/contact.dart';
import 'package:kindergarten/user/edit_profile.dart';
import 'package:kindergarten/user/feedback.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login(),
    );
  }
}
