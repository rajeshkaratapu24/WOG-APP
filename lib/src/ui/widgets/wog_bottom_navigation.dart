import 'package:flutter/material.dart';
import '../../../app_theme.dart';

class WogBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const WogBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.bottomNavColor,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(icon: Icons.grid_view_outlined, isSelected: currentIndex == 0, onTap: () => onTap(0)),
            _NavItem(icon: Icons.menu_book_outlined, isSelected: currentIndex == 1, onTap: () => onTap(1)),
            _NavItem(icon: Icons.home_filled, isSelected: currentIndex == 2, onTap: () => onTap(2)),
            _NavItem(icon: Icons.radio_button_checked, isSelected: currentIndex == 3, onTap: () => onTap(3)),
            _NavItem(icon: Icons.manage_accounts_outlined, isSelected: currentIndex == 4, onTap: () => onTap(4)),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // UI icons look somewhat custom, using standard ones as closest match for now.
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isSelected ? 30 : 26,
            color: isSelected ? Colors.white : Colors.white38,
          ),
          if (isSelected) const SizedBox(height: 4),
          if (isSelected)
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
