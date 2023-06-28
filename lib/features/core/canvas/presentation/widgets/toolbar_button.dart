import 'package:flutter/material.dart';

class ToolbarButton extends StatefulWidget {
  final bool isActive;
  final Widget child;

  const ToolbarButton({
    super.key,
    this.isActive = false,
    required this.child,
  });

  @override
  State<ToolbarButton> createState() => _ToolbarButtonState();
}

class _ToolbarButtonState extends State<ToolbarButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: (value) => setState(() => isHovered = value),
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(18),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 120),
          decoration: BoxDecoration(
            color: widget.isActive || isHovered ? Colors.white.withOpacity(.05) : Colors.white.withAlpha(0),
            borderRadius: BorderRadiusDirectional.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 32,
              height: 32,
              child: FittedBox(
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
