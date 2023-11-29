import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/gambarwisata.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

ListWisata wisata = ListWisata(
    imageurls: [
      'lib/models/gambar/kebangkitanN/kebangkitanDalem.jpg',
      'lib/models/gambar/kebangkitanN/kebangkitanDalem.jpg',
      'lib/models/gambar/kebangkitanN/kebangkitanDalem.jpg',
      'lib/models/gambar/kebangkitanN/kebangkitanDalem.jpg',
    ],
    Image: 'lib/models/gambar/kebangkitanN/kebangkitanLuar.jpg',
    Tanggal: '08:00 - 10:00',
    place: "Museum Kebangkitan Nasional",
    open: "07:00 - 12:00",
    opentime: "07;00",
    ticketPrice: "Rp.50.000.00",
    Description:
        "Monas juga memiliki Museum Nasional di bagian bawahnya yang menampilkan sejarah perjuangan kemerdekaan Indonesia. Monumen Nasional bukan hanya destinasi wisata, tetapi juga tempat untuk merayakan peristiwa nasional dan kegiatan seremonial penting.");

class ScreenKebangkitan extends StatefulWidget {
  @override
  State<ScreenKebangkitan> createState() => _ScreenKebangkitanState();
}

class _ScreenKebangkitanState extends State<ScreenKebangkitan> {
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
