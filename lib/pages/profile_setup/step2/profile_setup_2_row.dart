import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:golf/pages/profile_setup/step2/profile_setup_2_bloc.dart';
import 'package:golf/repository/network/model/get_orgs_response.dart';

class ProfileSetup2Row extends StatelessWidget {

  final ProfileSetup2Bloc profileSetup2Bloc;
  final String id;
  final String title;
  final String imageUrl;
  final String membersCount;
  final String holesCount;
  final rowHeight = 120.0;

  ProfileSetup2Row( this.profileSetup2Bloc, this.id, this.title, this.imageUrl, this.membersCount, this.holesCount );

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<Organization>(
      initialData: null,
      stream: profileSetup2Bloc.selectedOrganization,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        return InkWell(
          onTap: () => profileSetup2Bloc.selectOrganization(id),
          child: Stack(
            children: <Widget>[

              Container(
                height: rowHeight,
                child: Column(
                  children: <Widget>[

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Container(
                          width: 80.0,
                          height: 80.0,
                          child: Image(
                            image: CachedNetworkImageProvider(imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),

                        Padding( padding: EdgeInsets.only(left: 20.0), ),

                        Container(
                          height: 80.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text( title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 20.0,
                                      fontFamily: 'Suranna-Regular',
                                      letterSpacing: 0.77,
                                      color: Color(0xff323643)
                                  )
                              ),

                              Text('Tampa, FL',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 16.0,
                                      fontFamily: 'SFrancisco',
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xE67a7a7a)
                                  )
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                  Image(
                                    image: AssetImage("assets/images/countr_club_star.png"),
                                    width: 13.0,
                                    height: 13.0,
                                  ),

                                  Padding( padding: EdgeInsets.only(right: 5.0), ),

                                  Text( membersCount,
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 14.0,
                                          fontFamily: 'SFrancisco',
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xE67a7a7a)
                                      )
                                  ),

                                  Padding( padding: EdgeInsets.only(right: 15.0), ),

                                  Image(
                                    image: AssetImage("assets/images/country_club_holes.png"),
                                    width: 13.0,
                                    height: 13.0,
                                  ),

                                  Padding( padding: EdgeInsets.only(right: 5.0), ),

                                  Text( holesCount,
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 14.0,
                                          fontFamily: 'SFrancisco',
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xE67a7a7a)
                                      )
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 1.0,
                        color: Color(0xffD8D8D8),
                      ),
                    ),



                  ],
                ),
              ),

              if( snapshot.data != null && snapshot.data.id != id ) ... [
                Container(
                  height: rowHeight,
                  color: Color(0xccffffff),
                ),
              ],


            ],
          ),

        );

      },

    );

  }

}