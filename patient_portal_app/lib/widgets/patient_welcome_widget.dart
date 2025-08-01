import 'package:flutter/material.dart';

import '../models/patient.dart' show ModelPatient;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;

class PatientWelcomeWidget extends StatelessWidget {
  final ModelPatient? patient;
  const PatientWelcomeWidget({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
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
