import 'dart:ui';

import 'package:flutter/material.dart';

class ToolbarButton extends StatelessWidget {
  final bool isActive;
  final Widget child;

  const ToolbarButton({
    super.key,
    this.isActive = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.25),
            borderRadius: BorderRadiusDirectional.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
