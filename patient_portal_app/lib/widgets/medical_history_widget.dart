import 'package:flutter/widgets.dart';
import 'package:patient_portal_app/core/theme.dart';
import 'package:patient_portal_app/extensions/box_decoration_extension.dart';

import '../utils/app_constants_utils.dart' show AppConstantsUtils;

class MedicalHistoryWidget extends StatelessWidget {
  final List<String> antecedents;
  const MedicalHistoryWidget({super.key, required this.antecedents});

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
            "Antécédents médicaux",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppConstantsUtils.fontSizeL,
            ),
          ),
          //
          ...antecedents.map(
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
          //
        ],
      ),
    );
  }
}
