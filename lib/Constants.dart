import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

String fatherName ="";
String user_id = "";
String userEmail = "";
String teacher_name = "" ;
bool check = true;
GetImageFromFireBase() async{
  if (userEmail == ""){
    return "http://www.markuslaforsch.org/wp-content/plugins/lightbox/images/No-image-found.jpg";
  }
  else {
    final ref = FirebaseStorage.instance.ref("folderName/${userEmail}");
// no need of the file extension, the name will do fine.
    var url = await ref.getDownloadURL();
    return url;
  }
}
