import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kindergarten/admin/AdminDashboard.dart';
import 'package:kindergarten/teacher/HomePage.dart';
import 'package:kindergarten/user/Signup.dart';
import 'Constants.dart';
import 'user/Customs.dart';
import 'user/HomePage.dart';
import 'user/edit_profile.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  var id;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
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
                           child: Text("login" ,style: TextStyle(
                             color: Colors.white,fontSize: 40 ,fontWeight: FontWeight.bold
                           ),),
                         ),
                       )
                       ),
                     ],
                   ),
                 ),
                 Padding(
                     padding: EdgeInsets.all(30.0),
                   child: Column(
                     children: [
                       Container(
                         padding: EdgeInsets.all(5),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(10),
                           boxShadow: [
                             BoxShadow(
                               color: Color.fromRGBO(143, 148, 251, .2 ),
                               blurRadius: 20.0,
                               offset: Offset(0,10)

                             )
                           ]

                         ),
                         child: Column(
                           children: [
                             CustomTextfield(htext: 'Email', type: TextInputType.emailAddress ,secure: false, cONtroller: emailController, validation: 'Please Enter Email',),
                             CustomTextfield(htext: 'Password', type: TextInputType.visiblePassword ,secure: true,cONtroller: passwordController, validation: 'Please Enter Password',),
                           ],
                         ),
                       ),
                        SizedBox(height: 30,),
                       InkWell(
                         onTap: ()async{
                           if(formKey.currentState!.validate()){
                             setState(() {
                               check = true;
                             });
                             var usercollection = FirebaseFirestore.instance.collection("users");
                             var userquerysnapshot = await usercollection.get();
                             for (var userqueryDocumentSnapshot in userquerysnapshot.docs){
                               Map<String ,dynamic> data = userqueryDocumentSnapshot.data() as Map<String, dynamic>;
                               if (data['Email'].toString() == emailController.text && data['Password'].toString()==passwordController.text && data['rule'].toString()=="user" && check){
                                 id = userqueryDocumentSnapshot.id;
                                 var fname = data['Father Name'];
                                 var email = data['Email'];
                                 fatherName = fname.toString();
                                 userEmail = email;
                                 user_id = id.toString();
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                                 setState(() {
                                   check = false;
                                 });


                               }
                             }

                             var teachercollection = FirebaseFirestore.instance.collection("teachers");
                             var teacherquerySnapshotl = await teachercollection.get();
                             for (var teacherqueryDocumentSnapshot in teacherquerySnapshotl.docs){
                               Map<String ,dynamic> data = teacherqueryDocumentSnapshot.data() as Map<String, dynamic>;
                               if (data['email'].toString() == emailController.text && data['password'].toString()==passwordController.text && data['rule'].toString()=="teacher"&& check){
                                 id = teacherqueryDocumentSnapshot.id;
                                 var email = data['email'];
                                 userEmail = email;
                                 user_id = id.toString();
                                 teacher_name = data['username'];
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherHomePage()));
                                 setState(() {
                                   check = false;
                                 });
                               }

                             }
                             var getcollectionadmin = FirebaseFirestore.instance.collection("admin");
                             var querySnapshotadmin = await getcollectionadmin.get();
                             bool foundcorrect = false;
                             int flag =0;
                             for (var queryDocumentSnapshot in querySnapshotadmin.docs){

                               Map<String ,dynamic> data = queryDocumentSnapshot.data() as Map<String, dynamic>;
                               if (data['Email'].toString() == "admin@gmail.com" && data['Password'].toString()=="admin" && data['rule'].toString() == "admin" &&check){
                                 id = queryDocumentSnapshot.id;
                                 foundcorrect = true;
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminHomePage()));
                                 print(foundcorrect);
                                 setState(() {
                                   check = false;
                                 });
                               }
                             }


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
                             child: Text("Login" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                           ),
                         ),
                       ),
                       SizedBox(height: 70,),
                       InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                           },
                           child: Text("I DON'T HAVE EMAIL" , style: TextStyle(color:   Color.fromRGBO(143, 148, 251, 1) , fontSize: 15 ),))
                     ],
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


