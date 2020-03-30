import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:golf/pages/common_widgets/modal_sheet.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/pages/home_page/selected_highlight/selected_highlight.dart';
import 'package:golf/pages/video_player/video_player.dart';
import 'package:golf/utils/app_styles.dart';

class HighlightsRow extends StatelessWidget {

  final PostRowViewModel _postRowViewModel;

  HighlightsRow(this._postRowViewModel);

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

    return InkWell(
      onTap: () => YudizModalSheet.show( context: context, child: SelectedHighlight(_postRowViewModel), title: "HIGHLIGHT", ),
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        width: 200.0,
        height: 140.0,
        child: Stack(
          children: <Widget>[

            PageView(
              children: widgets,
              physics: ClampingScrollPhysics(),
            ),

            Positioned(
              left: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.0, 0.99],
                      colors: <Color>[Color(0xbf131E06), Color(0x0a000000)]
                  ),
                ),

                child: Html(
                  padding: EdgeInsets.all(10.0),
                  data: _postRowViewModel.postTitle,
                  defaultTextStyle: AppStyles.getSFUITextLightStyle2(16.0, Colors.white, FontWeight.w300),
                ),
              ) ,

            ),

          ],
        ),
      ),
    );
  }
}

getImageContainer(BuildContext context, String imageUrl) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 0.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.none,
        image: CachedNetworkImageProvider(imageUrl),
      ),
    ),
  );
}

getVideoContainer(BuildContext context, String imageUrl, String videoUrl) {
  return InkWell(
    onTap: () => Navigator.of(context).push(MaterialPageRoute( builder: (context) => VideoWidget(videoUrl) )),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.none,
          image: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    ),
  );
}
