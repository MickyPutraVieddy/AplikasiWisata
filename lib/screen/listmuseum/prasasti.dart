import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/gambarwisata.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

ListWisata wisata = ListWisata(
    imageurls: [
      'lib/models/gambar/prasasti/prasastiLuar.jpeg',
      'lib/models/gambar/prasasti/prasastiLuar.jpeg',
      'lib/models/gambar/prasasti/prasastiLuar.jpeg',
      'lib/models/gambar/prasasti/prasastiLuar.jpeg',
    ],
    Image: 'lib/models/gambar/prasasti/prasastiDalem.jpg',
    Tanggal: 'Open Everyday',
    place: "Museum Prasasti",
    open: "09:00 - 15:00",
    opentime: "09:00",
    ticketPrice: "Rp.5.000",
    Description:
        "Museum Prasasti terletak di Jakarta, Indonesia, dan dikenal sebagai tempat penyimpanan prasasti dan artefak sejarah lainnya. Museum ini terletak di kompleks Taman Prasasti, yang dulunya merupakan pemakaman Belanda pada abad ke-18 dan kemudian dijadikan museum pada tahun 1975. Koleksi Museum Prasasti mencakup prasasti-prasasti kuno, batu nisan, dan artefak sejarah lainnya yang mencerminkan berbagai periode sejarah di Indonesia. Prasasti-prasasti ini memberikan informasi berharga tentang kehidupan sosial dan budaya masyarakat pada masa lalu. ");

class Screenprasasti extends StatefulWidget {
  @override
  State<Screenprasasti> createState() => _ScreenprasastiState();
}

class _ScreenprasastiState extends State<Screenprasasti> {
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
