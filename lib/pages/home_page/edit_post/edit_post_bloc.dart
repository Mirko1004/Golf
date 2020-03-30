import 'package:golf/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class EditPostBloc extends BaseBloc {

  final String postId;
  final String postText;

  final BehaviorSubject<bool> done = BehaviorSubject.seeded(false);

  EditPostBloc(this.postId, this.postText);

  @override
  void dispose() {
    done.close();
    super.dispose();
  }

  postSubmit(String postText)  {
    showProgress(true);
    httpDataClientInterface.postEdit(postId, postText).then((valid) async {
      await dataCache.getTimelinePosts(false);
      showProgress(false);
      done.value = true;
    }).catchError((err){
      showProgress(false);
      showError(err.toString());
    });
  }
}