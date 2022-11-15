import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.tooltip,
    this.icon,
    this.animatedIcon,
    this.progress,
    required this.onPressed,
  }) : assert(icon != null && animatedIcon == null || animatedIcon != null && icon == null && progress != null);

  final String? tooltip;
  final IconData? icon;
  final AnimatedIconData? animatedIcon;
  final Animation<double>? progress;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon != null
          ? Icon(
              icon,
              color: Colors.black,
              size: 24,
            )
          : AnimatedIcon(
              icon: animatedIcon!,
              progress: progress!,
              color: Colors.black,
              size: 24,
            ),
      tooltip: tooltip,
    );
  }
}
