import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:patient_portal_app/utils/app_constants_utils.dart';

import 'icon_button_widget.dart' show IconButtonWidget;

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool withBackButton;
  final List<Widget> actions;
  const AppBarWidget({
    super.key,
    required this.title,
    this.withBackButton = false,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppConstantsUtils.rowSpacingMedium,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(withBackButton) ...[
          IconButtonWidget(
            onIconPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.chevron_left),
          ),

        ],
        Expanded(
          child: Text(
            title,
            textAlign: withBackButton ? TextAlign.center : TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        ...actions,
      ],
    );
  }
}
