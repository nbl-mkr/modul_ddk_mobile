import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.nama, required this.hasil})
    : super(key: key);

  final String nama;
  final double hasil;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(nama),
          SizedBox(height: 8),
          Text(
            hasil.toStringAsFixed(2),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
