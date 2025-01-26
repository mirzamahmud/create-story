import 'package:create_story/app/components/matrix_gesture/matrix_gesture_detector.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onDragStart;
  final VoidCallback onDragEnd;
  const OverlayWidget(
      {required this.child,
      super.key,
      required this.onDragStart,
      required this.onDragEnd});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());

    return MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm) {
          notifier.value = m;
        },
        onScaleStart: () {
          onDragStart();
        },
        onScaleEnd: () {
          onDragEnd();
        },
        child: AnimatedBuilder(
            animation: notifier,
            builder: (context, childWidget) => Transform(
                  transform: notifier.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: child,
                    ),
                  ),
                )));
  }
}
