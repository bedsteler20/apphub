import 'package:flutter/material.dart';
import 'package:flux/flux.dart';

class PageContentLayout extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets contentPadding;
  final double? width;

  const PageContentLayout({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.contentPadding = const EdgeInsets.all(0),
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: contentPadding,
          child: SizedBox(
            width: width ?? context.breakpoint(XXL),
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
