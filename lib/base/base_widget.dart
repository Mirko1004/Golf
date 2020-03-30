import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golf/bloc/base_bloc.dart';

class BaseWidget extends StatefulWidget {

  final Widget _body;
  final BaseBloc _baseBloc;

  BaseWidget(this._body, this._baseBloc);

  @override
  State<StatefulWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {

  StreamSubscription errorStreamSubscription;
  StreamSubscription toastSubscription;

  @override
  void initState() {
//    errorStreamSubscription = widget._baseBloc.errorStream.listen((errorTuple) {
//      if(errorTuple.item1.isNotEmpty)
//        _showErrorDialog(context, errorTuple.item1, errorTuple.item2);
//    });
//    toastSubscription = widget._baseBloc.toastStream.listen((text) {
//      if(text.isNotEmpty)
//        _showToast(context, text);
//    });

    super.initState();
  }


  @override
  void dispose() {
    errorStreamSubscription?.cancel();
    toastSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget._body,
        _progressLayoutWidget(widget._baseBloc),
      ],
    );
  }
}

Widget _progressLayoutWidget(BaseBloc baseBloc) {
  return StreamBuilder<bool>(
    initialData: false,
    stream: baseBloc.progressVisible,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if(snapshot.data)
        return Center(
          child: CircularProgressIndicator( ),
        );
      else
        return new Container();
    },
  );
}

void _showErrorDialog(BuildContext context, String errorTitle, String errorString){
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      title: new Text(errorTitle),
      content: new Text(errorString),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("OK"),
        ),
      ],
    );
  });
}

_showToast(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    duration: Duration(seconds: 2),
  );
  if(Scaffold.of(context).mounted)
    Scaffold.of(context).showSnackBar( snackBar );
  else
    _showMessageDialog(context, text);
}

_showMessageDialog(BuildContext context, String messageText){
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      content: new Text(messageText),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("OK"),
        ),
      ],
    );
  });
}
