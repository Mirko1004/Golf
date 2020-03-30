import 'package:flutter/material.dart';
import 'package:golf/pages/profile_setup/step1/profile_setup_1_bloc.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

takePhoto(ProfileSetup1Bloc profileSetup1Bloc) {

  return Row(

    children: <Widget>[

      Expanded(

        child: InkWell(
          onTap: () => profileSetup1Bloc.openGallery(),

          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.lightBlack3,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 0.0)
              ],
            ),

            child: Center(

              child: Text('add a photo',
                  textAlign: TextAlign.center,
                  style: AppStyles.getSFUITextLightStyle()),

            ),
          ),
        ),
      ),

      Padding( padding: EdgeInsets.only(left: 20.0),),

      InkWell(
        onTap: () => profileSetup1Bloc.openCamera(),
        child: Container(
          width: 70.0,
          height: 40.0,
          decoration: BoxDecoration(
            image: DecorationImage( image: AssetImage('assets/images/photo_camera.png')),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.lightBlack3,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 0.0)
            ],
          ),
        ),
      ),


    ],
  );

}

iconsGender(ProfileSetup1Bloc profileSetup1Bloc) {

  return StreamBuilder<bool>(
    stream: profileSetup1Bloc.isMale,
    initialData: true,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      bool isMale = snapshot.data;

      return Row(
        children: <Widget>[

          Expanded(
              child: Stack(
            children: <Widget>[

              InkWell(
                onTap: () => profileSetup1Bloc.isMale.value = false,

                child: Padding(
                  padding: EdgeInsets.only(right: 0.0),

                  child: Align(
                    alignment: Alignment.topRight,

                    child: Column(
                      children: <Widget>[

                        ClipOval(

                          child: Container(
                            height: 70.0, // height of the button
                            width: 70.0,
                            decoration: new BoxDecoration(
                              boxShadow: [

                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0,
                                    offset: Offset(0.0, 1.0),
                                    spreadRadius: 0.0)
                              ],
                              image: new DecorationImage(
                                  image: isMale
                                      ? AssetImage(
                                          'assets/images/female-gender.png')
                                      : AssetImage(
                                          'assets/images/female-gender-selected.png')),
                              color: isMale ? Color(0xfffffbf5) : Colors.black,
                            ),
// width of the button
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text('female',
                            style: AppStyles.getSFUITextRegularStyle(
                                20.0, 0.0, Colors.black, FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('or', style: AppStyles.getSFUITextLightStyle()),
                ),
              ),

              Positioned(
                left: 0.0,

                child: InkWell(
                  onTap: () => profileSetup1Bloc.isMale.value = true,

                  child: Column(
                    children: <Widget>[

                      ClipOval(

                        child: Container(
                          height: 70.0, // height of the button
                          width: 70.0,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: isMale
                                    ? AssetImage(
                                        'assets/images/male-gender.png')
                                    : AssetImage(
                                        'assets/images/male-gender-not-selected.png')),
                            color: isMale ? Colors.black : Color(0xfffffbf5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 1.0),
                                  spreadRadius: 0.0)
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                      Text('male',
                          style: AppStyles.getSFUITextRegularStyle(
                              20.0, 0.0, Colors.black, FontWeight.w400)),

                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      );
    },
  );

}
