import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kindergarten/Constants.dart';
import 'package:kindergarten/login.dart';
import 'package:kindergarten/teacher/AddFeeds.dart';
import 'package:kindergarten/teacher/Addgrades.dart';
import 'package:kindergarten/teacher/edit_teacher_profile.dart';



class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello Teacher Name"),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        ),
      backgroundColor: Color.fromRGBO(143, 160, 251, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddGrades()));
                  },
                  splashColor: Color.fromRGBO(143, 148, 251, 1),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_balance, size: 70.0,color:  Colors.brown,),
                        Text('Add Grades' , style: TextStyle(fontSize: 17.0 ,),)
                      ],
                    ),
                  ),
                ),
              ),
             SizedBox(height: 20,),
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => edit_teacher()));
                  },
                  splashColor: Color.fromRGBO(143, 148, 251, 1),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_circle_outlined , size: 70.0,color:  Colors.green,),
                        Text('Edit Profile' , style: TextStyle(fontSize: 17.0 ,),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddFeeds()));
                  },
                  splashColor: Color.fromRGBO(143, 148, 251, 1),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, size: 70.0,color:  Colors.deepPurple,),
                        Text('Add Announcement' , style: TextStyle(fontSize: 17.0 ,),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: ()async {
                    await FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Login())));
                    fatherName = "";
                    user_id = "";
                    userEmail = "";
                    teacher_name = "" ;


                  },
                  splashColor: Color.fromRGBO(143, 148, 251, 1),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.logout, size: 70.0,color:  Colors.black,),
                        Text('Log Out' , style: TextStyle(fontSize: 17.0 ,),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
// CustomCard(name: 'Add Grades', icon: Icons.account_balance, color: Colors.brown,),
// CustomCard(name: 'Edit Profile', icon: Icons.account_circle_outlined , color: Colors.green,),
// CustomCard(name: 'Add Announcement', icon: Icons.add, color: Colors.deepPurple,),