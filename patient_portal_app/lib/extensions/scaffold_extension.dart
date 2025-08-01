import 'package:flutter/material.dart';

extension ScaffoldExtension on Widget {

  Widget get emptyScaffold =>
      Scaffold(body: SafeArea(bottom: false, top: false, child: this));
      
  Widget get simpleScaffold => Scaffold(
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: this)],
      ),
    ),
  );

  Widget emptyScaffoldWithProps({
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    Widget? bottomNavigationBar
  }) => Scaffold(
    floatingActionButton: floatingActionButton,
    floatingActionButtonLocation: floatingActionButtonLocation,
    floatingActionButtonAnimator: floatingActionButtonAnimator,
    bottomNavigationBar: bottomNavigationBar,
    body: SafeArea(bottom: false, top: false, child: this),
  );
}