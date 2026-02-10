import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class LocationCard extends StatelessWidget {
  final String locationName;

  const LocationCard({super.key, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            // Mock Map View
            child: Center(
              child: Icon(
                Icons.map,
                size: 40,
                color: Colors.grey[400],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: AppPallete.red, size: 20),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  locationName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppPallete.textBlack,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Dalam Radius Kantor',
            style: TextStyle(
              color: AppPallete.green,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
