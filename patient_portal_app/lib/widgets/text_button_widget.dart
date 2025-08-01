import 'package:flutter/material.dart';

import '../extensions/box_decoration_extension.dart'
    show BoxDecorationExtensions;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;

class TextButtonWidget extends StatelessWidget {
  final Widget child;
  final bool withIconFilled;
  final Color? filledColor;
  final Function()? onIconPressed;
  const TextButtonWidget({super.key, required this.child, this.withIconFilled = false, this.onIconPressed, this.filledColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppConstantsUtils.buttonHSpacingXS),
      decoration: BoxDecorationExtensions.circular(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: TextButton(
        onPressed: onIconPressed,
        child: child,
      ),
    );
  }
}
