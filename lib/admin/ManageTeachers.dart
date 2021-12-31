import 'package:flutter/material.dart';
import 'package:kindergarten/admin/AddTeacher.dart';
import 'package:kindergarten/admin/EditTeachers.dart';
import 'package:kindergarten/admin/ViewTeacher.dart';


class ManageTeachers extends StatefulWidget {
  const ManageTeachers({Key? key}) : super(key: key);

  @override
  _ManageTeachersState createState() => _ManageTeachersState();
}

class _ManageTeachersState extends State<ManageTeachers> {
  @override
  int number = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Teachers'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text('Add'),
              backgroundColor: Color.fromRGBO(143, 148, 251, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              title: Text('Viwe /Delete'),
              backgroundColor: Color.fromRGBO(143, 148, 251, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              title: Text('Edit'),
              backgroundColor: Color.fromRGBO(143, 148, 251, 1)),
        ],
        onTap: (value) async {
          setState(() {
            number = value;
          });
          if (value == 0) {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTeacheer()));
            });
          } else if (value == 1) {
            setState(() {});
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ViewTeacher()));
          } else if (value == 2) {
            setState(() {});
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditTeacher()));
          }
        },
        selectedItemColor: Color.fromRGBO(143, 148, 251, 1),
        currentIndex: number,
      ),
      body: Container(
        child: Image.asset(
          "assets/images/ManageTeacher.png",
          width: 500,
          height: 710,
        ),
      ),
    );
  }
}
