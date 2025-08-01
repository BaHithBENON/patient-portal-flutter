import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:patient_portal_app/core/theme.dart';
import 'package:patient_portal_app/extensions/scaffold_extension.dart';
import '../enums/recommandation_category_enum.dart' show RecommandationCategory;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;
import '../widgets/app_bar_widget.dart' show AppBarWidget;
import '../widgets/health_tip_card.dart' show HealthTipCard;
import '../widgets/simple_message_widget.dart' show SimpleMessageWidget;
import 'adapters/recommandations/recommandation_controller.dart'
    show recommandationControllerProvider;

class RecommandationsScreen extends ConsumerWidget {
  const RecommandationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommandationState = ref.watch(recommandationControllerProvider);

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
                title: 'Recommandations',
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
                children: RecommandationCategory.values.map((category) {
                  final isSelected =
                      category == recommandationState.selectedCategory;
              
                  return ChoiceChip(
                    label: Text(category.value,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : null,
                    )),
                    backgroundColor: context.adaptiveBackgroundColor,
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(AppConstantsUtils.cardRadiusS),
                    ),
                    side: BorderSide.none,
                    selected: isSelected,
                    onSelected: (_) {
                      ref
                          .read(recommandationControllerProvider.notifier)
                          .filteredRecommandationsByCategory(category);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        if (recommandationState.isLoading) ...[
          const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
        ] else ...[
          if (recommandationState.errorMessage != null) ...[
            SliverFillRemaining(
              child: SimpleMessageWidget(message: 
                  kDebugMode
                      ? recommandationState.errorMessage ?? ''
                      : 'Une erreur est survenue. Veuillez réessayer.'
                ),
            
            ),
          ] else ...[
            if (recommandationState.recommandations.isEmpty) ...[
              const SliverFillRemaining(
                child: SimpleMessageWidget(message: 'Aucune recommandation trouvée'),
              ),
            ] else ...[
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final recommandation =
                      recommandationState.recommandations[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: AppConstantsUtils.scaffoldHPaddingM,
                      right: AppConstantsUtils.scaffoldHPaddingM,
                      bottom: AppConstantsUtils.scaffoldVPaddingXS,
                    ),
                    child: HealthTipCard(recommandation: recommandation),
                  );
                }, childCount: recommandationState.recommandations.length),
              ),
            ],
          ],
        ],
      ],
    ).emptyScaffold;
  }
}
