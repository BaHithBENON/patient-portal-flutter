import 'package:flutter/widgets.dart';
import 'package:patient_portal_app/core/theme.dart';

import '../extensions/box_decoration_extension.dart' show BoxDecorationExtensions;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;

class AllergiesHistoryWidget extends StatelessWidget {
  final List<String> allergies;
  const AllergiesHistoryWidget({super.key, required this.allergies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstantsUtils.containerPaddingHM,
        vertical: AppConstantsUtils.containerPaddingVM,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppConstantsUtils.columnSpacingMedium,
        children: [
          Text(
            "Allergies",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppConstantsUtils.fontSizeL,
            ),
          ),
          ...allergies.map(
            (e) => Container(
              width: double.infinity,
              padding: const EdgeInsets.all(
                AppConstantsUtils.containerPaddingVM,
              ),
              decoration: BoxDecorationExtensions.circular(
                color: context.adaptiveBackgroundColor,
              ),
              child: Text(
                e,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}