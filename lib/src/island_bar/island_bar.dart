import 'package:flutter/material.dart';
import 'island_bar_item.dart';
import 'island_bar_animation.dart';

class LekasBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<LekasBottomBarItem> items;

  const LekasBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxBarWidth = screenWidth - 20;
    final barWidth = (items.length * 80.0).clamp(0.0, maxBarWidth);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: screenWidth,
        height: 100,
        child: Center(
          child: Container(
            width: barWidth,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              // border: Border.all(color: Colors.grey.withOpacity(0.5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.asMap().entries.map((entry) {
                int index = entry.key;
                LekasBottomBarItem item = entry.value;
                return GestureDetector(
                  onTap: () => onTap(index),
                  child: AnimatedIconWithShadow(
                    icon: item.icon,
                    label: item.title,
                    isSelected: index == currentIndex,
                    selectedColor: item.selectedColor,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
