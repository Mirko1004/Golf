import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

@immutable
class YudizModalSheet extends StatefulWidget {
  final YudizModalSheetDirection direction;
  final Color backgroundColor;
  final Widget child;
  final String title;

  YudizModalSheet({this.child, this.title, this.direction, this.backgroundColor});

  @override
  _YudizModalSheetState createState() => _YudizModalSheetState();

  static show(
      {@required BuildContext context,
        @required child,
        @required title,
        direction = YudizModalSheetDirection.BOTTOM,
        backgroundColor = const Color(0xb3212121)}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) {
              return YudizModalSheet(
                child: child,
                title: title,
                direction: direction,
                backgroundColor: backgroundColor,
              );
            },
            opaque: false));
  }
}

class _YudizModalSheetState extends State<YudizModalSheet>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  final GlobalKey _childKey = GlobalKey();

  double get _childHeight {
    final RenderBox renderBox = _childKey.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  bool get _dismissUnderway =>
      _animationController.status == AnimationStatus.reverse;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _animation = Tween<double>(begin: _isDirectionTop() ? -1 : 1, end: 0)
        .animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) Navigator.pop(context);
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_dismissUnderway) return;

    var change = details.primaryDelta / (_childHeight ?? details.primaryDelta);
    if (_isDirectionTop())
      _animationController.value += change;
    else
      _animationController.value -= change;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway) return;

    if (details.velocity.pixelsPerSecond.dy > 0 && _isDirectionTop()) return;
    if (details.velocity.pixelsPerSecond.dy < 0 && !_isDirectionTop()) return;

    if (details.velocity.pixelsPerSecond.dy > 700) {
      final double flingVelocity =
          -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (_animationController.value > 0.0)
        _animationController.fling(velocity: flingVelocity);
    } else if (_animationController.value < 0.5) {
      if (_animationController.value > 0.0)
        _animationController.fling(velocity: -1.0);
    } else
      _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: onBackPressed,
        child: GestureDetector(
          onVerticalDragUpdate: _handleDragUpdate,
          onVerticalDragEnd: _handleDragEnd,
          child:
          Scaffold(
            backgroundColor: widget.backgroundColor,
            body: Column(
              key: _childKey,
              children: <Widget>[

                SizedBox( height: 20.0, ),

                _isDirectionTop() ? Container() : Spacer(),

                AnimatedBuilder(
                    animation: _animation,
                    builder: (context, _) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            0.0, width * _animation.value, 0.0),
                        child: Container(
                          width: width,
                          child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {},
                              child: headerWidget(widget.child, widget.title),
                          ),
                        ),
                      );
                    }),

              ],
            ),

          ),
          excludeFromSemantics: true,
        ));
  }

  bool _isDirectionTop() {
    return widget.direction == YudizModalSheetDirection.TOP;
  }

  Future<bool> onBackPressed() {
    _animationController.reverse();
    return Future<bool>.value(false);
  }

  headerWidget(Widget child, String title) {
    return Container(
      height: MediaQuery.of(context).size.height*.95,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular( 16.0)
            )
        ),
        child: Column(
          children: <Widget>[

            Padding( padding: EdgeInsets.only(top: 16.0),),

            Container(
              height: 65.0,
              width: MediaQuery.of(context).size.width,

              child: Stack(
                children: <Widget>[

                  Positioned(
                    top: 20.0,
                    left: 20.0,
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Image.asset( "assets/images/back_arrow.png",
                            height: 23.0,
                            width: 23.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            height: 6.0,
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                              color: Color(0x1a000000),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),

                        ],
                      ),


                      Text( title, style: AppStyles.getSurannaStyle(24.0, 0.0, AppColors.blackColor) ),


                      Container(
                        height: 1.0,
                        color: Color(0x1a000000),
                      ),

                    ],
                  ),

                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: child,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

enum YudizModalSheetDirection { TOP, BOTTOM }