import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_ui/widgets/fav.dart';

class ScreenNowplay extends StatefulWidget {
  const ScreenNowplay({Key? key}) : super(key: key);

  @override
  State<ScreenNowplay> createState() => _ScreenNowplayState();
}

class _ScreenNowplayState extends State<ScreenNowplay> {
  bool _isplaying = false;
  double _currentsliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff091127),
      appBar: AppBar(
        backgroundColor: Color(0xff091127),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Playing Now'),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            //width: MediaQuery.of(context).size*0.5,
            // width: size.width,
//height: size.height,
            height: 200,
            margin: EdgeInsets.only(left: 80, top: 60, right: 80, bottom: 30),
            child:
                ClipRRect(child: Image.asset('asset/images/plyscrnImg.jpeg')),
          ),
          Text(
            'Song Name',
            style: TextStyle(color: Colors.white70, fontSize: 24),
          ),
          Text(
            'Artist Name',
            style: TextStyle(color: Colors.white70, fontSize: 15),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FavWidget(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.playlist_add,
                    color: Colors.white,
                    size: 35,
                  ))
            ],
          ),
          Slider(
              inactiveColor: Colors.grey,
              value: _currentsliderValue,
              max: 100,
              activeColor: Colors.white,
              onChanged: (double value) {
                setState(() {
                  _currentsliderValue = value;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '   00:00',
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                '04:00   ',
                style: TextStyle(color: Colors.white70),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.white,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous_sharp,
                    color: Colors.white,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (_isplaying) {
                        _isplaying = false;
                      } else {
                        _isplaying = true;
                      }
                    });
                  },
                  icon: (_isplaying
                      ? Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 35,
                        )
                      : Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 35,
                        ))),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next_sharp,
                    color: Colors.white,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.repeat,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
          )
        ],
      ),
    );
  }

  // void play() {
  //   setState(() {
  //     if (_isplaying) {
  //       _isplaying = false;
  //     } else {
  //       _isplaying = true;
  //     }
  //   });
  // }
}
