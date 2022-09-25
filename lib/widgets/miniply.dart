import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';

class Miniply extends StatefulWidget {
  Miniply({Key? key}) : super(key: key);

  @override
  State<Miniply> createState() => _MiniplyState();
}

class _MiniplyState extends State<Miniply> {
  @override
  Widget build(BuildContext context) {
    return Miniplayer(
      minHeight: 70,
      elevation: 20,
      maxHeight: 100,
      builder: (height, percentage) {
        // if (percentage > 0.2) {
        // return Text('!mini');
        // } else {
        return Container(
          color: Color(0xff091127),
          alignment: Alignment.center,
          width: 20,
          height: 50,
          child: ListTile(
            leading: Icon(
              Icons.music_note,
              color: Colors.white,
            ),
            title: Text(
              'Song Name',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Artist Name',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                )),
          ),
        );
        //  }
      },
    );
  }
}
