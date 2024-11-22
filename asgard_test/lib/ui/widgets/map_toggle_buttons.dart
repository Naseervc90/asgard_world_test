import 'package:flutter/material.dart';

import '../../models/location.dart';

class MapToggleButtons extends StatelessWidget {
  final LocationType? selectedType;
  final Function(LocationType) onTypeSelected;

  const MapToggleButtons({
    Key? key,
    required this.selectedType,
    required this.onTypeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildToggleButton(
              context,
              LocationType.cycle,
              Icons.directions_bike,
              'Cycle',
            ),
            _buildToggleButton(
              context,
              LocationType.shopping,
              Icons.shopping_cart,
              'Shopping',
            ),
            _buildToggleButton(
              context,
              LocationType.restaurant,
              Icons.restaurant,
              'Restaurant',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(
    BuildContext context,
    LocationType type,
    IconData icon,
    String label,
  ) {
    final isSelected = selectedType == type;

    return InkWell(
      onTap: () => onTypeSelected(type),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : null,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
