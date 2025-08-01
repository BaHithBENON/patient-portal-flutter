import 'package:flutter/material.dart';
import 'package:patient_portal_app/core/theme.dart';
import 'package:patient_portal_app/utils/app_constants_utils.dart';

class IconButtonWidget extends StatelessWidget {
  final Widget icon;
  final Function()? onIconPressed;
  final BorderRadius? borderRadius;
  final bool isCircular;

  const IconButtonWidget({
    super.key,
    required this.icon,
    this.onIconPressed,
    this.borderRadius,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {

    return IconButton(
      icon: icon,
      onPressed: onIconPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(context.adaptiveBackgroundColor),
        shape: WidgetStateProperty.all(
          isCircular
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(AppConstantsUtils.cardRadiusM),
                ),
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
      ),
    );
  }
}

