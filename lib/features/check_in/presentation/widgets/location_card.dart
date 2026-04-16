import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class LocationCard extends StatelessWidget {
  final String locationName;
  final double distance; // in meters
  final bool inRadius;

  const LocationCard({
    super.key,
    required this.locationName,
    this.distance = 0.0,
    this.inRadius = true,
  });

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
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: inRadius 
                    ? AppPallete.green.withOpacity(0.1)
                    : AppPallete.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      inRadius ? Icons.check_circle : Icons.cancel,
                      color: inRadius ? AppPallete.green : AppPallete.red,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      inRadius ? 'Dalam Radius' : 'Luar Radius',
                      style: TextStyle(
                        color: inRadius ? AppPallete.green : AppPallete.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (distance > 0) ...[
                const SizedBox(width: 8),
                Text(
                  '${distance.toStringAsFixed(1)}m',
                  style: const TextStyle(
                    color: AppPallete.textGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
