import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerStatefulWidget, ConsumerState;

import '../screens/adapters/appointment/appointment_controller.dart' show appointmentControllerProvider;
import '../screens/adapters/home/home_controller.dart' show homeControllerProvider;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;
import 'appointment_card.dart' show AppointmentCard;

class LastAppoitementWidget extends ConsumerStatefulWidget {
  const LastAppoitementWidget({super.key});

  @override
  ConsumerState<LastAppoitementWidget> createState() => _LastAppoitementWidgetState();
}

class _LastAppoitementWidgetState extends ConsumerState<LastAppoitementWidget> {
  
    @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeState = ref.read(homeControllerProvider);
      final appointmentController = ref.read(
        appointmentControllerProvider.notifier,
      );

      final patientId = homeState.currentPatient?.id;

      if (patientId != null) {
        appointmentController.getLastAppoitment(patientId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final homeState = ref.watch(homeControllerProvider);
    final appointmentState = ref.watch(appointmentControllerProvider);

    final patientId = homeState.currentPatient?.id;

    if (patientId == null || appointmentState.lastAppointment == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppConstantsUtils.columnSpacingMedium,
      children: [
        Text(
          "Dernier rendez-vous",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppConstantsUtils.fontSizeL,
          ),
        ),
        AppointmentCard(appointment: appointmentState.lastAppointment!, withBanner: false),
      ],
    );
  }
}