import 'package:flutter/material.dart';
import 'package:golf/pages/play/play_sports_list.dart';

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: PlaySportsList()
      ),
    );
  }
}
