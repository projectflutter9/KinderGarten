import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kindergarten/Constants.dart';
import 'package:kindergarten/admin/ApproveFeeds.dart';
import 'package:kindergarten/admin/ManageTeachers.dart';
import 'package:kindergarten/admin/mange_users_tapBar.dart';
import 'package:kindergarten/login.dart';



class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      appBar: AppBar(
        title: Text("ADMIN DASHBOARD"),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageTeachers()));
              },
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      //background color of box
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "MANAGE TEACHERS",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.edit,
                        size: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Approve_Feedback()));
              },
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      //background color of box
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "APPROVE FEEDBACKS",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.done,
                        size: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => mange_users()));
              },
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      //background color of box
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "MANAGE USERS",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.settings,
                        size: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Login()));
                fatherName = "";
                user_id = "";
                userEmail = "";

                },
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      //background color of box
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.logout,
                        size: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
