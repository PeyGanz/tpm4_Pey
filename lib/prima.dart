import 'package:flutter/material.dart';

class PrimaPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PrimaPage> {
  final _controller = TextEditingController();
  String _prima = '';

  void _cekPrima() {
    double n = double.tryParse(_controller.text) ?? 0;
    // int n = int.tryParse(_controller.text) ?? 0;
    if (n.isNaN) {
      _prima = 'Input tidak valid';
      return;
    }

    if (n.truncate() != n) {
      _prima = '\nBilangan desimal tidak termasuk bilangan prima';
    } else {
      if (n <= 1) {
        _prima = '${n.toInt()} bukan bilangan prima';
      } else {
        bool prima = true;
        for (int i = 2; i <= n / 2; i++) {
          if (n % i == 0) {
            prima = false;
            break;
          }
        }
        _prima = '${n.toInt()} ${prima ? 'adalah bilangan prima' : 'bukan bilangan prima'}';
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Bilangan Prima",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250.0, // Atur lebar sesuai kebutuhan Anda
              child: TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  double? parsedValue = double.tryParse(value);
                  if (parsedValue! <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Input harus positif'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: _cekPrima,
              child: Text('Cek Bilangan Prima'),
            ),
            SizedBox(height: 20),
            Text(_prima),
          ],
        ),
      ),
    );
  }
}
