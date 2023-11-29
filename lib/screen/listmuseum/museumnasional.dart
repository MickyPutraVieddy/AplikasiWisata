import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/gambarwisata.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

ListWisata wisata = ListWisata(
    imageurls: [
      'lib/models/gambar/nasional/nasionalDalem.jpeg',
      'lib/models/gambar/nasional/nasionalDalem.jpeg',
      'lib/models/gambar/nasional/nasionalDalem.jpeg',
      'lib/models/gambar/nasional/nasionalDalem.jpeg',
    ],
    Image: 'lib/models/gambar/nasional/NasionalLuar.jpg',
    Tanggal: 'Open Everyday',
    place: "Museum Nasional",
    open: "08:00 - 16:00 WIB",
    opentime: "08:00",
    ticketPrice: "Rp.35.000",
    Description:
        "Per 2022, Museum Nasional Indonesia, yang juga dikenal sebagai Museum Gajah, terletak di Jakarta, Indonesia. Museum ini adalah museum nasional dan terbesar di Indonesia, menampilkan koleksi yang kaya dari berbagai periode sejarah dan kebudayaan di nusantara. Koleksi meliputi arkeologi, etnografi, numismatika, sejarah, seni rupa, dan lainnya.");

class ScreenNasional extends StatefulWidget {
  @override
  State<ScreenNasional> createState() => _ScreenNasionalState();
}

class _ScreenNasionalState extends State<ScreenNasional> {
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
