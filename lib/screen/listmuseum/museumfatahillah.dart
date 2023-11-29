import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/gambarwisata.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

ListWisata wisata = ListWisata(
    imageurls: [
      'lib/models/gambar/fatahillah/fatahillahDalem.jpg',
      'lib/models/gambar/fatahillah/fatahillahDalem.jpg',
      'lib/models/gambar/fatahillah/fatahillahDalem.jpg',
      'lib/models/gambar/fatahillah/fatahillahDalem.jpg',
    ],
    Image: 'lib/models/gambar/fatahillah/fatahillahLuar.jpg',
    Tanggal: 'Open Everyday',
    place: "Museum Fatahillah",
    open: "Open Everyday",
    opentime: "08:00 - 15:00 WIB",
    ticketPrice: "Rp.5.000",
    Description:
        "Museum Fatahillah, juga dikenal sebagai Museum Sejarah Jakarta, terletak di Kota Tua, Jakarta, Indonesia. Bangunan tersebut merupakan bekas Balai Kota Batavia yang dibangun pada abad ke-18. Museum ini menyajikan koleksi artefak sejarah yang mencakup masa kolonial Belanda hingga masa kemerdekaan Indonesia. Koleksinya mencakup peralatan rumah tangga, pakaian tradisional, senjata, dan berbagai benda bersejarah lainnya. ");

class Screenfatahillah extends StatefulWidget {
  @override
  State<Screenfatahillah> createState() => _ScreenfatahillahState();
}

class _ScreenfatahillahState extends State<Screenfatahillah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(wisata.Image),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                wisata.place,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      const SizedBox(height: 8.0),
                      Text(
                        wisata.open,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time),
                      const SizedBox(height: 8.0),
                      Text(
                        wisata.opentime,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.monetization_on),
                      const SizedBox(height: 8.0),
                      Text(
                        wisata.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                wisata.Description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: wisata.imageurls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
