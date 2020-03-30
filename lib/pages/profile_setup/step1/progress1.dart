import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';

drawProgressBar() {

  return Row(
    children: <Widget>[

      Expanded(

        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[

            Positioned(

              child: Padding(
                padding: EdgeInsets.all(0.0),

                child: Container(
                  color: Color(0xfff1d8bd),
                  height: 1.0,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 0.0),

              child: Align(
                alignment: Alignment.topRight,

                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[

                    ClipOval(

                      child: Container(
                        height: 32.0, // height of the button
                        width: 32.0,
                        alignment: AlignmentDirectional.center,
                        decoration: new BoxDecoration(
                            color: Color(0xffffffbf5),
                            borderRadius: new BorderRadius.circular(25.0),
                            border: new Border.all(
                              width: 1.0,
                              color: Color(0xfff1d8bd),
                            )),
                      ),
                    ),

                    Text('4',
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            decoration: TextDecoration.none,
                            fontSize: 23.0,
                            fontFamily: 'Suranna-Regular',
                            color: Color(0xff000000))),

                  ],
                ),
              ),
            ),

            Positioned(
              right: 22.0,

              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[

                  ClipOval(
                    child: Container(
                      height: 32.0, // height of the button
                      width: 32.0,
                      alignment: AlignmentDirectional.center,
                      decoration: new BoxDecoration(
                          color: Color(0xffffffbf5),
                          borderRadius: new BorderRadius.circular(25.0),
                          border: new Border.all(
                            width: 1.0,
                            color: Color(0xfff1d8bd),
                          )),
                    ),

                  ),

                  Text('3',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          decoration: TextDecoration.none,
                          fontSize: 23.0,
                          fontFamily: 'Suranna-Regular',
                          color: Color(0xff000000))),

                ],
              ),
            ),

            Positioned(
              left: 0.0,

              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[

                  ClipOval(

                    child: Container(
                      height: 32.0, // height of the button
                      width: 32.0,
                      alignment: AlignmentDirectional.center,
                      decoration: new BoxDecoration(
                          color: Color(0xff417505),
                          borderRadius: new BorderRadius.circular(25.0),
                          border: new Border.all(
                            width: 1.0,
                            color: Color(0xfff1D8BD),
                          )),
                    ),

                  ),

                  Text('1',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          decoration: TextDecoration.none,
                          fontSize: 23.0,
                          fontFamily: 'Suranna-Regular',
                          color: AppColors.lightWhite2)),

                ],
              ),
            ),

            Positioned(
              right: 45.0,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[

                  ClipOval(

                    child: Container(
                      height: 32.0, // height of the button
                      width: 32.0,
                      alignment: AlignmentDirectional.center,
                      decoration: new BoxDecoration(
                          color: Color(0xffffffbf5),
                          borderRadius: new BorderRadius.circular(25.0),
                          border: new Border.all(
                            width: 1.0,
                            color: Color(0xfff1d8bd),
                          )),
                    ),

                  ),

                  Text('2',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          decoration: TextDecoration.none,
                          fontSize: 23.0,
                          fontFamily: 'Suranna-Regular',
                          color: Color(0xff000000))),

                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
