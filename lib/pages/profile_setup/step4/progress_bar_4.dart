import 'package:flutter/material.dart';

progressBar4() {
  return Row(
    children: <Widget>[
      Expanded(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    ClipOval(
                      child: Container(
                        height: 32.0, // height of the button
                        width: 32.0,
                        alignment: AlignmentDirectional.center,
                        decoration: new BoxDecoration(
                            color: Color(0xFFc9c9c9),
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
              left: 4.0,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  ClipOval(
                    child: Container(
                      height: 32.0, // height of the button
                      width: 32.0,
                      alignment: AlignmentDirectional.center,
                      decoration: new BoxDecoration(
                          color: Color(0xffc9c9c9),
                          borderRadius: new BorderRadius.circular(25.0),
                          border: new Border.all(
                            width: 1.0,
                            color: Color(0xfff1d8bd),
                          )),
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              left: 10.0,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  ClipOval(
                    child: Container(
                      height: 32.0, // height of the button
                      width: 32.0,
                      alignment: AlignmentDirectional.center,
                      decoration: new BoxDecoration(
                          color: Color(0xFFc9c9c9),
                          borderRadius: new BorderRadius.circular(25.0),
                          border: new Border.all(
                            width: 1.0,
                            color: Color(0xfff1D8BD),
                          )),
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              left: 16.0,
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
                          color: Color(0xfffffbf5))),
                ],
              ),
            ),

            Positioned(
              right:0.0,
              child: Container(
                  height: 28.0,
                  child: Text('Almost done!',
                      style: TextStyle(
                          color: Color(0xff417505),
                          fontFamily: 'SFUIText-Medium',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.52,
                          fontSize: 14.0
                      )
                  ),

              ),

            ),
          ],
        ),
      ),
    ],
  );
}
