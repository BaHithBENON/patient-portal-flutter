import 'package:flutter/material.dart';
import 'package:patient_portal_app/models/patient.dart';

import '../utils/app_constants_utils.dart' show AppConstantsUtils;

class PatientWelcomeWidget extends StatelessWidget {
  final ModelPatient? patient;
  const PatientWelcomeWidget({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Patient name
        Text(
          "Bienvenue,",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
            fontSize: AppConstantsUtils.fontSizeL,
          ),
        ),
        Text(
          "${patient?.firstName ?? ''} ${patient?.lastName ?? ''}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppConstantsUtils.fontSizeXXXL,
          ),
        ),
      ],
    );
  }
}
