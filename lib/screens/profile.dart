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
  late User _currentUser = widget._user;

  Route _routeToSignInScreen() {
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
      Container(
        alignment: Alignment.centerLeft,
        height: 90,
        padding: const EdgeInsets.only(left: 30),
        child: Text("내 프로필",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
            )),
      ),
      //UserProfileImage
      Padding(
        padding: EdgeInsets.only(top: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(_currentUser.photoURL!,
              width: 100, height: 100, fit: BoxFit.cover),
        ),
      ),
      //UserName
      Padding(
        padding: EdgeInsets.only(top: 12),
        child: Text(
          _currentUser.displayName!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      //Email
      Padding(
        padding: EdgeInsets.only(top: 2, bottom: 8),
        child: Text(
          _currentUser.email!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
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
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
    ]));
  }
}
