// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas2_tpm_kelompok/homepage.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  loginMenu createState() => loginMenu();
}

class loginMenu extends State<loginPage> {

  // Untuk akses nilai inputan
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  //Modul
  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState(){
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print("new user = $newuser");
    if(newuser==false){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
    }
  }

  @override
  void dispose(){
    userC.dispose();
    passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LOGIN MENU",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('TUGAS TPM 4',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500)),
                Icon(Icons.join_full, size: 100),
                const SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0), // Penambahan padding sumbu x
                  child: TextField(
                    controller: userC,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0), // Penambahan padding sumbu x
                  child: TextField(
                    controller: passC,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  child: const Text('Login'),
                  onPressed:() {
                    String getName=userC.text;
                    String getPass=passC.text;
                    if(getName!="" && getPass=="tugas4"){
                      print("LOGIN SUCCESFULL");
                      logindata.setBool('login', false);
                      logindata.setString('username', getName);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Incorrect username or password.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}