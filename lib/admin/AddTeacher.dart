import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kindergarten/admin/AdminDashboard.dart';


class AddTeacheer extends StatefulWidget {
  const AddTeacheer({Key? key}) : super(key: key);

  @override
  _AddTeacheerState createState() => _AddTeacheerState();
}
TextEditingController NameC = new TextEditingController();
TextEditingController PassrordC = new TextEditingController();
TextEditingController EmailC = new TextEditingController();
late String Class;
final formKey = GlobalKey<FormState>();
class _AddTeacheerState extends State<AddTeacheer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Teacher"),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        ),
        body: Form(
          key: formKey,
          child: Container(
            color: Color.fromRGBO(143, 148, 251, 1),
            width: 500,
            height: 1000,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 10),
                      width: 325,
                      color: Color.fromRGBO(143, 148, 251, 1),
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter Your Name";
                          }
                        },
                        controller: NameC,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person,color: Colors.white,),
                            labelText: 'NAME',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 30),
                      width: 325,
                      color: Color.fromRGBO(143, 148, 251, 1),
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter Email";
                          }
                        },
                        controller: EmailC,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 20),
                      width: 325,
                      color: Color.fromRGBO(143, 148, 251, 1),
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter Password";
                          }
                        },
                        controller: PassrordC,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(

                            prefixIcon: Icon(Icons.password,color: Colors.white,),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )),
                      )),

                  Container(
                    margin: EdgeInsets.only(left: 5, top: 40),
                    color: Color.fromRGBO(143, 148, 251, 1),
                    height: 60,
                    width: 325,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.school,
                            color: Colors.white,
                          ),
                          labelText: "Class",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                      items: ["A", "B", "C"]
                          .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                          .toList(),
                      onChanged: (value) {
                        Class = value.toString();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                          String name = NameC.text;
                          String password = PassrordC.text;
                          String email = EmailC.text;

                          await FirebaseFirestore.instance
                              .collection("teachers")
                              .add(<String, dynamic>{
                            "username": name,
                            "password": password,
                            "email": email,
                            "class": Class,
                            "rule" : "teacher",
                            "age":"",
                            "phone":"",
                            "address":"",
                            "rule" : "teacher"
                          });
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
                        },
                        child: Text("ADD Teacher",style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1),),)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
