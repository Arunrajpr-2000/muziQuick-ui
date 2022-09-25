import 'dart:convert';

// import 'package:just_audio/just_audio.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:just_audio/just_audio.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:music_ui/Screeens/favourite.dart';
import 'package:music_ui/Screeens/nowplay.dart';
import 'package:music_ui/Screeens/playlist.dart';
import 'package:music_ui/widgets/drawer.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';
import 'package:music_ui/widgets/fav.dart';
import 'package:music_ui/widgets/miniply.dart';
import 'package:music_ui/widgets/songlist.dart';
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

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   assetsAudioPlayer.open(
  //     Audio(
  //         'asset/audio/Dua Lipa  Levitating Featuring English Mp3 Song Ringtone.mp3'),
  //     autoStart: false,
  //     showNotification: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
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
          bottom: const TabBar(
            indicatorColor: Colors.red,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.library_music),
              ),
            ],
          ),
        ),
        drawer: ScreenDrawer(),
        body: Stack(
          children: [
            TabBarView(
              children: [
                //<--home-->
                Container(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (ctx1) => ScreenNowplay(
                                          index: index,
                                          assetaudioplayer: audioPlayer,
                                          songs1: songarray[index],
                                        )));
                          },
                          title: Text(
                            '${songarray[index].metas.title!}',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '${songarray[index].metas.artist!}',
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
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx1) => ScreenFavourite()));
                              } else {
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (ctx1) => ScreenPlaylist()));
                              }
                            },
                          ));
                    },
                    itemCount: songarray.length,
                  ),
                ),
                //<--Favourites-->
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (ctx1) => ScreenNowplay()));
                        },
                        title: Text(
                          'Hope',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'xxx tentaction',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset(
                              'asset/images/xxxtent.jpg',
                              width: 55,
                              height: 55,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        trailing: FavWidget(),
                      );
                    },
                    itemCount: 5,
                  ),
                ),
                //<--recents-->
                ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (ctx1) => ScreenNowplay()));
                      },
                      title: Text(
                        'Hope',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'xxx tentaction',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            'asset/images/xxxtent.jpg',
                            width: 55,
                            height: 55,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    );
                  },
                  itemCount: 5,
                ),
              ],
            ),
            Miniply(),
          ],
        ),
      ),
    );
  }
}
