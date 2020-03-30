import 'package:flutter/material.dart';
import 'package:golf/pages/connect_with_members/connect_with_row.dart';
import 'package:golf/utils/app_Box_Decoration.dart';
import 'package:golf/utils/app_colors.dart';

class ConnectWithMembers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        color: Colors.white,

        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text('CONNECT WITH SIMILAR',
                          style: TextStyle(
                              fontFamily: 'Suranna-Regular',
                              fontSize: 24.0,
                              color: AppColors.blackColor)),

                      Image(image: AssetImage('assets/images/X.png')),
                    ],
                  ),

                  Text('LOCAL MEMBERS',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Suranna-Regular',
                        color: AppColors.blackColor,
                        height: 0.6,
                      )),

                  SizedBox(height: 20.0),

                  Text('Send a request to connect with with like-',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'SFrancisco',
                          fontWeight: FontWeight.w300,
                          color: AppColors.darkGrey)),

                  SizedBox(height: 10.0),

                  Text('minded members within the community',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'SFrancisco',
                          fontWeight: FontWeight.w300,
                          color: AppColors.darkGrey)),

                  SizedBox(height: 30.0),

                  connectWithRow(),

                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 32.0, bottom: 20.0),

                child: InkWell(
                  onTap: null,

                  child: Container(
                      width: 159.0,
                      height: 40,
                      decoration:
                          new BoxDecoration(color: Colors.white, boxShadow: [

                        BoxShadow(
                            color: AppColors.lightBlack2,
                            blurRadius: 20.0,
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 0.0)
                      ]),

                      child: Center(
                        child: Text('filter result',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SFrancisco',
                                letterSpacing: 1.0,
                                fontSize: 18.0)),
                      )),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Container(
                  height: 5.0,
                  width: 134.0,
                  decoration: AppDecoration.bottomLine,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
