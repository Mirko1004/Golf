import 'dart:io';

import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/upload_file_response.dart';
import 'package:rxdart/rxdart.dart';

import '../create_post_bloc.dart';

class UploadedImageWidgetBloc extends BaseBloc {

  final CreatePostBloc _createPostBloc;
  final File _uploadFile;
  final BehaviorSubject<FileUploadResponse> uploadedFile = BehaviorSubject<FileUploadResponse>();
  final String fileUUID;
  final UploadFileType _uploadFileType;
  final String gifUrl;

  UploadedImageWidgetBloc(this._createPostBloc, this.fileUUID, this._uploadFile, this._uploadFileType, this.gifUrl){
    if(_uploadFileType == UploadFileType.IMAGE)
      _uploadImage(_uploadFile);
    else if(_uploadFileType == UploadFileType.VIDEO)
      _uploadVideo(_uploadFile);
    else if(_uploadFileType == UploadFileType.GIF)
      uploadedFile.value = FileUploadResponse(fileId: fileUUID, fileUrl: gifUrl, uploaderUid: fileUUID, uploadFileType: UploadFileType.GIF);
  }

  @override
  void dispose() {
    uploadedFile.close();
    super.dispose();
  }

  _uploadImage(File image) {
    showProgress(true);
    httpDataClientInterface.uploadPostImageWithUUID(fileUUID, image).then((fileUploadResponse){
      showProgress(false);
      uploadedFile.value = fileUploadResponse;
      _createPostBloc.addUploadedFileId(fileUUID, fileUploadResponse.fileId);
    }).catchError((err){
      showProgress(false);
      _createPostBloc.showError(err.error.errorText);
      _createPostBloc.removeUploadedFile(fileUUID);
    });
  }

  deleteImage(){
    showProgress(true);
    httpDataClientInterface.deletePostImageByUUID(fileUUID).then((success){

      showProgress(false);
      _createPostBloc.removeUploadedFile(fileUUID);

    }).catchError((err){
      showProgress(false);
      _createPostBloc.showError(err.toString());
    });
  }

  deleteVideo(){
    showProgress(true);
    httpDataClientInterface.deletePostVideoByUUID(fileUUID).then((success){
      showProgress(false);

      _createPostBloc.removeUploadedFile(fileUUID);

    }).catchError((err){
      showProgress(false);
      showError(err.toString());
    });
  }

  deleteGif(){
      _createPostBloc.removeUploadedFile(fileUUID);
  }

  _uploadVideo(File video) {
    showProgress(true);
    httpDataClientInterface.uploadPostVideoWithUUID(fileUUID, video).then((fileUploadResponse){
      showProgress(false);

      _checkVideoProcessed(fileUploadResponse);

    }).catchError((err){
      showProgress(false);
      _createPostBloc.showError(err.toString());
      _createPostBloc.removeUploadedFile(fileUUID);
    });
  }

  _checkVideoProcessed(FileUploadResponse fileUploadResponse) async {
    try {
      showProgress(true);
      bool isDone = await httpDataClientInterface.timelineVideoTranscodeStatus(fileUploadResponse.fileId);
      if(isDone){

        _getVideoData(fileUploadResponse);

      } else
        await Future.delayed(Duration(seconds: 1), () => _checkVideoProcessed(fileUploadResponse) );

    } catch (err) {
      showProgress(false);
      _createPostBloc.showError(err.toString());
      _createPostBloc.removeUploadedFile(fileUUID);
    }
  }

  _getVideoData(FileUploadResponse fileUploadResponse) async {

      showProgress(true);
      httpDataClientInterface.getPostVideoData(fileUploadResponse.fileId).then((getVideoDataResponse){

        showProgress(false);
        fileUploadResponse.fileUrl = getVideoDataResponse.videoPoster;
        uploadedFile.value = fileUploadResponse;
        _createPostBloc.addUploadedFileId(fileUUID, fileUploadResponse.fileId);

      }).catchError((err){
        showProgress(false);
        _createPostBloc.showError(err.toString());
        _createPostBloc.removeUploadedFile(fileUUID);
      });
  }

}