import 'package:flutter/material.dart';
import 'package:golf/base/base_widget.dart';
import 'package:golf/bloc/base_bloc.dart';

class BaseBlocWidget extends StatefulWidget {

  final BaseBloc _baseBloc;
  final Widget _body;

  BaseBlocWidget(this._baseBloc, this._body);

  @override
  State<StatefulWidget> createState() => _BaseBlocWidgetState();
}

class _BaseBlocWidgetState extends State<BaseBlocWidget> {

  @override
  void dispose() {
    widget._baseBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(widget._body, widget._baseBloc);
  }

}
