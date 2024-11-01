import 'package:app/src/components/common/loading/Custom_loading.dart';
import 'package:app/src/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  final Widget widget;
  final bool condition;
  final Color color;
  final double size;
  final Duration duration;

  Loading({
    required this.widget,
    required this.color,
    required this.size,
    this.duration = const Duration(seconds: 3),
    required this.condition, // default duration set to 3 seconds
  });

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool isTimer = true;

  @override
  void initState() {
    super.initState();
    _startLoadingTimer();
  }

  void _startLoadingTimer() {
    Timer(widget.duration, () {
      setState(() {
        isTimer = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.condition || isTimer
        ? Container(
            color: primaryFond,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: CustomLoading.progressiveDots(widget.color, widget.size),
            ),
          )
        : widget.widget;
  }
}
