import 'package:flutter/widgets.dart';
import 'package:patient_portal_app/core/theme.dart';
import '../extensions/box_decoration_extension.dart'
    show BoxDecorationExtensions;
import '../models/treatment.dart' show ModelTreatment;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;

class TreatmentsHistoryWidget extends StatelessWidget {
  final List<ModelTreatment> treatments;
  const TreatmentsHistoryWidget({super.key, required this.treatments});

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
            "Traitements",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppConstantsUtils.fontSizeL,
            ),
          ),
          //
          ...treatments.map(
            (e) => Container(
              width: double.infinity,
              padding: const EdgeInsets.all(
                AppConstantsUtils.containerPaddingVM,
              ),
              decoration: BoxDecorationExtensions.circular(
                color: context.adaptiveBackgroundColor,
              ),
              child: TreatmentItem(treatment: e),
            ),
          ),
        ],
      ),
    );
  }
}

class TreatmentItem extends StatelessWidget {
  final ModelTreatment treatment;
  const TreatmentItem({super.key, required this.treatment});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppConstantsUtils.rowSpacingMedium,
      children: [
        Expanded(
          child: Text(
            treatment.name ?? '-',
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: AppConstantsUtils.fontSizeM),
          ),
        ),
        Expanded(
          child: Text(
            treatment.dosage ?? '-',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: AppConstantsUtils.fontSizeL),
          ),
        ),
        Expanded(
          child: Text(
            treatment.frequency ?? '-',
            textAlign: TextAlign.end,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
