import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindergarten/teacher/HomePage.dart';

class AddGrades extends StatelessWidget {
  @override
  TextEditingController SubjectC = new TextEditingController();
  TextEditingController GradeC = new TextEditingController();
  TextEditingController DateC = new TextEditingController();
  TextEditingController NameC = new TextEditingController();
  var id;
  late String subject;
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Add Children Grades"),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      body: Form(
        key: formKey,
        child: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/AddGrades.jpg",
                  fit: BoxFit.fill,
                  width: 500,
                  height: 710,
                ),

                Container(
                    width: 350,
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 35, top: 5),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Enter Child Name";
                        }
                      },
                      controller: NameC,
                      decoration: InputDecoration(
                          labelText: 'Child Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(143, 148, 251, 1)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.blue),
                          )),
                    )), //child name
                Container(
                  margin: EdgeInsets.only(left: 35, right: 20, top: 70),
                  color: Colors.white,
                  height: 60,
                  width: 350,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        labelText: "Subject",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Color.fromRGBO(143, 148, 251, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                        )),
                    items: ["Arabic", "Englsih", "Maths"]
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      subject = value.toString();
                    },
                  ),
                ), // 1ist subject
                Row(
                  children: [
                    Container(
                        width: 170,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 35.0, top: 140),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Quiz Grade";
                            }
                          },
                          controller: GradeC,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              labelText: 'Quiz Grade',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.blue),
                              )),
                        )), //1st grade
                    Container(
                        width: 170,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 10.0, top: 140),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Quiz Date";
                            }
                          },
                          controller: DateC,
                          decoration: InputDecoration(
                              labelText: 'Quiz Date',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.blue),
                              )),
                        )), //1st date
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(left: 55, right: 20, top: 220),
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
    if(formKey.currentState!.validate()){
                        String name = NameC.text;
                        String date = DateC.text;
                        String grade = GradeC.text;
                        FirebaseFirestore.instance
                            .collection("Grades")
                            .add(<String, dynamic>{
                          "name": name,
                          "date": date,
                          "grade": grade,
                          "subject": subject
                        });
                        }
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherHomePage()));

                      },
                      child: Text("Add grade")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
