import 'package:flutter/material.dart';

class OfferSend extends StatelessWidget {
  const OfferSend({
    super.key,
    required this.width1,
    required this.height2,
  });

  final double width1;
  final double height2;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: width1 * 0.2,
        height: height2 * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Text(
              "Offer Send",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text('2',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 110),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 242, 144, 39),
                child: Icon(
                  Icons.local_offer,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

