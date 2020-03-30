import 'package:flutter/material.dart';
import 'package:golf/pages/common_widgets/modal_sheet.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/pages/timeline_post/timeline_post_widget.dart';

class PopularThisWeekRow extends StatefulWidget {

  final PostRowViewModel _postRowViewModel;

  PopularThisWeekRow( this._postRowViewModel );

  @override
  State<StatefulWidget> createState() => _PopularThisWeekRowState();

}

class _PopularThisWeekRowState extends State<PopularThisWeekRow> {

  @override
  Widget build(BuildContext context) {

    final widgets = List<Widget>();

    if(widget._postRowViewModel.images.isNotEmpty){
      widgets.addAll( widget._postRowViewModel.images.map<Widget>((imageAttach) => getImageContainer(context, imageAttach) ).toList() );
    }

    if(widget._postRowViewModel.videos.isNotEmpty){
      widgets.addAll( widget._postRowViewModel.videos.keys.map<Widget>((attach) => getVideoContainer(context, attach, widget._postRowViewModel.videos[attach]) ).toList() );
    }

    if( widgets.isEmpty )
      return Container();

    return InkWell(
      onTap: () => YudizModalSheet.show( context: context, child: TimelinePostWidget(widget._postRowViewModel), title: "POST" ),

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width ,
        child: PageView(
          children: widgets,
          physics: ClampingScrollPhysics(),
        ),
      ),
    );

  }

}

getImageContainer(BuildContext context, String imageUrl) {
  return Container(
    height: 200.0,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: NetworkImage(imageUrl),
      ),
    ),
  );
}

getVideoContainer(BuildContext context, String imageUrl, String videoUrl) {
  return Container(
    height: 200.0,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: NetworkImage(imageUrl),
      ),
    ),
  );
}
