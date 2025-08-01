import 'package:flutter/material.dart';
import 'package:patient_portal_app/core/theme.dart';

import '../extensions/box_decoration_extension.dart'
    show BoxDecorationExtensions;
import '../models/recommandation.dart' show ModelRecommandation;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;

class HealthTipCard extends StatelessWidget {
  final ModelRecommandation recommandation;
  const HealthTipCard({super.key, required this.recommandation});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecorationExtensions.circular(color: context.adaptiveBackgroundColor),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        leading: Icon(Icons.info_outline_rounded),
        title: Text(recommandation.title ?? '', style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(recommandation.content ?? '', style: TextStyle(fontWeight: FontWeight.w600),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstantsUtils.cardRadiusXS),
        ),
      ),
    );
  }
}
