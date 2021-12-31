import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'Customs.dart';
import '../login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  late PickedFile image;
  final storage = FirebaseStorage.instance;
  TextEditingController fnameController = new TextEditingController();
  TextEditingController cnameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  dynamic x;
  dynamic b;
  String imageUrl ="";
  bool save = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill
                  )
              ),
              child: Stack(
                children: [
                  Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child:Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/light-1.png')
                            )
                        ),
                      )
                  ),
                  Positioned(
                      width: 80,
                      height: 150,
                      left: 30,
                      bottom: 70,
                      child:Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/cat.png')
                            )
                        ),
                      )
                  ),
                  Positioned(
                      width: 80,
                      height: 150,
                      right: 40,
                      top: 40,
                      child:Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/baby-1.png')
                            )
                        ),
                      )
                  ),
                  Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text("Sign Up" ,style: TextStyle(
                              color: Colors.white,fontSize: 40 ,fontWeight: FontWeight.bold
                          ),),
                        ),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            CustomTextfield(htext: 'Parent Name', cONtroller:fnameController, secure: false, type: TextInputType.name, validation: 'Please Enter Parent Name' , ),
            SizedBox(height: 10,),
            CustomTextfield(htext: 'Child Name', cONtroller:cnameController, secure: false, type: TextInputType.name, validation: 'Please Enter Child Name' , ),
            SizedBox(height: 10,),
            CustomTextfield(htext: 'Age', cONtroller:ageController, secure: false, type: TextInputType.number, validation: 'Please Enter Age' , ),
            SizedBox(height: 10,),
            CustomTextfield(htext: 'Phone Number', cONtroller:phoneController, secure: false, type: TextInputType.phone, validation: 'Please Enter Phone Number' , ),
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Please Choose Photo",style: TextStyle(fontSize: 20),),
                ),
                SizedBox(width: 10,),
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
                SizedBox(width: 10,),
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
                )
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(height: 10,),
            CustomTextfield(htext: 'Address', cONtroller:addressController, secure: false, type: TextInputType.name, validation: 'Please Enter Address' , ),
            SizedBox(height: 10,),
            CustomTextfield(htext: 'Email', cONtroller:emailController, secure: false, type: TextInputType.emailAddress, validation: 'Please Enter Email' , ),
            SizedBox(height: 10,),
            CustomTextfield(htext: 'Password', cONtroller:passwordController, secure: true, type: TextInputType.visiblePassword, validation: 'Please Enter Password' , ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){
    if(formKey.currentState!.validate()){
                  String fname = fnameController.text;
                  String cname = cnameController.text;
                  String age = ageController.text;
                  String number = phoneController.text;
                  String address = addressController.text;
                  String email = emailController.text;
                  String pass = passwordController.text;

                  FirebaseFirestore.instance.collection("users").add(
                      <String, dynamic>{
                        "Father Name": "$fname",
                        "Child Name" : "$cname",
                        "Age" : "$age",
                        "Phone Number" : "$number",
                        "Address" : "$address",
                        "Email": "$email",
                        "Password": "$pass",
                        "Class" : "",
                        "rule"  : "user"
                      }
                  );
                  uploadImageToFireBase();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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
                    child: Text("Sign Up" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                },
                child: Center(child: Text("DO YOU HAVE EMAIL" , style: TextStyle(color:   Color.fromRGBO(143, 148, 251, 1) , fontSize: 15 ),)))


          ],
        ),
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
      print("No Path Recieved}");
    }
  }
}
