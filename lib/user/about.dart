import 'contact.dart';
import 'Customs.dart';
import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      drawer: drawer(),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Image.network(
                "https://img2.arabpng.com/20180625/xt/kisspng-child-avenues-nursery-logo-clip-art-5b31b44968ec65.7815752015299840734298.jpg"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        child: Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'ABOUT US',
                          style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'ABOUT US',
                          style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Many parents are concerned when their children are not practicing letters and numbers, they feel thast completing paper and pencile exercise will most effectively "
                        "prepare there children for elementary school. To change this common idea our society we are working it iur nursery hand in hand with parents in order to enrichyour child physical and mental development through our Strategy, where tha child can enjoy learning through playing by usingg defferent activities. Our concept is aiming to think widely and independently & work using his/her own hands to prepare him to do pencil& paper work, a step that should come at some atage of preschool education without stressing "
                        "over it.",
                        style:
                            TextStyle(fontSize: 15, fontStyle: FontStyle.italic))
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
                child: Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      'MORE ABOUT THE NURSERY',
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.black,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'MORE ABOUT THE NURSERY',
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 15,),
            Container(
              width: 300,
              height: 60,
              color: Color.fromRGBO(143, 148, 251, 1),
              child: ElevatedButton(
                child: Text("CONTACT US"),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => contact()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
