
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:kindergarten/Constants.dart';
import 'package:kindergarten/user/Customs.dart';
import 'package:kindergarten/user/HomePage.dart';

class edit extends StatefulWidget {

  @override
  _editState createState() => _editState();
}

class _editState extends State<edit> {

  dynamic x;
  var id;
  dynamic b;
  bool found = false;
  final storage = FirebaseStorage.instance;
  TextEditingController fnameController= TextEditingController();
  TextEditingController cnameController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController addressController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController ageController= TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),

        title: Text("Edit Profile",style: TextStyle(fontSize: 25),),

      ),
      body: FutureBuilder(
          future:FirebaseFirestore.instance.collection('users').where('Email', isEqualTo: userEmail).get(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData == false) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            return Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      FutureBuilder(
                          future : GetImageFromFireBase(),
                        builder: (context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData == false) {
                            return Center(child: CircularProgressIndicator());
                          }else{
                            return CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(snapshot.data),
                            );
                          }

                        }
                      ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox.fromSize(
                                      size: Size(70, 70), // button width and height
                                      child: ClipOval(
                                        child: Material(
                                          color:  Color.fromRGBO(143, 148, 251, 1), // button color
                                          child: InkWell(
                                            splashColor: Colors.black, // splash color
                                            onTap: () async{
                                              getImageFromCamera();
                                            }, // button pressed
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.camera_alt_rounded), // icon
                                                Text("Camera"), // text
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("Choose from camera"),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: [
                                    SizedBox.fromSize(
                                      size: Size(70, 70), // button width and height
                                      child: ClipOval(
                                        child: Material(
                                          color:  Color.fromRGBO(143, 148, 251, 1), // button color
                                          child: InkWell(
                                            splashColor: Colors.black, // splash color
                                            onTap: () async{
                                              getImageFromGallery();
                                            }, // button pressed
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.image_outlined), // icon
                                                Text("Gallery"), // text
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("Choose from gallery"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 5,
                      ),

                      buildTextField(validation: 'Please Enter Father Name', placeholder: '${snapshot.data.docs[0]["Father Name"]}', labelText: 'Father Name', isPasswordTextField: false, x:fnameController ,),
                      buildTextField(validation: 'Please Enter Child Name', placeholder: '${snapshot.data.docs[0]["Child Name"]}', labelText: 'Child Name', isPasswordTextField: false, x:cnameController ,),
                      buildTextField(validation: 'Please Enter Password', placeholder: '********', labelText: 'PassWord', isPasswordTextField: true, x: passwordController,),
                      buildTextField(validation: 'Please Enter Phone Number', placeholder: '${snapshot.data.docs[0]["Phone Number"]}', labelText: 'Phone Number', isPasswordTextField: false, x:phoneController ,),
                      buildTextField(validation: 'Please Enter Address', placeholder: '${snapshot.data.docs[0]["Address"]}', labelText: 'Address', isPasswordTextField: false, x:addressController ,),
                      buildTextField(validation: 'Please Enter Address', placeholder: '${snapshot.data.docs[0]["Email"]}', labelText: 'E-mail', isPasswordTextField: false, x: emailController,),
                      buildTextField(validation: 'Please Enter Age', placeholder: '${snapshot.data.docs[0]["Age"]}', labelText: 'Age', isPasswordTextField: false, x: ageController,),



                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        width: 200,
                        child: MaterialButton(
                          onPressed: (){
          if(formKey.currentState!.validate()){
                            String fname = fnameController.text;
                            String cname = cnameController.text;
                            String age = ageController.text;
                            String number = phoneController.text;
                            String address = addressController.text;
                            String email = emailController.text;
                            String pass = passwordController.text;

                            FirebaseFirestore.instance.collection("users").doc(user_id).update(
                                <String, dynamic>{
                                  "Father Name": "$fname",
                                  "Child Name" : "$cname",
                                  "Age" : "$age",
                                  "Phone Number" : "$number",
                                  "Address" : "$address",
                                  "Email": "$email",
                                  "Password": "$pass",
                                }
                            );
                            uploadImageToFireBase();
                            fatherName = fname.toString();
                            user_id = id.toString();
                            userEmail = email.toString();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            }
                          },
                          height: 60 ,
                          child: Text("Save Changes",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(143, 148, 251, 1),

                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }

        }
      ),
    );
  }
  getImageFromCamera ()async{
    ImagePicker a =new ImagePicker();
    b = await a.getImage(source: ImageSource.camera);
    setState(() {
      x=File(b.path);
    });
  }
  getImageFromGallery ()async{
    ImagePicker a =new ImagePicker();
    b = await a.getImage(source: ImageSource.gallery);
    setState(() {
      x=File(b.path);
    });
  }
  uploadImageToFireBase()async{
    if(b != null){
      //upload to firebase
      var snapshot = await storage.ref().child('folderName/${emailController.text}').putFile(x).whenComplete(() {});
      var downloadUrl = await snapshot.ref.getDownloadURL();
    }else{
      print("No Path Recieved");
    }
  }
}
