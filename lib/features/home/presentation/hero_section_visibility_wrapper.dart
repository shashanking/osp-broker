import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HeroSectionVisibilityWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback onVisible;
  final VoidCallback onInvisible;

  const HeroSectionVisibilityWrapper({
    super.key,
    required this.child,
    required this.onVisible,
    required this.onInvisible,
  });

  @override
  State<HeroSectionVisibilityWrapper> createState() => _HeroSectionVisibilityWrapperState();
}

class _HeroSectionVisibilityWrapperState extends State<HeroSectionVisibilityWrapper> {
  bool _wasVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('hero-section-visibility'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5 && !_wasVisible) {
          _wasVisible = true;
          widget.onVisible();
        } else if (info.visibleFraction <= 0.5 && _wasVisible) {
          _wasVisible = false;
          widget.onInvisible();
        }
      },
      child: widget.child,
    );
  }
}
