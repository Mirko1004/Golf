import 'package:flutter/material.dart';
import 'package:golf/utils/app_styles.dart';

getYouMayAlsoLike() {

  return Container(
    height: 295.0,

    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[

        Column(
          children: <Widget>[

            Image.asset(
              'assets/images/t-shirt4.png',
              height: 177.0,
              width: 140.0,
            ),

            Padding(padding: EdgeInsets.only(top: 15.0)),

            Text('CALLAWAY',
                style:
                    AppStyles.getSurannaStyle2(16.0, 0.5, Colors.black, 1.4)),

            Row(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(left: 55.0),
                  child: Text('\$820', style: AppStyles.getSFUITextLight3()),
                ),

                Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: Image.asset('assets/images/heart2.png')),

              ],
            )
          ],
        ),

        Column(
          children: <Widget>[

            Image.asset(
              'assets/images/pants_adidas2.png',
              height: 177.0,
              width: 140.0,
            ),

            Padding(padding: EdgeInsets.only(top: 15.0)),

            Text('ADIDAS',
                style:
                    AppStyles.getSurannaStyle2(16.0, 0.5, Colors.black, 1.4)),

            Row(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(left: 55.0),
                  child: Text('\$820', style: AppStyles.getSFUITextLight3()),
                ),

                Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: Image.asset('assets/images/heart2.png')),

              ],
            )
          ],
        ),

        Column(
          children: <Widget>[

            Image.asset(
              'assets/images/pants_nike2.png',
              height: 177.0,
              width: 140.0,
            ),

            Padding(padding: EdgeInsets.only(top: 15.0)),

            Text('NIKE',
                style:
                    AppStyles.getSurannaStyle2(16.0, 0.5, Colors.black, 1.4)),

            Row(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(left: 55.0),
                  child: Text('\$820', style: AppStyles.getSFUITextLight3()),
                ),

                Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: Image.asset('assets/images/heart2.png')),

              ],
            )
          ],
        ),
      ],
    ),
  );
}
