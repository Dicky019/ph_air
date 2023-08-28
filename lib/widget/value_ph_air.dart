import 'package:flutter/material.dart';

class ValuePhAirWidget extends StatelessWidget {
  const ValuePhAirWidget({
    super.key,
    required this.title,
    required this.sensor,
    required this.color,
  });

  final String title;
  final String sensor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: color),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                sensor,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
