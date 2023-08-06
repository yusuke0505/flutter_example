import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  const PostButton({
    super.key,
    required this.onTap,
    required this.enable,
    required this.label,
  });

  final VoidCallback onTap;
  final bool enable;
  final String label;

  @override
  Widget build(BuildContext context) {
    const radius = 4.0;
    return Material(
      color: Colors.blue.withOpacity(enable ? 1 : 0.5),
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: enable ? onTap : null,
        borderRadius: BorderRadius.circular(radius),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
