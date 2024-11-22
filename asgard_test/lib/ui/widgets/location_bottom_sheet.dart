import 'package:asgard_test/models/location.dart';
import 'package:flutter/material.dart';

class LocationBottomSheet extends StatelessWidget {
  final Location location;

  const LocationBottomSheet({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),
          Text(location.description),
          if (location.imageUrl != null) ...[
            const SizedBox(height: 16),
            Image.network(
              location.imageUrl!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ],
      ),
    );
  }
}
