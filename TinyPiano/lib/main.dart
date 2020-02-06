import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TinyPiano',
      theme: ThemeData.dark(),
      home: Piano(),
    );
  }
}

class Piano extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double space = ((size.width - (size.width / 7 * 6)) / 7) / 2;
    double tilePos = size.width / 7;
    void playSound(String audioName) {
      AudioCache player = new AudioCache();
      player.play(audioName);
    }

    Positioned whiteTile({String songName, @required double tilePosition}) {
      return (Positioned(
        left: tilePosition,
        width: size.width / 8,
        height: size.height,
        child: FlatButton(
          color: Colors.white,
          onPressed: () {
            playSound(songName);
          },
          child: Text(""),
        ),
      ));
    }

    Positioned blackTile(
        {@required String songName, @required double tilePosition}) {
      return (Positioned(
        left: tilePosition,
        width: size.width / 8 - 30,
        height: size.height / 2,
        child: FlatButton(
          color: Colors.black,
          onPressed: () {
            playSound(songName);
          },
          child: Text(""),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TinyPiano")),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            whiteTile(songName: "do.wav", tilePosition: space),
            whiteTile(songName: "re.wav", tilePosition: tilePos + space),
            whiteTile(songName: "mi.wav", tilePosition: tilePos * 2 + space),
            whiteTile(songName: "fa.wav", tilePosition: tilePos * 3 + space),
            whiteTile(songName: "sol.wav", tilePosition: tilePos * 4 + space),
            whiteTile(songName: "la.wav", tilePosition: tilePos * 5 + space),
            whiteTile(
                songName: "si.wav", tilePosition: size.width / 7 * 6 + space),
            blackTile(tilePosition: tilePos - 25, songName: "do#.wav"),
            blackTile(tilePosition: tilePos * 2 - 25, songName: "re#.wav"),
            blackTile(tilePosition: tilePos * 4 - 25, songName: "fa#.wav"),
            blackTile(tilePosition: tilePos * 5 - 25, songName: "sol#.wav"),
            blackTile(tilePosition: tilePos * 6 - 25, songName: "la#.wav"),
          ],
        ),
      ),
    );
  }
}
