import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:golf/pages/video_player/cheview_widget.dart';
import 'package:golf/pages/video_player/video_chewie.dart';
import 'package:path/path.dart';

class PostMediaViewer extends StatefulWidget {

  final List<String> _imagesAttach;
  final Map<String, String> _videoAttach;
  final List<String> _linkAttach;
  final Function onPageChanged;

  PostMediaViewer(this._imagesAttach, this._videoAttach, this._linkAttach, this.onPageChanged);

  @override
  State<StatefulWidget> createState() => _PostMediaViewerState();
}

class _PostMediaViewerState extends State<PostMediaViewer> {

  @override
  Widget build(BuildContext context) {

    final widgets = List<Widget>();

    if(widget._imagesAttach.isNotEmpty){
      widgets.addAll( widget._imagesAttach.map<Widget>((imageAttach) => getImageContainer(context, imageAttach) ).toList() );
    }

    if(widget._linkAttach.isNotEmpty){
      widgets.addAll( widget._linkAttach.map<Widget>((linkAttach) => getImageContainer(context, linkAttach) ).toList() );
    }

    if(widget._videoAttach.isNotEmpty){
      widgets.addAll( widget._videoAttach.keys.map<Widget>((attach) => getVideoContainer(context, attach, widget._videoAttach[attach]) ).toList() );
    }

    if( widgets.isEmpty )
      return Container();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width ,
      child: PageView(
        children: widgets,
        physics: ClampingScrollPhysics(),
        onPageChanged: (page) => widget.onPageChanged(page),
      ),
    );

  }

}

getImageContainer(BuildContext context, String imageUrl) {
  bool isGif = extension(imageUrl) == ".gif";
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 0.0),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.width ,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitHeight,
        image: isGif ? NetworkImage(imageUrl, headers: {'accept': 'image/*'}) : CachedNetworkImageProvider(imageUrl),
      ),
    ),
  );
}

getVideoContainer(BuildContext context, String imageUrl, String videoUrl) {

//  return InkWell(
////    onTap: () => Navigator.of(context).push(MaterialPageRoute( builder: (context) => VideoWidget(videoUrl) )),
//    onTap: () => Navigator.of(context).push(MaterialPageRoute( builder: (context) => ChewieDemo(videoUrl) )),
//    child: Container(
//      child: WebView( initialUrl: videoUrl,),
//      padding: EdgeInsets.symmetric(horizontal: 0.0),
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.width ,
////      decoration: BoxDecoration(
////        image: DecorationImage(
////          fit: BoxFit.fitHeight,
////          image: NetworkImage(imageUrl),
////        ),
////      ),
//    ),
//  );

  return InkWell(
//    onTap: () => Navigator.of(context).push(MaterialPageRoute( builder: (context) => VideoWidget(videoUrl) )),
    onTap: () => Navigator.of(context).push(MaterialPageRoute( builder: (context) => ChewieDemo(videoUrl, imageUrl) )),
    child: Stack(
      children: <Widget>[

        ChewieWidget(videoUrl, imageUrl),

//        Container(
//          padding: EdgeInsets.symmetric(horizontal: 0.0),
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.width ,
//          decoration: BoxDecoration(
//            image: DecorationImage(
//              fit: BoxFit.fitHeight,
//              image: CachedNetworkImageProvider(imageUrl),
//            ),
//          ),
//        ),

        Center(
          child: Image.asset('assets/images/ic_videos.png'),
        ),


      ],
    ),
  );
}
