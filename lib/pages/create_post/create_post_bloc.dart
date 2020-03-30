import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/upload_file_response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class UploadedFileContainer {
  final String fileUUID;
  final File uploadFile;
  final UploadFileType uploadFileType;
  String fileID;
  String gifUrl;

  UploadedFileContainer(this.fileUUID, this.uploadFile, this.uploadFileType, {this.fileID, this.gifUrl});
}

class CreatePostBloc extends BaseBloc {

  final BehaviorSubject<bool> done = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<UploadedFileContainer>> postUploadedContainers = BehaviorSubject<List<UploadedFileContainer>>.seeded(List());

  @override
  void dispose() {
    done.close();
    postUploadedContainers.close();
    super.dispose();
  }

  openCamera(bool isImage) async {
    if(isImage){
      try {
        File image = await ImagePicker.pickImage(
            source: ImageSource.camera,
            maxWidth: 1024
        );
        if(image == null) return;
          postUploadedContainers.value = postUploadedContainers.value..add( UploadedFileContainer( Uuid().v4(), image, UploadFileType.IMAGE ) );
      } catch (e) {
        showError(e.toString());
      }
    } else {
      try {
        File video = await ImagePicker.pickVideo(
          source: ImageSource.camera,
        );
        if(video == null) return;
          postUploadedContainers.value = postUploadedContainers.value..add( UploadedFileContainer( Uuid().v4(), video, UploadFileType.VIDEO ) );
      } catch (e) {
        showError(e.toString());
      }
    }
  }

  openGallery(bool isImage) async {
    if(isImage){
      try {
        File image = await ImagePicker.pickImage(
            source: ImageSource.gallery,
            maxWidth: 1024
        );
        if(image == null) return;

        postUploadedContainers.value = postUploadedContainers.value..add( UploadedFileContainer( Uuid().v4(), image, UploadFileType.IMAGE ) );

      } catch (e) {
        showError(e.toString());
      }
    } else {
      try {
        File video = await FilePicker.getFile(type: FileType.VIDEO);
        if(video == null) return;

        postUploadedContainers.value = postUploadedContainers.value..add( UploadedFileContainer( Uuid().v4(), video, UploadFileType.VIDEO ) );

      } catch (e) {
        showError(e.toString());
      }
    }
  }

  openGiphy(BuildContext context) async {
    final gif = await GiphyPicker.pickGif(
        context: context,
        apiKey: '2b7LO8KIUa3tZ5qdvS1qV3fzkLOnhtMp'
    );
    String uuid = Uuid().v4();
    postUploadedContainers.value = postUploadedContainers.value..add( UploadedFileContainer( uuid, null, UploadFileType.GIF, fileID: uuid, gifUrl: gif.images.original.url ) );
  }

  addUploadedFileId(String fileUUID, String fileId) {
    postUploadedContainers.value.firstWhere((uploadedFileContainter) => uploadedFileContainter.fileUUID == fileUUID).fileID = fileId;
    postUploadedContainers.value = postUploadedContainers.value;
  }

  removeUploadedFile(String fileUUID) {
    postUploadedContainers.value = postUploadedContainers.value..removeWhere((uploadedFileContainter) => uploadedFileContainter.fileUUID == fileUUID);
  }

  deleteOrpahans() async {
    await httpDataClientInterface.deleteImageOrphans();
    await httpDataClientInterface.deleteVideoOrphans();
  }

  postSubmit(String postText)  {
    List<String> imagesList = postUploadedContainers.value.where((postUploadedContainer) => postUploadedContainer.uploadFileType == UploadFileType.IMAGE)
        .map((postUploadedContainer) => postUploadedContainer.fileID).toList();

    List<String> videoList = postUploadedContainers.value.where((postUploadedContainer) => postUploadedContainer.uploadFileType == UploadFileType.VIDEO)
        .map((postUploadedContainer) => postUploadedContainer.fileID).toList();

    List<String> gifList = postUploadedContainers.value.where((postUploadedContainer) => postUploadedContainer.uploadFileType == UploadFileType.GIF)
        .map((postUploadedContainer) => postUploadedContainer.gifUrl).toList();

    showProgress(true);
    httpDataClientInterface.postSubmit(postText, imagesList, videoList, gifList ).then((valid) async {
        _done();
    }).catchError((err){
      showProgress(false);
      showError(err.toString());
    });
  }

  _done() async {
    await Future.delayed(Duration(seconds: 1));
    await dataCache.getTimelinePosts(false);
    showProgress(false);
    done.value = true;
  }
}

//  Future<Null> _cropImage(File image) async {
//    File croppedFile = await ImageCropper.cropImage(
//        sourcePath: image.path,
//        aspectRatioPresets: [CropAspectRatioPreset.original],
//        maxWidth: 1024,
////        maxHeight: 1024,
//        androidUiSettings: AndroidUiSettings(
//            toolbarTitle: 'Crop Image',
////            toolbarColor: Colors.deepOrange,
////            toolbarWidgetColor: Colors.white,
//            initAspectRatio: CropAspectRatioPreset.original,
//            lockAspectRatio: false)
//        ,
//        iosUiSettings: IOSUiSettings(
//          minimumAspectRatio: 1.0,
//          aspectRatioLockEnabled: true,
//        )
//    );
//    imageFile.value = croppedFile;
//  }

