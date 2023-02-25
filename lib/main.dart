import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[200],
        appBar: AppBar(
          title: Center(child: Text('Bunny Coin')),
          backgroundColor: Colors.red[300],
        ),
        body: youme(),
      ),
    ),
  );
}

class youme extends StatefulWidget {
  const youme({Key? key}) : super(key: key);

  @override
  State<youme> createState() => _youmeState();
}

class _youmeState extends State<youme> {
  int Num = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(100)),
          Text(
          'Flip me',
          style: TextStyle(fontSize: 20.0,
            color: Colors.black ,

          ),
          ) ,
          Padding(padding: EdgeInsets.all(20)),
          MaterialButton(
            onPressed: ()  {
              setState(() {
                Num = Random().nextInt(2) + 1;
              });

              final player = AudioPlayer();
              player.play(AssetSource('game.wav'));
            },
            child: Expanded(

              child: Container(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('images/ph$Num.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
