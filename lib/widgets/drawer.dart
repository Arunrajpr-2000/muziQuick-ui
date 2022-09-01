import 'package:flutter/material.dart';
import 'package:music_ui/Screeens/favourite.dart';
import 'package:music_ui/Screeens/home.dart';
import 'package:music_ui/Screeens/playlist.dart';
import 'package:music_ui/Screeens/recent.dart';
import 'package:music_ui/Screeens/settings.dart';

class ScreenDrawer extends StatefulWidget {
  ScreenDrawer({Key? key}) : super(key: key);

  @override
  State<ScreenDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<ScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff091127),
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Color(0xff091127)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/images/SAVE_20220829_222402-removebg.png',
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      'Muzi',
                      style: TextStyle(
                          color: Color(0xffE71F1F),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      'Quick',
                      style: TextStyle(
                          color: Color(0xff24BBBB),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                )),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx1) => ScreenHome()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.white),
              title: const Text(
                'Favourites',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx1) => ScreenFavourite()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.music_note, color: Colors.white),
              title: const Text(
                'Playlist',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx1) => ScreenPlaylist()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.recent_actors, color: Colors.white),
              title: const Text(
                'Recents',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx1) => ScreenRecents()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx1) => ScreenSettings()));
              },
            )
          ],
        ),
      ),
    );
  }
}
