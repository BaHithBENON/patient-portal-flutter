import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../screens/adapters/recommandations/recommandation_controller.dart'
    show recommandationControllerProvider;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;
import 'health_tip_card.dart' show HealthTipCard;

class RandomRecommandationWidget extends ConsumerWidget {
  const RandomRecommandationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommandationState = ref.watch(recommandationControllerProvider);

    if (recommandationState.recommandations.isEmpty) {
      return const SizedBox.shrink();
    }

    final randomRecommandation =
        recommandationState.recommandations[Random().nextInt(
          recommandationState.recommandations.length,
        )];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppConstantsUtils.columnSpacingMedium,
      children: [
        Text(
          "Recommendation de la journée",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            // color: Colors.deepOrangeAccent,
            fontSize: AppConstantsUtils.fontSizeL,
          ),
        ),
        HealthTipCard(recommandation: randomRecommandation),
      ],
    );
  }
}
