import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  final Future future;
  final Widget widget;
  Loading({required this.future, required this.widget});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return widget.widget;
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
