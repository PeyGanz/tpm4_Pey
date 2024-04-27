import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas2_tpm_kelompok/main.dart';
import 'package:tugas2_tpm_kelompok/memberpage.dart';
import 'package:tugas2_tpm_kelompok/prima.dart';
import 'package:tugas2_tpm_kelompok/segitiga.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //logindata SharedPreferences
  late SharedPreferences logindata;
  late String username = "";

  @override
  void initState(){
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  void logout() {
    logindata.setBool('login', true);
    logindata.remove('username');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Utama",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        actions: [
          TextButton(
            onPressed: () {
              logout();
            },
            child: Text(
              "LOGOUT",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          IconButton(onPressed: () {
            logout();
          }, icon: Icon(Icons.logout_sharp))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Halo $username!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataKelompok(),));
              },
              child: Text(
                'Daftar Anggota',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(
                  MediaQuery.of(context).size.width*0.6,40,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrimaPage(),));
              },
              child: Text(
                'Bilangan Prima',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.withOpacity(0.5),
                minimumSize: Size(
                  MediaQuery.of(context).size.width*0.6,40,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SegitigaPage(),));
              },
              child: Text(
                'Hitung Segitiga',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.withOpacity(0.5),
                minimumSize: Size(
                  MediaQuery.of(context).size.width*0.6,40,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                // Tombol Daftar Situs ditekan
              },
              child: Text(
                'Daftar Situs',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.withGreen(100),
                minimumSize: Size(
                  MediaQuery.of(context).size.width*0.6,40,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                // Tombol Daftar Favorit ditekan
              },
              child: Text(
                'Daftar Favorit',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.withGreen(100),
                minimumSize: Size(
                  MediaQuery.of(context).size.width*0.6,40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
