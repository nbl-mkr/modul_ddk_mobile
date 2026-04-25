import 'package:flutter/material.dart';
import 'latihan1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modul 3'), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Button Latihan 1
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Latihan1()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 1', style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 10),

          // Button Latihan 2
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Latihan1()),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 2', style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 10),

          // Button Latihan 3
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Latihan1()),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 3', style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 10),

          // Button Latihan 4
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Latihan1()),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 4', style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 10),

          // Button Latihan 5
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Latihan1()),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 5', style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 10),

          // Button Latihan 6
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Latihan1()),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 6', style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 10),

          // Button Latihan 7
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Latihan1()),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 7', style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 10),

          // Button Latihan 8
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Latihan1()),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 8', style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 10),

          // Button Latihan 9
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Latihan1()),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 9', style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 10),

          // Button Latihan 10
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Latihan1()),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.black,
              side: BorderSide(color: Color(0xFF000080), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(15),
            ),
            child: Text('Latihan 10', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
