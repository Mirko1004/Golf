import 'package:flutter/material.dart';
import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getNoEventCard(BaseBloc baseBloc) {

  return InkWell(
    onTap: () => baseBloc.dataCache.currentPage.value = 1,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Container(
          height: 67.0,
          width: 381.0,
          decoration: BoxDecoration(color: AppColors.lightWhite2, boxShadow: [
            BoxShadow(
              color: AppColors.greyColor27,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
              spreadRadius: 0.0,
            )
          ]),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text( "",
                        style: AppStyles.getSFUITextRegularStyle(12.0, 0.33,
                            AppColors.greyColor19, FontWeight.w400)),
                    Text("",
                      style: AppStyles.getSurannaStyle2(
                          40.0, 1.18, AppColors.lightBlack6, 1.2),
                    )

                  ],
                ),
              ),

              Padding(padding: EdgeInsets.only(left: 10.0),),

              Expanded(
                child: Wrap(
                  children: <Widget>[
                    Text("No events this week...",
                        style: AppStyles.getSFUITextLightStyle2(
                            18.0, Colors.black, FontWeight.w300)),
                  ],
                ),
              ),

              Padding(padding: EdgeInsets.only(left: 10.0),),

              Row(
                children: <Widget>[
                  Text( "",
                      style: AppStyles.getSFUITextMediumStyle(
                          20.0, 0.56, Colors.black, FontWeight.w500)),
                  SizedBox(width: 8.0),
//                Image.asset('assets/images/rightarrow2.png')
                ],
              ),

              Padding(padding: EdgeInsets.only(left: 10.0),),

            ],
          )),
    ),
  );
}