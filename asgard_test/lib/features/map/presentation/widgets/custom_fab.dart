import 'package:flutter/material.dart';

import '../../models/view_type.dart';

class CustomFAB extends StatelessWidget {
  final ViewType viewType;
  final VoidCallback onPressed;

  const CustomFAB({
    super.key,
    required this.viewType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: Icon(viewType.icon),
      label: Text(viewType.name),
      elevation: 2,
    );
  }
}
