import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:golf/pages/community/discover/popular_this_week/popular_this_week_row.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectedHighlight extends StatelessWidget {

  final PostRowViewModel _postRowViewModel;

  SelectedHighlight(this._postRowViewModel);

  @override
  Widget build(BuildContext context) {

    final widgets = List<Widget>();

    if(_postRowViewModel.images.isNotEmpty){
      widgets.addAll( _postRowViewModel.images.map<Widget>((imageAttach) => getImageContainer(context, imageAttach) ).toList() );
    }

    if(_postRowViewModel.videos.isNotEmpty){
      widgets.addAll( _postRowViewModel.videos.keys.map<Widget>((attach) => getVideoContainer(context, attach, _postRowViewModel.videos[attach]) ).toList() );
    }

    if( widgets.isEmpty )
      return Container();

    return Column(
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(horizontal:15.0,vertical:15.0),
          child: Text(_postRowViewModel.postTitle.toUpperCase(),
              style: AppStyles.getRobotoMediumStyle()),
        ),

        if(_postRowViewModel.linkAttach != null && _postRowViewModel.linkAttach.isNotEmpty) ... [

          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                    child: Text('more...', style: TextStyle(color: Colors.blueAccent),),
                    onTap: () => launch(_postRowViewModel.linkAttach.first.url)
                ),
              ],
            ),
          ),

        ],

        Container(
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                child: PageView(
                  children: widgets,
                  physics: ClampingScrollPhysics(),
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal:15.0,vertical:15.0),
          child: Html(
            data: _postRowViewModel.postText,
            defaultTextStyle: AppStyles.getSFUITextLightStyle2(16.0, AppColors.darkGrey, FontWeight.w300),
          ),
        ) ,

      ],
    );
  }

  getImageContainer(BuildContext context, String imageUrl) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }

//getVideoContainer(BuildContext context, String imageUrl, String videoUrl) {
//  return InkWell(
//    onTap: () => Navigator.of(context).push(MaterialPageRoute( builder: (context) => VideoWidget(videoUrl) )),
//    child: Container(
//      padding: EdgeInsets.symmetric(horizontal: 0.0),
//      decoration: BoxDecoration(
//        image: DecorationImage(
//          fit: BoxFit.none,
//          image: CachedNetworkImageProvider(imageUrl),
//        ),
//      ),
//    ),
//  );

}
