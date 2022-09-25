import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_ui/Screeens/home.dart';
import 'package:music_ui/widgets/fav.dart';
import 'package:music_ui/widgets/songlist.dart';

class ScreenNowplay extends StatefulWidget {
  final Audio? songs1;
  final int? index;
  final AssetsAudioPlayer? assetaudioplayer;
  const ScreenNowplay(
      {Key? key,
      required this.assetaudioplayer,
      required this.index,
      required this.songs1})
      : super(key: key);

  @override
  State<ScreenNowplay> createState() => _ScreenNowplayState();
}

class _ScreenNowplayState extends State<ScreenNowplay> {
  bool _isplaying = true;
  double _currentsliderValue = 20;
  // final AudioPlayer _player = AudioPlayer();
  // final AudioPlayer _player = AudioPlayer();
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  // final AssetsAudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    songplayNow();
    super.initState();
  }

  Future<void> songplayNow() async {
    await widget.assetaudioplayer!.open(
      songarray[widget.index!],
    );
    widget.assetaudioplayer!.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff091127),
      appBar: AppBar(
        backgroundColor: Color(0xff091127),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
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
            '${songarray[widget.index!].metas.title!}',
            style: TextStyle(color: Colors.white70, fontSize: 24),
          ),
          Text(
            '${songarray[widget.index!].metas.artist!}',
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
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: widget.assetaudioplayer!.builderRealtimePlayingInfos(
                  builder: (context, infos) {
                Duration currentposition = infos.currentPosition;
                Duration totalduration = infos.duration;
                return ProgressBar(
                    timeLabelTextStyle:
                        TextStyle(color: Colors.white, fontSize: 16),
                    thumbColor: Colors.white,
                    baseBarColor: Colors.grey,
                    progressBarColor: Colors.red,
                    bufferedBarColor: Colors.red,
                    thumbRadius: 10,
                    barHeight: 4,
                    progress: currentposition,
                    total: totalduration,
                    onSeek: ((to) {
                      //audioPlayer.seek(to);
                      audioPlayer.seek(to);
                    }));
              })),
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
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => widget.index! <
                                    songarray.length - 1
                                ? ScreenNowplay(
                                    assetaudioplayer: widget.assetaudioplayer,
                                    index: widget.index! - 1,
                                    songs1: songarray[widget.index! + 1])
                                : ScreenHome())));
                  },
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
                        widget.assetaudioplayer!.pause();
                      } else {
                        _isplaying = true;

                        widget.assetaudioplayer!.play();
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
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => widget.index! <
                                    songarray.length - 1
                                ? ScreenNowplay(
                                    assetaudioplayer: widget.assetaudioplayer,
                                    index: widget.index! + 1,
                                    songs1: songarray[widget.index! + 1])
                                : ScreenHome())));
                  },
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
