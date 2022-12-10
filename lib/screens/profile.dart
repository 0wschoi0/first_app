import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/utils/authentication.dart';
import 'package:first_app/screens/SignIn.dart';
import 'package:first_app/screens/home.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required User user}) : _user = user;
  final User _user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth user = FirebaseAuth.instance;
  bool _isSigningOut = false;
  late User _currentUser;

  void initState() {
    _currentUser = widget._user;
    super.initState();
  }

  Route _routeToSignInScreen() {
    initState();
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      //Appbar
      AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/google_logo.png',
              height: 30,
              width: 30,
            ),
            Text(
              " Profile",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 89, 47, 120),
      ),
      //UserProfileImage
      Image.network(
        _currentUser.photoURL!,
        width: 120,
      ),
      //UserName
      Text(
        _currentUser.displayName!,
        style: TextStyle(
          fontSize: 26,
          color: Colors.black,
        ),
      ),
      //Email
      Text(_currentUser.email!),
      //Logout Button
      _isSigningOut
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 24, 184, 252),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningOut = true;
                });
                await Authentication.signOut(context: context);
                setState(() {
                  _isSigningOut = false;
                });
                Navigator.of(context).pushReplacement(_routeToSignInScreen());
              },
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
    ]));
  }
}
