import 'package:flutter/material.dart';
import 'package:music_ui/Screeens/nowplay.dart';
import 'package:music_ui/widgets/drawer.dart';

class ScreenMostply extends StatefulWidget {
  ScreenMostply({Key? key}) : super(key: key);

  @override
  State<ScreenMostply> createState() => _ScreenMostplyState();
}

class _ScreenMostplyState extends State<ScreenMostply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff091127),
      appBar: AppBar(
        backgroundColor: Color(0xff091127),
        title: Text('Most Played'),
        centerTitle: true,
      ),
      drawer: ScreenDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (ctx1) => ScreenNowplay()));
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
    );
  }
}
