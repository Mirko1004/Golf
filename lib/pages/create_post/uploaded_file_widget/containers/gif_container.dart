import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:golf/pages/create_post/uploaded_file_widget/uploaded_image_widget_bloc.dart';

getGifWidget(UploadedImageWidgetBloc uploadedImageWidgetBloc, String gifUrl){
  return Stack(
    children: <Widget>[

      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: AlignmentDirectional.topEnd,
            fit: BoxFit.fitWidth,
            image: CachedNetworkImageProvider(gifUrl, headers: {'accept': 'image/*'}),
//            image: NetworkImage(gifUrl, headers: {'accept': 'image/*'}),
          ),
        ),
      ),

      Positioned(
        top: 12.0,
        right: 12.0,
        height: 23.0,
        width: 23.0,
        child: InkWell(
          onTap: () => uploadedImageWidgetBloc.deleteGif(),
          child: Icon(Icons.delete, color: Colors.white,),
        ),

      ),

    ],
  );
}
