import 'package:flutter/material.dart';
import 'package:golf/base/base_widget.dart';
import 'package:golf/bloc/base_bloc.dart';

class BaseBlocScaffoldWidget extends StatefulWidget {

  final BaseBloc _baseBloc;
  final Widget _body;
  final PreferredSizeWidget _appBar;
  final String _appBarTitle;
  final Widget _floatingActionButton;
  final Widget _bottomNavigationBar;
  final Drawer _drawer;
  final bool _resizeToAvoidBottomInset;
  final FloatingActionButtonLocation actionLocation;
  final Key _scaffoldKey;
  final Color _backgroundColor;
  final List<Widget> _persistentFooterButtons;

  BaseBlocScaffoldWidget(this._baseBloc, this._appBar, this._body, {Widget floatingActionButton, bool resizeToAvoidBottomInset = true, Widget bottomNavigationBar, Drawer drawer
    ,this.actionLocation = FloatingActionButtonLocation.endDocked, Color backgroundColor, Key scaffoldKey, List<Widget> persistentFooterButtons}) :
        _appBarTitle = null,
        _floatingActionButton = floatingActionButton,
        _resizeToAvoidBottomInset = resizeToAvoidBottomInset,
        _bottomNavigationBar = bottomNavigationBar,
        _drawer = drawer,
        _scaffoldKey = scaffoldKey,
        _backgroundColor = backgroundColor,
        _persistentFooterButtons = persistentFooterButtons;

  BaseBlocScaffoldWidget.withTitle(this._baseBloc, this._appBarTitle, this._body, {FloatingActionButton floatingActionButton, bool resizeToAvoidBottomInset = true, Widget bottomNavigationBar, Drawer drawer
    ,this.actionLocation = FloatingActionButtonLocation.endDocked, Color backgroundColor, Key scaffoldKey, List<Widget> persistentFooterButtons}) :
        _appBar = null,
        _floatingActionButton = floatingActionButton,
        _resizeToAvoidBottomInset = resizeToAvoidBottomInset,
        _bottomNavigationBar = bottomNavigationBar,
        _drawer = drawer,
        _scaffoldKey = scaffoldKey,
        _backgroundColor = backgroundColor,
        _persistentFooterButtons = persistentFooterButtons;

  @override
  State<StatefulWidget> createState() => _BaseBlocScaffoldWidgetState();
}

class _BaseBlocScaffoldWidgetState extends State<BaseBlocScaffoldWidget> {

  @override
  void dispose() {
    widget._baseBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar;
    if (widget._appBar == null && widget._appBarTitle != null)
      appBar = AppBar( title: Text(widget._appBarTitle));
    else
      appBar = widget._appBar;

    return Scaffold(
      backgroundColor: widget._backgroundColor,
      appBar: appBar,
      floatingActionButton: widget._floatingActionButton,
      resizeToAvoidBottomInset: widget._resizeToAvoidBottomInset,
      body: BaseWidget(widget._body, widget._baseBloc),
      bottomNavigationBar: widget._bottomNavigationBar,
      drawer: widget._drawer,
      floatingActionButtonLocation: widget.actionLocation,
      key: widget._scaffoldKey,
      persistentFooterButtons: widget._persistentFooterButtons,
    );
  }
}