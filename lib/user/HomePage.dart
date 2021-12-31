import 'package:flutter/material.dart';
import 'package:kindergarten/user/Customs.dart';
import 'package:kindergarten/user/ViewClasses.dart';
import 'package:kindergarten/user/ViewFeedBack.dart';
import 'package:kindergarten/user/ViewGrades.dart';
import 'package:kindergarten/user/edit_profile.dart';
import 'Feeds.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      backgroundColor:  Color.fromRGBO(143, 148, 251, 1),
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(143, 148, 251, 1),
        elevation: 0.0,
        title: Text("KinderGarten" ,style: TextStyle(fontSize: 23 ,),),
        centerTitle: true,
      ),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30) ,topRight: Radius.circular(30))
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 30 ,top: 30),
          children: [

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 30 ,top: 30),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewClass()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.only(left: 20),
                      height: 120,
                      width: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(alignment: Alignment.centerRight,image: AssetImage('assets/images/classes.png')),
                        color:  Color.fromRGBO(143, 148, 251, 1),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("View" ,style: TextStyle(fontSize: 22 ,color: Colors.white),),
                          SizedBox(height: 5,),
                          Text("Classes", style: TextStyle(fontSize: 19 ,color: Colors.white70))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewGrades()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.only(left: 20),
                      height: 120,
                      width: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(alignment: Alignment.centerRight,image: AssetImage('assets/images/grades.png')),
                        color:  Color.fromRGBO(143, 148, 251, 1),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("View" ,style: TextStyle(fontSize: 22 ,color: Colors.white),),
                          SizedBox(height: 5,),
                          Text("Grades", style: TextStyle(fontSize: 19 ,color: Colors.white70))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Feeds()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.only(left: 20),
                      height: 120,
                      width: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(alignment: Alignment.centerRight,image: AssetImage('assets/images/feeds.png')),
                        color:  Color.fromRGBO(143, 148, 251, 1),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Browse" ,style: TextStyle(fontSize: 22 ,color: Colors.white),),
                          SizedBox(height: 5,),
                          Text("Feeds", style: TextStyle(fontSize: 19 ,color: Colors.white70))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Selected Extras" ,style: TextStyle(fontSize: 20 ,color: Colors.black),),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      height: 300,
                      child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.30,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewFeedback()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.grey ,width: 2),
                              ),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Container(
                                     height: 60,
                                     decoration: BoxDecoration(
                                       image: DecorationImage(image: AssetImage('assets/images/feedback1.png' )),
                                     ),
                                   ),
                                   SizedBox(height: 10,),
                                   Text("View Feedback" ,style: TextStyle(fontSize: 17 , ),),
                                 ],
                               ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => edit()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.grey ,width: 2),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/images/Edit.png')),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Edit Profile" ,style: TextStyle(fontSize: 17 , ),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
