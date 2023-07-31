import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class StatusPhAirWidget extends StatelessWidget {
  const StatusPhAirWidget({
    super.key,
    required this.isSensorPHAirKurang,
    required this.isSensorPHAirLebih,
  });

  final bool isSensorPHAirKurang, isSensorPHAirLebih;

  @override
  Widget build(BuildContext context) {
    final phAirKurang = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          LineIcons.tintSlash,
          color: Colors.redAccent,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "PH Air Kurang",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.redAccent,
              ),
        ),
      ],
    );

    final phAirLebih = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          LineIcons.water,
          color: Colors.blueAccent,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "PH Air Lebih",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.blueAccent,
              ),
        ),
      ],
    );

    return Column(
      children: [
        if (isSensorPHAirKurang) phAirKurang,
        if (isSensorPHAirLebih) phAirLebih,
      ],
    );
  }
}
