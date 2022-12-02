import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/playlist.dart';
import 'package:first_app/screens/search.dart';
import 'package:first_app/screens/notification.dart';
import 'package:first_app/screens/profile.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:first_app/screens/HomeEtc/categoryDetail.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  State<HomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  late User _user;
  int _selectedIndex = 0;
  int _pageIndex = 0;
  //BottomNavigationBar 버튼 메뉴에 따른 dart 페이지 List
  late List<Widget> _widgetOptions = <Widget>[
    MyMain(pageIndex: _pageIndex),
    PlaylistScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: ,
        home: Scaffold(
      // 상단 고정
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 15),
          color: Colors.white,
          child: Row(children: [
            Image(
              image: AssetImage('assets/google_logo.png'),
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
            Text(
              "PANGMUE",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ]),
        ),
      ),
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: '플레이리스트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '알림',
          ),
          BottomNavigationBarItem(
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(90.0),
              child: Image.network(
                _user.photoURL!,
                height: 25,
                width: 25,
              ),
            ),
            label: '프로필',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    ));
  }

  // BottomNavigationBar 탭을 하였을 때 index의 state변경
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

// 홈화면 첫번째 요소 슬라이드
InkWell FirstElement(int rgb, String title, String song1, String artist1,
    String song2, String artist2, String image1, String image2) {
  return InkWell(
      onTap: () {
        print("touched");
      },
      child: Container(
          decoration: BoxDecoration(
            color: Color(rgb),
          ),
          padding: const EdgeInsets.only(
            left: 21,
            top: 20,
            bottom: 23,
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "15곡 | 49분 17초",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 350,
                  height: 34,
                  child: Row(children: <Widget>[
                    Image.asset(
                      image1,
                      height: 34,
                      width: 34,
                      fit: BoxFit.contain,
                    ),
                    Column(children: <Widget>[
                      Flex(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        direction: Axis.vertical,
                        children: [
                          Container(
                            height: 17,
                            child: Text(
                              song1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 17,
                            child: Text(
                              artist1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ]),
                ),
                SizedBox(height: 4),
                Container(
                    width: 350,
                    height: 34,
                    child: Row(children: <Widget>[
                      Image.asset(
                        image2,
                        height: 34,
                        width: 34,
                        fit: BoxFit.contain,
                      ),
                      Column(children: <Widget>[
                        Flex(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          direction: Axis.vertical,
                          children: [
                            Container(
                              height: 17,
                              child: Text(
                                song2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 17,
                              child: Text(
                                artist2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ]))
              ])));
}

class MyMain extends StatefulWidget {
  const MyMain({Key? key, required int pageIndex})
      : _pageIndex = pageIndex,
        super(key: key);
  final int _pageIndex;

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  late Timer _timer;

  late int _pageIndex;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _pageIndex = widget._pageIndex;
    // 5초 지나면 자동으로 페이지 슬라이드
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < 4) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  // 홈 화면 UI 구성
  @override
  Widget build(BuildContext context) {
    Positioned category(String cate, double leftP, double topP,
        IconData iconName, int color, String genre) {
      return Positioned(
          left: leftP,
          top: topP,
          child: InkWell(
            onTap: (() {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      SearchDetailScreen(
                    input: genre,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            }),
            child: Container(
              width: 45,
              height: 55.25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32.27,
                    height: 32.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      iconName,
                      size: 32.25288772583008,
                      color: Color(color),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "$cate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff1e1e1e),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ));
    }

    return Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: ListView(children: [
          // 첫번째 요소
          Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 199,
                    child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _pageIndex = index;
                          });
                        },
                        children: [
                          SizedBox.expand(
                              child: FirstElement(
                            0xFF5b778b,
                            "이거 들으면서 출근하면\n다 이길 수 있음",
                            "새삥(feat. Homies)",
                            "지코 (ZICO)",
                            "Attention",
                            "NewJeans",
                            "assets/app_logo.png",
                            "assets/app_logo.png",
                          )),
                          SizedBox.expand(
                            child: FirstElement(
                              0xFF536D64,
                              "출근길 지옥철? \n이정돈 껌이지",
                              "Dice",
                              "NMIXX",
                              "Rush Hour(feat. j-hope of BTS",
                              "Crush",
                              "assets/app_logo.png",
                              "assets/app_logo.png",
                            ),
                          ),
                          SizedBox.expand(
                              child: FirstElement(
                            0xFF53566D,
                            "이거 들으면서 출근하면\n다 이길 수 있음",
                            "새삥(feat. Homies)",
                            "지코 (ZICO)",
                            "Attention",
                            "NewJeans",
                            "assets/app_logo.png",
                            "assets/app_logo.png",
                          )),
                          SizedBox.expand(
                            child: FirstElement(
                              0xFF5b778b,
                              "이거 들으면서 출근하면\n다 이길 수 있음",
                              "새삥(feat. Homies)",
                              "지코 (ZICO)",
                              "Attention",
                              "NewJeans",
                              "assets/app_logo.png",
                              "assets/app_logo.png",
                            ),
                          ),
                          SizedBox.expand(
                            child: FirstElement(
                              0xFF536D64,
                              "이거 들으면서 출근하면\n다 이길 수 있음",
                              "새삥(feat. Homies)",
                              "지코 (ZICO)",
                              "Attention",
                              "NewJeans",
                              "assets/app_logo.png",
                              "assets/app_logo.png",
                            ),
                          ),
                        ])),
                SizedBox(
                  height: 8,
                ),
                // 슬라이드 indicator
                CarouselIndicator(
                  color: Color(0xFF828282),
                  activeColor: Color(0xFF2A5CE3),
                  animationDuration: 250,
                  space: 7,
                  width: 6,
                  count: 5,
                  index: _pageIndex,
                ),

                // 두번째 요소;
                SizedBox(height: 9.42),
                Text(
                  "지금 당신의 플리 mood는?",
                  style: TextStyle(
                    color: Color(0xff1e1e1e),
                    fontSize: 20,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 9.42),
                Container(
                    width: 358.70,
                    height: 170.82,
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 358.70,
                              height: 170.82,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26262626),
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Stack(children: [
                                category(
                                    "이동",
                                    20,
                                    19.0,
                                    CupertinoIcons.location_solid,
                                    0xFF6D5353,
                                    "k-pop"),
                                category("공부", 91.27, 19.01,
                                    CupertinoIcons.pencil, 0xFF6D6753, "jazz"),
                                category(
                                    "여행",
                                    162.54,
                                    19.01,
                                    CupertinoIcons.briefcase_fill,
                                    0xFF6D5953,
                                    "swing"),
                                category(
                                    "운동",
                                    233.81,
                                    19.01,
                                    Icons.fitness_center,
                                    0xFF9E6464,
                                    "hip-hop"),
                                category(
                                    "아침",
                                    305.08,
                                    19.01,
                                    CupertinoIcons.brightness_solid,
                                    0xFFAD9C81,
                                    "blues"),
                                category("휴식", 19, 95.35, Icons.coffee,
                                    0xFF9E6487, "rnb"),
                                category(
                                    "노동요",
                                    90,
                                    95.35,
                                    CupertinoIcons.desktopcomputer,
                                    0xFF64759E,
                                    "indie"),
                                category(
                                    "취침",
                                    162.5,
                                    95.35,
                                    CupertinoIcons.bed_double_fill,
                                    0xFF9E6464,
                                    "christmas"),
                                category(
                                    "게임",
                                    234.5,
                                    95.35,
                                    CupertinoIcons.game_controller_solid,
                                    0xFF472E2E,
                                    "rock"),
                                category(
                                    "내적댄스",
                                    300,
                                    95.35,
                                    CupertinoIcons.headphones,
                                    0xFF391A1A,
                                    "soul"),
                              ])),
                        ])),
                // 세번째 요소;
                SizedBox(height: 9.42),
                Text(
                  "최근에 이용한 플레이리스트",
                  style: TextStyle(
                    color: Color(0xff1e1e1e),
                    fontSize: 20,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 9.42),
              ])
        ]));
  }
}
