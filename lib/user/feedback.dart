import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kindergarten/Constants.dart';
import 'package:kindergarten/user/HomePage.dart';

class AddFeedback extends StatefulWidget {
  @override
  _AddFeedbackState createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: Form(
          key: formKey,
          child: Container(
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 90,
                  color: Color.fromRGBO(143, 148, 251, 1),
                  child: Column(
                    children: [
                      Container(
                          child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'FEEDBACK',
                            style: TextStyle(
                              fontSize: 30,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Color.fromRGBO(143, 148, 251, 1),
                            ),
                          ),
                          // Solid text as fill.
                          Text(
                            'FEEDBACK',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey[100],
                            ),
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "We want to know what you thought of your experiance.. ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        child: Text("so we'd love to hear your feedback",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 300,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Enter title";
                        }
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                          labelText: 'Title',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(143, 148, 251, 1)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 300,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Enter Body";
                        }
                      },
                      controller: messageController,
                      maxLines: 10,
                      decoration: InputDecoration(
                          labelText: ' Message',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(143, 148, 251, 1)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 60,
                  color: Color.fromRGBO(143, 148, 251, 1),
                  child: ElevatedButton(
                    child: Text("Send FeedBack"),
                    onPressed: () {
          if(formKey.currentState!.validate()){
                        String title  = titleController.text;
                        String message = messageController.text;
                        String email = userEmail;
                        FirebaseFirestore.instance.collection("All Feedback").add(
                          <String , dynamic>{
                            "Title" :"$title",
                            "Message" : "$message",
                            "Email" : "$email",
                          }
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
