import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:golf/pages/create_post/uploaded_file_widget/uploaded_image_widget_bloc.dart';
import 'package:golf/repository/network/model/upload_file_response.dart';

getNotUploadedVideoWidget(){
  return Container(
    color: Colors.grey,
    child: Center(
      child: Icon(Icons.ondemand_video, color: Colors.white, size: 28,),
    ),
  );
}

getUploadedVideoWidget(UploadedImageWidgetBloc uploadedImageWidgetBloc, FileUploadResponse fileUploadResponse) {

  return Stack(
    children: <Widget>[

      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: AlignmentDirectional.topEnd,
            fit: BoxFit.fitWidth,
            image: CachedNetworkImageProvider(fileUploadResponse.fileUrl),
          ),
        ),
      ),

      Positioned(
        top: 12.0,
        right: 12.0,
        height: 23.0,
        width: 23.0,
        child: InkWell(
          onTap: () => uploadedImageWidgetBloc.deleteVideo(),
          child: Icon(Icons.delete, color: Colors.white,),
        ),

      ),

    ],
  );
}
