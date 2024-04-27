import 'package:flutter/material.dart';

class SegitigaPage extends StatefulWidget {
  const SegitigaPage({super.key});

  @override
  State<SegitigaPage> createState() => _SegitigaPageState();
}

class _SegitigaPageState extends State<SegitigaPage> {

  double alas = 0.0;
  double tinggi = 0.0;
  double luas = 0.0;
  double s1=0.0;
  double s2=0.0;
  double s3=0.0;
  double keliling = 0.0;

  void hitungLuas() {
    setState(() {
      luas = 0.5 * alas * tinggi;
    });
  }

  void hitungKeliling() {
    setState(() {
      keliling = s1 + s2 + s3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Penghitung Segitiga",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Bagian LUAS
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LUAS",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Icon(Icons.change_history_outlined, color: Colors.teal.withGreen(350),size: 50.0,),
                    SizedBox(height: 20.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Masukkan Alas',
                        ),
                        onChanged: (String value) {
                          double? parsedValue = double.tryParse(value);
                          if (parsedValue! > 0) {
                            setState(() {
                              alas = parsedValue;
                            });
                          } else {
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
                    SizedBox(height: 8.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Masukkan Tinggi',
                        ),
                        onChanged: (String value) {
                          double? parsedValue = double.tryParse(value);
                          if (parsedValue! > 0) {
                            setState(() {
                              tinggi = parsedValue;
                            });
                          } else {
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
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        hitungLuas();
                      },
                      child: Text('Hitung Luas'),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Luas: $luas',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
              // Bagian KELILING
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "KELILING",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Icon(Icons.change_history_outlined, color: Colors.teal.withGreen(350),size: 50.0,),
                    SizedBox(height: 20.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Masukkan Sisi 1",
                        ),
                        onChanged: (String value) {
                          double? parsedValue = double.tryParse(value);
                          if (parsedValue! > 0) {
                            setState(() {
                              s1 = parsedValue;
                            });
                          } else {
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
                    SizedBox(height: 8.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Masukkan Sisi 2",
                        ),
                        onChanged: (String value) {
                          double? parsedValue = double.tryParse(value);
                          if (parsedValue! > 0) {
                            setState(() {
                              s2 = parsedValue;
                            });
                          } else {
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
                    SizedBox(height: 8.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Masukkan Sisi 3",
                        ),
                        onChanged: (String value) {
                          double? parsedValue = double.tryParse(value);
                          if (parsedValue! > 0) {
                            setState(() {
                              s3 = parsedValue;
                            });
                          } else {
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
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        hitungKeliling();
                      },
                      child: Text('Hitung Keliling'),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Keliling: $keliling',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
