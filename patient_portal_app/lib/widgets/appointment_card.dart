import 'package:flutter/material.dart';
import 'package:patient_portal_app/core/theme.dart';
import 'package:intl/intl.dart';

import '../extensions/box_decoration_extension.dart'
    show BoxDecorationExtensions;
import '../models/appointment.dart' show ModelAppointment;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;

class AppointmentCard extends StatelessWidget {
  final ModelAppointment appointment;
  final bool withBanner;
  const AppointmentCard({super.key, required this.appointment, this.withBanner = true});

  @override
  Widget build(BuildContext context) {
    final item = Container(
        decoration: BoxDecorationExtensions.circular(
          color: context.adaptiveBackgroundColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstantsUtils.containerPaddingHM,
          vertical: AppConstantsUtils.containerPaddingVM,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: AppConstantsUtils.rowSpacingMedium,
          children: [
            CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  radius: 30,
                  child: Text(
                    appointment.doctorName?.split(' ')[1].substring(0, 1).toUpperCase() ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                  ),
                ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LineInfoWidget(
                    title: appointment.doctorName ?? '',
                    icon: const Icon(Icons.person),
                  ),
                  LineInfoWidget(
                    title: appointment.specialty ?? '',
                    icon: const Icon(Icons.health_and_safety),
                  ),
                  LineInfoWidget(
                    title: appointment.location ?? '',
                    icon: const Icon(Icons.place_rounded),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                
                ...formatDateFr(
                      DateTime.tryParse(appointment.date?.toString() ?? '') ??
                          DateTime.now(),
                    )
                    .split(' ')
                    .map(
                      (e) => Text(
                        e,
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
              ],
            ),
          ],
        ),
      );
    
    if (!withBanner) {
      return item;
      
    }
    return Banner(
      message: appointment.status?.label ?? '',
      location: BannerLocation.topStart,
      color: appointment.status?.isPast ?? false ? Colors.red : Theme.of(context).colorScheme.primary,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      child: item,
    );
  }
}

String formatDateFr(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM y');
  return formatter.format(date);
}

class LineInfoWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  const LineInfoWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppConstantsUtils.rowSpacingMedium,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: AppConstantsUtils.fontSizeL,
            ),
          ),
        ),
      ],
    );
  }
}
