import 'package:flutter/material.dart';

class AnimatedIconWithShadow extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Color selectedColor;

  const AnimatedIconWithShadow({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.selectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 30, // Constrain the size as needed
          height: 30, // Constrain the size as needed
          child: Stack(
            clipBehavior: Clip.none, // Allow overflow if needed
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 100),
                left: isSelected ? -2 : 0,
                top: isSelected ? 2 : 0,
                child: Icon(
                  icon,
                  color: Colors.grey.withOpacity(0.5),
                  size: 30, // Ensure consistent icon size
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 100),
                left: isSelected ? 2 : 0,
                top: isSelected ? -2 : 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  child: Icon(
                    icon,
                    color: isSelected ? selectedColor : Colors.grey,
                    size: 30, // Ensure consistent icon size
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4), // Space between icon and text
        Text(
          label,
          style: TextStyle(
            color: isSelected ? selectedColor : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}