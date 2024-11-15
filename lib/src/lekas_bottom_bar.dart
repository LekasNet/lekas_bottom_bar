import 'package:flutter/material.dart';
import 'lekas_bottom_bar_item.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
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
          bool isSelected = index == currentIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  color: isSelected ? item.selectedColor : Colors.grey,
                ),
                SizedBox(height: 4),
                Text(
                  item.title,
                  style: TextStyle(
                    color: isSelected ? item.selectedColor : Colors.grey,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
