import 'package:flutter/material.dart';
import 'package:gazhome/core/utilities/app_functions.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.backgroundColor,
    this.drawer,
    this.appBar,
    this.bottomNavigationBar,
    this.padding = EdgeInsets.zero,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.onTap,
  });

  final Color? backgroundColor;
  final Widget? drawer;
  final Widget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry padding;
  final bool? resizeToAvoidBottomInset;
  final VoidCallback? onTap;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? AppFunctions.unFocusKeyboard,
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        drawer: drawer,
        body: Column(
          children: [
            if (appBar != null) SafeArea(bottom: false, child: appBar!),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(padding: padding, child: body),
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
