import 'dart:io';

import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/profile_view_long.dart';
import 'package:golf/repository/network/model/profile_view_short.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

class ProfileSetup1Bloc extends BaseBloc {

  final BehaviorSubject<File> imageFile = BehaviorSubject<File>();
  final BehaviorSubject<bool> isMale = BehaviorSubject<bool>.seeded( true );
  final BehaviorSubject<bool> done = BehaviorSubject.seeded(false);
  ProfileViewShort profileViewShort;
  ProfileViewLong profileViewLong;

  @override
  void dispose() {
    imageFile.close();
    isMale.close();
    done.close();
    super.dispose();
  }

  openCamera() async {
    try {
      File image = await ImagePicker.pickImage(source: ImageSource.camera);
      if(image == null) return;
      _cropImage(image);
    } catch (e) {
      showError(e.toString());
    }
  }

  openGallery() async {
    try {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if(image == null) return;
      _cropImage(image);
    } catch (e) {
      showError(e.toString());
    }
  }

  Future<Null> _cropImage(File image) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      maxWidth: 512,
      maxHeight: 512,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
//            toolbarColor: Colors.deepOrange,
//            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false)
        ,
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
          aspectRatioLockEnabled: true,
        )
    );
    imageFile.value = croppedFile;
  }

  continueToStep2() {
    done.value = true;
  }

}