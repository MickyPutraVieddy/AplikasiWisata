import 'package:flutter/material.dart';

class Mylistview extends StatelessWidget {
  final String image;
  final String judul;
  final String description;

  const Mylistview({
    Key? key,
    required this.image,
    required this.judul,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: 170,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      judul,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
