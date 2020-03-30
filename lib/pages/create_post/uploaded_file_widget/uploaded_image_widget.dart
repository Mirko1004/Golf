import 'dart:io';
import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/create_post/create_post_bloc.dart';
import 'package:golf/pages/create_post/uploaded_file_widget/containers/gif_container.dart';
import 'package:golf/pages/create_post/uploaded_file_widget/containers/uploaded_image_container.dart';
import 'package:golf/pages/create_post/uploaded_file_widget/containers/uploaded_video_container.dart';
import 'package:golf/pages/create_post/uploaded_file_widget/uploaded_image_widget_bloc.dart';
import 'package:golf/repository/network/model/upload_file_response.dart';

class UploadedImageWidget extends StatefulWidget {

  final CreatePostBloc _createPostBloc;
  final String _fileUUID;
  final File _uploadFile;
  final UploadFileType _uploadFileType;
  final String gifUrl;

  const UploadedImageWidget(Key key, this._createPostBloc, this._fileUUID, this._uploadFile, this._uploadFileType, this.gifUrl) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UploadedImageWidgetState(_createPostBloc, _fileUUID, _uploadFile, _uploadFileType, this.gifUrl);
}

class _UploadedImageWidgetState extends State<UploadedImageWidget> {

  final UploadedImageWidgetBloc _uploadedImageWidgetBloc;

  _UploadedImageWidgetState(CreatePostBloc _createPostBloc, String _fileUUID, File _imageFile, UploadFileType _uploadFileType, String gifUrl)
      : _uploadedImageWidgetBloc = UploadedImageWidgetBloc(_createPostBloc, _fileUUID, _imageFile, _uploadFileType, gifUrl);

  @override
  Widget build(BuildContext context) {

    return BaseBlocWidget(
      _uploadedImageWidgetBloc,

      StreamBuilder<FileUploadResponse>(
        stream: _uploadedImageWidgetBloc.uploadedFile,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if(snapshot.data == null){
            if(widget._uploadFileType == UploadFileType.IMAGE)
              return getNotUploadedImageWidget(widget._uploadFile);
            else if(widget._uploadFileType == UploadFileType.VIDEO)
              return getNotUploadedVideoWidget();
            else
              return getGifWidget(_uploadedImageWidgetBloc, widget.gifUrl);
          }
          else{
            if(widget._uploadFileType == UploadFileType.IMAGE)
              return getUploadedImageWidget(_uploadedImageWidgetBloc, snapshot.data);
            else if(widget._uploadFileType == UploadFileType.VIDEO)
              return getUploadedVideoWidget(_uploadedImageWidgetBloc, snapshot.data);
            else
              return getGifWidget(_uploadedImageWidgetBloc, widget.gifUrl);
          }

        },
      ),

    );

  }
}