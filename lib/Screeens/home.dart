import 'dart:developer';
import 'dart:io';
// import 'package:just_audio/just_audio.dart';
import 'package:music_ui/Screeens/favourite.dart';
import 'package:music_ui/Screeens/nowplay.dart';
import 'package:music_ui/Screeens/playlist.dart';
import 'package:music_ui/widgets/drawer.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';
// import 'package:music_player/screens/favourite.dart';
// import 'package:music_player/screens/nowplay.dart';
// import 'package:music_player/screens/playlist.dart';
// import 'package:music_player/screens/settings.dart';
// import 'package:music_player/screens/splash.dart';
// import 'package:music_player/widgets/drawer.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Icon myIcon = const Icon(Icons.search);
  Widget myTitle = const Text('All Songs');
  String searchInput = "";

  // final _audioQuery = new OnAudioQuery();
  // final AudioPlayer _audioPlayer = AudioPlayer();

  // playSong(String? uri) {
  //   try {
  //     _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
  //   } on Exception {
  //     log('Error parsing song');
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   requestPermission();
  // }

  // void requestPermission() {
  //   Permission.storage.request();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff091127),
      appBar: AppBar(
        backgroundColor: Color(0xff091127),
        title: myTitle,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (myIcon.icon == Icons.search) {
                    myIcon = const Icon(
                      Icons.clear,
                      color: Colors.orange,
                    );
                    myTitle = TextField(
                      onChanged: (value) {
                        searchInput = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Search here',
                          hintStyle: TextStyle(color: Colors.grey)),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    );
                  } else {
                    setState(() {
                      searchInput = '';
                    });
                    myIcon = const Icon(Icons.search);
                    myTitle = const Text('All Songs');
                  }
                });
              },
              icon: myIcon),
        ],
      ),
      drawer: ScreenDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx1) => ScreenNowplay()));
              },
              title: Text(
                'Song Name',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Artist Name',
                style: TextStyle(color: Colors.white),
              ),
              // leading: CircleAvatar(
              //   radius: 30,
              //   backgroundColor: Colors.white,
              //   child: ClipOval(
              //     child: Image.asset(
              //       'asset images/xxxtent.jpg',
              //       width: 55,
              //       height: 55,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              leading: const Icon(
                Icons.music_note,
                color: Colors.white,
                size: 38,
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text(
                        'Add to fav',
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Add to Plylist'),
                      value: 2,
                    ),
                  ];
                },
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onSelected: (value) {
                  if (value == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx1) => ScreenFavourite()));
                  } else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx1) => ScreenPlaylist()));
                  }
                },
              ));
        },
        itemCount: 5,
      ),
    );
  }
}
