import 'package:flutter/material.dart';

import 'package:music_ui/Screeens/home.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff091127),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/images/SAVE_20220829_222402-removebg.png',
                  width: 150,
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Muzi',
                      style: TextStyle(
                          color: Color(0xffE71F1F),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text(
                      'Quick',
                      style: TextStyle(
                          color: Color(0xff24BBBB),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }

  Future<void> gotohome() async {
    await Future.delayed(Duration(seconds: 2));
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (ctx) => ScreenHome(),
    //   ),
    // );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ScreenHome(),
      ),
      (route) => false,
    );
  }
}
