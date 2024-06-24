
import 'package:flutter/material.dart';

class Container_jobPost extends StatelessWidget {
  const Container_jobPost({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      width: width * 0.7,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 181, 204, 245),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            'Post your job in just 2 minuts!',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            child: Card(
                elevation: 50,
                child: Image.asset(
                  'lib/assets/image/jobmingleimage1.jpg',
                )),
          )
        ],
      ),
    );
  }
}