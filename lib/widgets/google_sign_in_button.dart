import 'package:first_app/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:first_app/utils/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_cache/firestore_cache.dart';
import 'package:first_app/utils/cacheData.dart';

// Firebase의 Authentication 지원기능을 통해 Google Sign In
class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                User? user =
                    await Authentication.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });

                if (user != null) {
                  String userEmail = user.email!;
                  FirebaseFirestore firestore =
                      await FirebaseFirestore.instance;
                  firestore
                      .collection(userEmail)
                      .limit(1)
                      .get()
                      .then((snapshot) {
                    DocumentReference<Map<String, dynamic>> documentReference =
                        firestore.collection(userEmail).doc("privateList");
                    DocumentReference<Map<String, dynamic>> documentReference2 =
                        firestore.collection(userEmail).doc("sharedList");
                    DocumentReference<Map<String, dynamic>> documentReference3 =
                        firestore.collection(userEmail).doc("status");
                    if (snapshot.size == 0) {
                      documentReference.set({
                        "사용자 이름": user.displayName!,
                        "나만의 플레이리스트": {
                          "나만의 플레이리스트": [],
                        }
                      });
                      documentReference2.set({
                        "사용자 이름": user.displayName!,
                        "공유된 플레이리스트": {
                          "공유된 플레이리스트": {
                            "사용자": [
                              "$userEmail!",
                            ],
                            "플레이리스트": [],
                          },
                        }
                      });
                      documentReference3.set({"updatedAt": DateTime.now()});
                    }
                  });

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        user: user,
                      ),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
