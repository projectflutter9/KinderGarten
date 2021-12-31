import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kindergarten/Constants.dart';
import 'package:kindergarten/user/edit_profile.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:nursery_system/edit_user_profile.dart';

class profile1 extends StatefulWidget {
  @override
  _profile1State createState() => _profile1State();
}

class _profile1State extends State<profile1> {

  // dynamic x;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),


        title: Text("Profiles",style: TextStyle(fontSize: 25),),


      ),
      body:FutureBuilder(
            future:FirebaseFirestore.instance.collection('users').where('Father Name', isEqualTo: fatherName).get(),
            builder: (context , AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData == false) {
                return Column(
                  children: [
                    CircularProgressIndicator(),
                    Text("No Data")
                  ],
                );
              }
              else{
                return ListView.builder(
                    itemBuilder: (context , index){
                  return Column(
                    children:[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Stack(
                              overflow: Overflow.visible,
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/userprofile.png'),
                                  height: MediaQuery.of(context).size.height/2.9,
                                  fit: BoxFit.cover,
                                ),
                                FutureBuilder(
                                    future : GetImageFromFireBase(),
                                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                                   if(snapshot.hasData){
                                     return Positioned(
                                       bottom: -80,
                                       child: CircleAvatar(
                                         radius: 70,
                                         backgroundImage:NetworkImage(snapshot.data),
                                         backgroundColor: Colors.white,
                                       ),
                                     );
                                   }else{
                                     return Positioned(
                                       bottom: -80,
                                       child: CircularProgressIndicator()
                                     );
                                   }

                                  }
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),



                      SizedBox(height: 80,),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${snapshot.data.docs[0]["Father Name"]}",style: TextStyle(fontSize: 25,),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.child_care,color: Colors.white,),
                                    SizedBox(width: 50,),
                                    Text("${snapshot.data.docs[0]["Child Name"]}",style: TextStyle(fontSize: 25,color: Colors.white),),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(143, 148, 251, 1),
                              ),
                            ),
                            SizedBox(height: 10,),

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.phone,color: Colors.white,),
                                    SizedBox(width: 50,),
                                    Text("${snapshot.data.docs[0]["Phone Number"]} ",style: TextStyle(fontSize: 25,color: Colors.white),),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(143, 148, 251, 1),
                              ),
                            ),
                            SizedBox(height: 10,),

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.today,color: Colors.white,),
                                    SizedBox(width: 50,),
                                    Text("Age: ${snapshot.data.docs[0]["Age"]} ",style: TextStyle(fontSize: 25,color: Colors.white),),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(143, 148, 251, 1),
                              ),
                            ),
                            SizedBox(height: 10,),

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Row(
                                    children: [
                                      Icon(Icons.mail_outline,color: Colors.white,),
                                      SizedBox(width: 20,),
                                      Text("mail: ${snapshot.data.docs[0]["Email"]}",style: TextStyle(fontSize: 22,color: Colors.white),),
                                    ],
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(143, 148, 251, 1),
                              ),
                            ),
                            SizedBox(height: 10,),



                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,color: Colors.white,),
                                    SizedBox(width: 20,),
                                    Text("Address: ${snapshot.data.docs[0]["Address"]} ",style: TextStyle(fontSize: 22,color: Colors.white),),
                                  ],
                                ),

                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(143, 148, 251, 1),
                              ),
                            ),
                            SizedBox(height: 20,),

                            Container(
                              width: 200,
                              child: MaterialButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder:(context)=>edit() ));

                                },
                                height: 60 ,
                                child: Text("Edit Profile",style: TextStyle(color: Colors.white,fontSize: 20),),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,

                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  );
                },
                  itemCount: 1,
                );
              }
            }
      )

    );
  }
}