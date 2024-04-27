// ------------- KLAZ -----------------------------------------
import 'package:flutter/material.dart';

class DataKelompok extends StatelessWidget {

  final List<Map<String, dynamic>> people = [
    {
      'name': 'Muhammad Abdanul Ikhlas',
      'nim': '123210009',
      'picture': 'images/ikhlas.png'
    },
    {
      'name': 'Muhammad Harish Wijaya',
      'nim': '123210011',
      'picture': 'images/haris.jpeg'
    },
    {
      'name': 'Yoga Agatha Pasaribu',
      'nim': '123210025',
      'picture': 'images/yoga.jpeg'
    },
  ];

  DataKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Kelompok",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage(people[index]['picture']),
                            radius: 30,
                          ),
                          SizedBox(width: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                people[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'NIM: ${people[index]['nim']}',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}