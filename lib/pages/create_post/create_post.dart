import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/create_post/create_post_bloc.dart';
import 'package:golf/pages/create_post/post_app_bar.dart';
import 'package:golf/pages/create_post/uploaded_file_widget/uploaded_image_widget.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class CreatePost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final CreatePostBloc _createPostBloc = CreatePostBloc();
  final TextEditingController _postText = TextEditingController();
  StreamSubscription _doneSubscription;

  @override
  void initState() {
    _doneSubscription = _createPostBloc.done.listen((done) {
      if (done) Navigator.of(context).pop();
    });
    super.initState();
  }

  @override
  void dispose() {
    _doneSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocScaffoldWidget(

      _createPostBloc,

      getPostAppBar(context, _createPostBloc, 'POST', _canGoBack),

        GestureDetector(

          onVerticalDragDown: (dragDownDetails) {
            if (MediaQuery.of(context).viewInsets.bottom > 0.0) FocusScope.of(context).requestFocus(new FocusNode());
          },

          child: Stack(
            children: <Widget>[

              Column(
                children: <Widget>[

                  Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          controller: _postText,
                          decoration: InputDecoration.collapsed(
                              hintText: "Share or post something...",
                              hintStyle: TextStyle(
                                  fontFamily: 'SFrancisco',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: AppColors.blackColor3)
                          )
                      )
                  ),

                  StreamBuilder<List<UploadedFileContainer>>(
                    initialData: List(),
                    stream: _createPostBloc.postUploadedContainers,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {

                      List<UploadedFileContainer> data = snapshot.data;

                      return Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: GridView.extent(
                              maxCrossAxisExtent: MediaQuery.of(context).size.width/3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              children: data.map<Widget>((entry) => UploadedImageWidget(ValueKey(entry.fileUUID), _createPostBloc, entry.fileUUID, entry.uploadFile, entry.uploadFileType, entry.gifUrl)).toList(),
                            ),
                          ),
                      );

                    },
                  ),
                ],
              ),

              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: SafeArea(
                  child: actionsRow(context, _createPostBloc),
                ),

              ),

            ],
          ),


        ),

    );
  }

  actionsRow(BuildContext context, CreatePostBloc createPostBloc) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(onTap: () => createPostBloc.openGiphy(context), child: Image.asset('assets/images/gif.png')),
//          InkWell(onTap: () {}, child: Image.asset('assets/images/smile.png')),
          InkWell(
              onTap: () => _showBottomSheet(true),
              child: Image.asset('assets/images/gallery.png')),
          InkWell(
            onTap: () => _showBottomSheet(false),
            child: Image.asset('assets/images/camera.png'),
          ),
          Container(
              width: 97.0,
              height: 40.0,
              decoration: new BoxDecoration(
                color: AppColors.lightWhite2,
                border:
                new Border.all(color: AppColors.orangeColor, width: 1.0),
                borderRadius: new BorderRadius.horizontal(),
              ),
              child: InkWell(
                  onTap: () {

                    if( _postText.text.isEmpty && _createPostBloc.postUploadedContainers.value.isEmpty )
                      return;

                    if( _createPostBloc.postUploadedContainers.value.where((postUploadContainer) => postUploadContainer.fileID == null).isNotEmpty )
                      return;

                    _createPostBloc.postSubmit(_postText.text);
                  },
                  child: Center(
                    child: Text(
                      "POST",
                      style: AppStyles.getSurannaStyle2(
                          20.0, 1.38, AppColors.greenColor, 2.0),
                    ),
                  ))),
        ],
      ),
    );
  }

  _canGoBack() async {
    if(await _canPop())
      Navigator.of(context).pop();
  }

  _canPop() async {
    if( _createPostBloc.postUploadedContainers.value.where((postUploadContainer) => postUploadContainer.fileID == null).isNotEmpty )
      return false  ;

    if(_createPostBloc.isProgressVisible())
      return false  ;

    if( _createPostBloc.postUploadedContainers.value.isNotEmpty )
      await _createPostBloc.deleteOrpahans();

    return true;
  }

  _showBottomSheet(bool gallery){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)), ),
        builder: (context) {
          return Container(
            child: Column(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(top:10.0, left: 20.0, right: 20.0),
                  child: ListTile(
                    leading: Icon(Icons.image),
                    title: Text("Images"),
                    onTap: () {
                      if(gallery)
                        _createPostBloc.openGallery(true);
                      else
                        _createPostBloc.openCamera(true);

                      Navigator.pop(context);
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top:10.0, left: 20.0, right: 20.0),
                  child: ListTile(
                    leading: Icon(Icons.video_library),
                    title: Text("Video"),
                    onTap: () {
                      if(gallery)
                        _createPostBloc.openGallery(false);
                      else
                        _createPostBloc.openCamera(false);

                      Navigator.pop(context);
                    },
                  ),
                ),

              ],
            ),
          );
        });
  }

}
