import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:patient_portal_app/core/theme.dart';

import '../enums/appointment_status_enum.dart' show AppointmentStatus;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;
import '../widgets/app_bar_widget.dart' show AppBarWidget;
import '../widgets/appointment_card.dart' show AppointmentCard;
import '../widgets/simple_message_widget.dart' show SimpleMessageWidget;
import 'adapters/appointment/appointment_controller.dart'
    show appointmentControllerProvider;
import 'adapters/home/home_controller.dart' show homeControllerProvider;

class AppointmentsScreen extends ConsumerStatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  ConsumerState<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends ConsumerState<AppointmentsScreen> {

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
        appointmentController.getAllAppointments(patientId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeControllerProvider);
    final appointmentState = ref.watch(appointmentControllerProvider);

    final patientId = homeState.currentPatient?.id;

    if (patientId == null) {
      return const SimpleMessageWidget(
        message: 'Aucun rendez-vous retrouvé pour le moment',
      );
    }

    if (appointmentState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (appointmentState.errorMessage != null) {
      return SimpleMessageWidget(
        message: kDebugMode
            ? appointmentState.errorMessage!
            : 'Une erreur est survenue',
      );
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floating: true,
          pinned: true,
          snap: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstantsUtils.scaffoldHPaddingM,
            ),
            child: SafeArea(
              bottom: false,
              child: AppBarWidget(
                title: 'Vos rendez-vous'
              ),
            ),
          ),
          toolbarHeight: kToolbarHeight,
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstantsUtils.scaffoldHPaddingM,
              vertical: AppConstantsUtils.scaffoldVPaddingXS,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8,
                children: AppointmentStatus.values.map((status) {
                  final isSelected = status == appointmentState.selectedStatus;

                  return ChoiceChip(
                    label: Text(
                      status.label,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : null,
                      ),
                    ),
                    backgroundColor: context.adaptiveBackgroundColor,
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                        AppConstantsUtils.cardRadiusS,
                      ),
                    ),
                    side: BorderSide.none,
                    selected: isSelected,
                    onSelected: (_) {
                      ref
                          .read(appointmentControllerProvider.notifier)
                          .filteredAppointmentsByStatus(status, patientId);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        if (appointmentState.allAppointments.isEmpty) ...[
          const SliverFillRemaining(
            child: SimpleMessageWidget(
              message: 'Aucun rendez-vous retrouvé pour le moment',
            ),
          ),
        ] else ...[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final rdv = appointmentState.allAppointments[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: AppConstantsUtils.scaffoldHPaddingM,
                  right: AppConstantsUtils.scaffoldHPaddingM,
                  bottom: AppConstantsUtils.scaffoldVPaddingXS,
                ),
                child: AppointmentCard(appointment: rdv),
              );
            }, childCount: appointmentState.allAppointments.length),
          ),
        ],
      ],
    );
  }
}
