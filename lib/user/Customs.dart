import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kindergarten/user/ViewFeedBack.dart';
import 'package:kindergarten/user/userProfile.dart';
import '../Constants.dart';
import 'about.dart';
import 'contact.dart';
import 'edit_profile.dart';
import 'feedback.dart';
import '../login.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({Key? key, required this.htext, required this.secure, required this.type, required this.cONtroller, required this.validation}) : super(key: key);
final String htext;
final bool secure;
final TextInputType type;
final TextEditingController cONtroller;
final String validation;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return "$validation";
          }
        },
        controller: cONtroller ,
        obscureText: secure,
        keyboardType: type ,
        decoration: InputDecoration(

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color:  Color.fromRGBO(143, 148, 251, 1)),
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: htext,
            labelStyle: TextStyle(
                color: Colors.grey[400]
            )
        ),
      ),
    );
  }
}

class drawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 125,
                decoration: BoxDecoration(
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Color.fromRGBO(143, 148, 251, 1),
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0,

                        // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(3),
                  color: Color.fromRGBO(143, 148, 251, 1),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    FutureBuilder(
                        future : GetImageFromFireBase(),
                        builder: (context ,AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData == false) {
                            return Center(child: CircularProgressIndicator());
                          }
                          else{
                            return CircleAvatar(
                            radius: 30,
                            backgroundImage:NetworkImage(snapshot.data),
                            backgroundColor: Colors.white,
                          );
                          }

                      }
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FutureBuilder(
                        future:FirebaseFirestore.instance.collection('users').where('Father Name', isEqualTo: fatherName).get(),
                      builder: (context,  AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData == false) {
                          return CircularProgressIndicator();
                        }else{
                                return Text(
                                            "${snapshot.data.docs[0]["Father Name"]}",
                                                      style: TextStyle(fontWeight: FontWeight.bold));
                               }
                        }

                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 900,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle_rounded, size: 30, color: Colors.black),
                  title: Text(" My Profile",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>profile1() ));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.warning, size: 30, color: Colors.black),
                  title: Text("About Us",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => about()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.call, size: 30, color: Colors.black),
                  title: Text(
                    "Contact Us",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => contact()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.mail, size: 30, color: Colors.black),
                  title: Text("Feedback",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewFeedback()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, size: 30, color: Colors.black),
                  title: Text("Log Out",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () async{
                    await FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Login())));
                    fatherName = "";
                    user_id = "";
                    userEmail = "";


                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMaterial extends StatelessWidget {
  CustomMaterial({required this.image ,required this.fatherName ,required this.body});
  String image;
  String fatherName;
  String body;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      shadowColor:Color.fromRGBO(143, 148, 251, 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:[
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(image),
                ),
                SizedBox(width: 20,),
                Text(fatherName,style: TextStyle(color: Colors.black,fontSize: 18),),
                SizedBox(width: 60,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text( body),
            ),
          ],
        ),
      ),
    );

  }
}



class buildTextField extends StatelessWidget {
  const buildTextField({Key? key, required this.labelText, required this.placeholder, required this.x, required this.isPasswordTextField, required this.validation}) : super(key: key);
  final String labelText;
 final String placeholder;
  final TextEditingController x ;
 final  bool isPasswordTextField ;
 final  String validation;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all( 20),
      child:TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return "$validation";
          }
        },
        controller: x,
        obscureText: isPasswordTextField ? true: false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ? IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye),) : null ,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(143, 148, 251, 1)
            )
        ),

      ),
    );
  }
}


