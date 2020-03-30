import 'package:flutter/material.dart';
import 'package:golf/pages/play/play_golf/background_image.dart';
import 'package:golf/pages/play/play_golf/choose_a_game.dart';
import 'package:golf/pages/play/play_golf/weather_row.dart';

class PlayGolf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

              getBackgroundImage(context),

              getWeatherRow(),

              getChooseAGame(context),

            ],
          ),
      ),

    );
  }
}
