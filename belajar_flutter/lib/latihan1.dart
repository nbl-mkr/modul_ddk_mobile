import 'package:flutter/material.dart';
import 'input_widget.dart';
import 'result_widget.dart';
import 'convert_widget.dart';

class Latihan1 extends StatefulWidget {
  @override
  _Latihan1State createState() => _Latihan1State();
}

class _Latihan1State extends State<Latihan1> {
  // Variabel state
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  // TextEditingController untuk mengambil data input dari TextFormField
  TextEditingController _controllerSuhu = TextEditingController();

  // Fungsi konversi suhu
  void _konversiSuhu() {
    setState(() {
      // Ambil input dan convert
      _inputUser = double.tryParse(_controllerSuhu.text) ?? 0;

      // Rumus konversi dari Celcius
      _kelvin = _inputUser + 273.15; // Celcius ke Kelvin
      _reamur = _inputUser * 4 / 5; // Celcius ke Reamur
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Konverter Suhu", style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: [
            Input(etInput: _controllerSuhu),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Result(nama: 'Suhu dalam Kelvin', hasil: _kelvin),
                    SizedBox(width: 16),
                    Result(nama: 'Suhu dalam Reamur', hasil: _reamur),
                  ],
                ),
              ),
            ),
            Convert(konvertHandler: _konversiSuhu),
          ],
        ),
      ),
    );
  }
}
