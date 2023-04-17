import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomText extends HookConsumerWidget {
  final String title;
  final Color color;
  final Color colorHover;
  const CustomText({
    super.key,
    required this.title,
    required this.color,
    required this.colorHover,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    return MouseRegion(
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: GestureDetector(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isHover.value ? colorHover : color,
              ),
            ),
            const SizedBox(height: 5),
            //* Mostar Subrayado
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: isHover.value,
              child: Container(
                height: 2,
                width: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
