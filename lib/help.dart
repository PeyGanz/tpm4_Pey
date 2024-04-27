import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Bantuan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panduan Penggunaan Aplikasi:',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Setelah berhasil login, terdapat 5 menu utama yang dapat anda pilih. Daftar anggota merupakan sosok admin. Pada menu bil prima anda dapat mengecek nilai bilangan yang termasuk prima. Pada hitung segitiga anda dapat menghitung luas dan keliling. Terdapat juga list situs rekomendasi yang bisa anda tambahkan ke daftar favorit',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8.0),
            Text(
              '2. Pada bottom navigation terdapat juga opsi untuk akses menu yang diinginkan.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8.0),
            Text(
              '3. Pada aplikasi stopwatch, Anda dapat memulai, menghentikan, dan mengatur waktu stopwatch.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8.0),
            Text(
              '4.  Anda dapat juga menambahkan atau menghapus daftar/situs favorit sesuai keinginan anda.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}