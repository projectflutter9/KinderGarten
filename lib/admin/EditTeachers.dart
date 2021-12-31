import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindergarten/admin/AdminDashboard.dart';

class EditTeacher extends StatefulWidget {
  const EditTeacher({Key? key}) : super(key: key);

  @override
  _EditTeacherState createState() => _EditTeacherState();
}

TextEditingController NameC = new TextEditingController();
TextEditingController updateName = new TextEditingController();
TextEditingController EmailC = new TextEditingController();
bool found = false;
late String Class;
var id;
var collection = FirebaseFirestore.instance.collection("teachers");
final formKey = GlobalKey<FormState>();
class _EditTeacherState extends State<EditTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Teacher"),
        ),

        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Container(
                            width: 380,
                            color: Colors.white,

                            child: TextFormField(
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please Enter Your Name";
                                }
                              },
                              controller: NameC,
                              decoration: InputDecoration(
                                  labelText: "Teacher Name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromRGBO(143, 148, 251, 1)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(width: 2, color: Colors.blue),
                                  )),
                            )),
                        SizedBox(height: 5,),
                        Container(
                          color: Color.fromRGBO(143, 148, 251, 1),
                          width: 150,
                          height: 50,
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(143, 148, 251, 1),
                                ),
                              ),
                              onPressed: () async {
    if(formKey.currentState!.validate()){
                                var querySnapshot = await collection.get();
                                for (var queryDocumentSnapshot
                                    in querySnapshot.docs) {
                                  Map<String, dynamic> data =
                                      queryDocumentSnapshot.data();
                                  if (data['username'].toString() == NameC.text) {
                                    setState(() {
                                      found = true;
                                    });
                                    id = queryDocumentSnapshot.id;
                                  }
                                }
                                }
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              label: Text("Search")),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        found
                            ? SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 380,
                                        child: TextFormField(
                                          validator: (value){
                                            if(value!.isEmpty){
                                              return "Please Enter Your Name";
                                            }
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Name",
                                            hintStyle: TextStyle(fontSize: 20),
                                            fillColor: Colors.white60,
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                          ),
                                          controller: updateName,
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        width: 380,
                                        child: TextFormField(
                                          validator: (value){
                                            if(value!.isEmpty){
                                              return "Please Enter Your Email";
                                            }
                                          },
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            hintText: "Email",
                                            hintStyle: TextStyle(fontSize: 20),
                                            fillColor: Colors.white60,
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                          ),
                                          controller: EmailC,
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 40),
                                      color:Colors.white,
                                      height: 60,
                                      width: 325,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.school,
                                              color:  Color.fromRGBO(143, 148, 251, 1),
                                            ),
                                            labelText: "Class",
                                            labelStyle: TextStyle(
                                              color:  Color.fromRGBO(143, 148, 251, 1),
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
                                      width: 150,
                                      height: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Color.fromRGBO(143, 148, 251, 1),
                                          ),
                                          child: Text(
                                            "Save New Data",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                          onPressed: () {
                                    if(formKey.currentState!.validate()){
                                            String name = updateName.text;
                                            String email = EmailC.text;
                                            collection
                                                .doc(id)
                                                .update(<String, dynamic>{
                                              "username": "$name",
                                              "class": Class,
                                              "email": "$email",
                                            });
                                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
                                          }
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            : Text("Please Enter right name")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
