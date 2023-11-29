import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/mylistview.dart';
import 'package:flutter_application_1/screen/listmuseum/kebangkitanN.dart';
import 'package:flutter_application_1/screen/listmuseum/monas.dart';
import 'package:flutter_application_1/screen/listmuseum/museumfatahillah.dart';
import 'package:flutter_application_1/screen/listmuseum/museumnasional.dart';
import 'package:flutter_application_1/screen/listmuseum/prasasti.dart';
import 'package:flutter_application_1/screen/screen2.dart';
import 'package:get/get.dart';

void main() => runApp(
      Mains(),
    );

class Mains extends StatelessWidget {
  const Mains({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/screen2',
          page: () => NextScreen(),
        ),
        GetPage(
          name: '/screenmonas',
          page: () => ScreenMonas(),
        ),
        GetPage(
          name: '/screennasional',
          page: () => ScreenNasional(),
        ),
        GetPage(
          name: '/screenfatahillah',
          page: () => Screenfatahillah(),
        ),
        GetPage(
          name: '/screenkebangkitan',
          page: () => ScreenKebangkitan(),
        ),
        GetPage(
          name: '/screenprasasti',
          page: () => Screenprasasti(),
        ),
      ],
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Jakarta"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('/screenmonas');
              },
              child: Mylistview(
                image: 'lib/models/gambar/monas/jakarta.jpg',
                judul: 'Monas',
                description: 'Kota Jakarta Pusat',
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/screennasional');
              },
              child: Mylistview(
                image: 'lib/models/gambar/nasional/mueseum.jpg',
                judul: 'Museum Nasional',
                description: 'Kota Jakarta Pusat',
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/screenfatahillah');
              },
              child: Mylistview(
                image: 'lib/models/gambar/fatahillah/museum2.jpeg',
                judul: 'Museum Fatahillah',
                description: 'Kota Jakarta Barat',
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/screenkebangkitan');
              },
              child: Mylistview(
                image: 'lib/models/gambar/kebangkitanN/museum3.jpeg',
                judul: 'Museum Kebanggkitan Nasional Jakarta',
                description: 'Kota Jakarta Pusat',
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/screenprasasti');
              },
              child: Mylistview(
                image: 'lib/models/gambar/prasasti/museum4.jpeg',
                judul: 'Museum Prasasti Jakarta',
                description: 'Kota Jakarta Pusat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
