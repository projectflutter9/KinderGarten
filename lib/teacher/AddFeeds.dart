import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kindergarten/Constants.dart';
import 'package:kindergarten/teacher/Customs.dart';
import 'package:kindergarten/teacher/HomePage.dart';


class AddFeeds extends StatefulWidget {

  @override
  _AddFeedsState createState() => _AddFeedsState();
}

class _AddFeedsState extends State<AddFeeds> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Add Announcement"),
          ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
             Container(
                 width: MediaQuery.of(context).size.width,
                 height: 300,
                 child: Image.asset('assets/images/addfeeds.png',fit: BoxFit.cover,)),
              SizedBox(height: 80,),
              Text("Post Details" , style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold),),
              CustomTextfield(htext: 'Enter Title', type: TextInputType.name ,secure: false,cONtroller:titleController, validation: 'Please Enter Title' ,),
              SizedBox(height: 10,),
              CustomTextfield(htext: 'Enter Description', type: TextInputType.name ,secure: false,cONtroller:descriptionController, validation: 'Please Enter Description' ,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
    if(formKey.currentState!.validate()){
                    String title = titleController.text;
                    String description = descriptionController.text;
                    FirebaseFirestore.instance.collection("Feeds").add(
                        <String, dynamic>{
                          "Teacher Name": "$teacher_name",
                          "Title" : "$title",
                          "Description" : "$description",
                        }
                    );

                    Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomePage()));
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors:[
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6)
                            ]
                        )
                    ),
                    child: Center(
                      child: Text("Add Post" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
