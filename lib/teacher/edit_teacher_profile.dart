import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindergarten/Constants.dart';
import 'package:kindergarten/teacher/HomePage.dart';

class edit_teacher extends StatefulWidget {

  @override
  _edit_teacherState createState() => _edit_teacherState();
}

class _edit_teacherState extends State<edit_teacher> {
  dynamic x;

  int xx = 0;

  bool isPasswordTextField=true;

  String dropdownValue = 'One';
  final formKey = GlobalKey<FormState>();


  TextEditingController n1= TextEditingController();
  TextEditingController n2= TextEditingController();
  TextEditingController n3= TextEditingController();
  TextEditingController n4= TextEditingController();
  TextEditingController n5= TextEditingController();
  TextEditingController n6= TextEditingController();
  TextEditingController n7= TextEditingController();
  String Value='';
  late String Class;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"),),
    body: FutureBuilder(

        future:FirebaseFirestore.instance.collection('teachers').where('email', isEqualTo: userEmail).get(),
      builder: (context, AsyncSnapshot<dynamic>  snapshot) {

        if (snapshot.hasData == false) {
          return Center(child: CircularProgressIndicator());
        }
        else{
          return Form(
            key: formKey,
            child: ListView(
              children:[
                Column(
                  children: [
                    Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),
                        ),
                        color: Color.fromRGBO(143, 148, 251, 1),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top:80,
                            left: 0,
                            child: Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  )
                              ),
                            ),
                          ),
                          Positioned(
                              top: 110,
                              left: 20,
                              child: Text("Teacher Edit Profile",style: TextStyle(fontSize: 28,color:Color.fromRGBO(143, 148, 251, 1), ),))
                        ],
                      ),
                    ),

                    SizedBox(height: 30,),
                    buildTextField("UserName",'${snapshot.data.docs[0]["username"]}', n1 , false,"Please Enter UserName"),
                    buildTextField("PassWord", '${snapshot.data.docs[0]["password"]}', n2 , true , "Please Enter Password"),
                    buildTextField("Age", '${snapshot.data.docs[0]["age"]}', n3 , false , "Please Enter Age"),
                    buildTextField("E-mail", '${snapshot.data.docs[0]["email"]}', n4, false ,"Please Enter Email"),
                    buildTextField("Phone", '${snapshot.data.docs[0]["phone"]}', n5 , false,"Please Enter Phone"),
                    buildTextField("Address", '${snapshot.data.docs[0]["address"]}',n6 , false , "Please Enter Address"),


                    SizedBox(height: 15,),

                    Container(
                      width: 200,
                      child: MaterialButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            String username = n1.text;
                            String password = n2.text;
                            String age = n3.text;
                            String email = n4.text;
                            String phone = n5.text;
                            String address = n6.text;

                            FirebaseFirestore.instance.collection("teachers").doc(user_id).update(<String,dynamic>{
                              "username":"$username",
                              "password":"$password",
                              "age":"$age",
                              "email":"$email",
                              "phone":"$phone",
                              "address":"$address",
                            });
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherHomePage()));
                        },
                        height: 60 ,
                        child: Text("Save Changes",style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(143, 148, 251, 1),

                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ],
            ),
          );
        }

      }
    ),
    );
  }

  Widget buildTextField(String labelText, String placeholder ,TextEditingController x , bool isPasswordTextField ,String validator ){
    return Padding(padding: EdgeInsets.all( 20),
      child:TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return "$validator";
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


