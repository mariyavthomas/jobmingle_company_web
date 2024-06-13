import 'package:flutter/material.dart';

class PostNewJob extends StatelessWidget {
  const PostNewJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          actions: [
            Row(
              children: [
                ElevatedButton(onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>PostNewJob()));
                }, child: Text("FIND NEW JOB")),
                SizedBox(
                  width: 15,
                ),
                TextButton(onPressed: () {}, child: Text("FAQ/HELP")),
                SizedBox(
                  width: 15,
                ),
                TextButton(onPressed: () {}, child: Text("PROFILE")),
                SizedBox(
                  width: 15,
                ),
               
                SizedBox(
                  width: 100,
                )
              ],
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text(
              'Job Mingle',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
        body: Column(children: [
          Card()
        ]),
    );
  }
}