import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoGoogle {
  final _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle(BuildContext context, bool isUser) async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          'YOUR_CLIENT_ID.apps.googleusercontent.com', // Replace with your actual client ID
    );

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        print(user);

        if (user != null) {
          final userData = {
            "uid": user.uid,
            "Name": user.displayName,
            "Email": user.email,
            "profile": user.photoURL,
          };

          if (isUser) {
            await FirebaseFirestore.instance
                .collection("company")
                .doc(user.uid)
                .set(userData);
          } else {
            await FirebaseFirestore.instance
                .collection("users")
                .doc(user.uid)
                .set(userData);
          }

          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      }
    } catch (e) {
      print('Error during Google sign-in: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during Google sign-in: ${e.toString()}')),
      );
    }
  }

  void showBottomAlertBox(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Continue with Google',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'You will be redirected to Google for a secure and faster login. Your name and email will be shared with JobMingle app and website.',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 30),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'CANCEL',
                        style:
                            TextStyle(color: Color.fromARGB(200, 75, 110, 225)),
                      ),
                    ),
                    SizedBox(width: 100),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(200, 75, 110, 225))),
                      onPressed: () {
                        signInWithGoogle(context, true);
                      },
                      child: Text('Continue'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
