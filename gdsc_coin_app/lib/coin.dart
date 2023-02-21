// ignore_for_file: depend_on_referenced_packages, sort_child_properties_last, prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class coin extends StatefulWidget {
  const coin({super.key});

  @override
  State<coin> createState() => _coinState();
}

// -----------------------------------👇🏻-For the Animation Controller-
class _coinState extends State<coin> with SingleTickerProviderStateMixin {
// ---المتحكم--👇🏻-For the Animation Controller-
  late AnimationController _controller;
  late Animation _animation;

  @override
  //  ---👇🏻-- تشتغل اول شي
  void initState() {
    //
    _controller = AnimationController(
        vsync: this,
        // -👇🏻-- فترة انطلاق  الانميشين الى النهاية
        duration: Duration(milliseconds: 700));

    // ------------👇🏻-- انتقال من نقطة بداية الى نهاية
    _animation = Tween(begin: 0.0, end: 4.0).animate(_controller
        // CurvedAnimation(
        //   parent: _controller,
        //   curve: Curves.ease,
        // ),
        )
      // -------👇🏻-- يتم استدعائها عند تغير حالة الانميشن
      ..addStatusListener((status) {
        print("--status--$status");
        /*
        -status--AnimationStatus.forward
        -status--AnimationStatus.completed
        -status--AnimationStatus.reverse
        -status--AnimationStatus.dismissed
        */
        if (status == AnimationStatus.completed) {
          _controller.reverse();
          //
          Timer(Duration(milliseconds: 750), () {
            if (imageName1 == 1) {
              player.play(AssetSource('music/voice1.mp3'));
            } else {
              player.play(AssetSource('music/voice2.mp3'));
            }
          });
        }
      })
      // ----👇🏻-- يتم استدعائها عند تغير قيمة الانميشن
      ..addListener(() {
        setState(() {});
        print("--value----------${_animation.value}");
        /*
          -value--- 0.0
          -value--- 1.0
          -value--- 3.0
        */
      });

    super.initState();
  }

  //----------------------------------
  Random random = Random();
  int? imageName1;
  final player = AudioPlayer();
  //----------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple.shade300,
          centerTitle: true,
          title: Text("Coin App"),
          elevation: 0),
      backgroundColor: Colors.purple.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform(
              alignment: AlignmentDirectional.center,
              // transform: Matrix4.identity()..rotateY(_animation.value),
              transform: Matrix4.rotationY(_animation.value),

              child: CircleAvatar(
                radius: 180,
                child: Image.asset(
                    "assets/images/coin${imageName1 = random.nextInt(2) + 1}.png"),
              ),
            ),
            TextButton(
              onPressed: () {
                player.play(AssetSource('music/coin.mp3'));
                setState(() {
                  _controller.forward();
                });
              },
              child: Text("flip the coin",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
