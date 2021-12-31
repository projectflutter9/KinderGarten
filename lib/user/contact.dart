import 'package:flutter/material.dart';
import 'location.dart';

//import 'Customs.dart';

class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        ),
        drawer: Drawer(),
        body: Container(
            color: Color.fromRGBO(143, 148, 251, 1),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      'How Can We Help You?',
                      style: TextStyle(
                        fontSize: 35,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.black,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'How Can We Help You?',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Image.network(
                      "https://icon-library.com/images/customer-service-icon/customer-service-icon-22.jpg",
                      width: 150,
                      height: 125,
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 15,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          '0225506458',
                          style: TextStyle(
                            fontSize: 15,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          '0225506458',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Divider(
                  color: Colors.black,
                ),
                Column(
                  children: [
                    Image.network(
                      "https://www.designbust.com/download/1026/png/email_icon_transparent_background512.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'babygarden@gmail.com',
                          style: TextStyle(
                            fontSize: 15,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'babygarden@gmail.com',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Divider(
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>location() ));
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://i.dlpng.com/static/png/6947199_preview.png",
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'LOCATION',
                            style: TextStyle(
                              fontSize: 15,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.black,
                            ),
                          ),
                          // Solid text as fill.
                          Text(
                            'LOCATION',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[100],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}