import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function konvertHandler;

  Convert({Key? key, required this.konvertHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () => konvertHandler(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(15),
        ),
        child: Text(
          'Konversi Suhu',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
