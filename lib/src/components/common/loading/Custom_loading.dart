import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading {
  static Widget? progressiveDots(Color color, double size) {
    return LoadingAnimationWidget.progressiveDots(color: color, size: size);
  }
}
