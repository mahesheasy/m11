import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/ui/mixin/accessible_features_mixin.dart';
import 'package:m11_ind/core/core.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:m11_ind/features/auth/model/logged_in_user.dart';

class AccessibleFeatures extends StatelessWidget with AccessFeaturesMixin {
  const AccessibleFeatures({super.key, this.isAccessible = true});

  final bool isAccessible;

  @override
  Widget build(BuildContext context) {
    const cellPostions = [Pair(1.7, 2), Pair(2.5, 2), Pair(2.5, 2), Pair(1.7, 2)];

    Pair<double,int> getCellCount(int index) {
      final indexValue = index % cellPostions.length;
      return cellPostions[indexValue];
    }

    final features = [
      if(context.user.isCollExecutive)...[
        getPickupWidget(context),
        getFBOsWidget(context),
        getDepotWidget(context),
        getCanRequestWidget(context),
      ],
      
      if(context.user.isFBO)...[
        if(!isAccessible)...[
          enrollBusiness(context),
        ] else...[
          requestExtraCans(context),
          requestUCOPickup(context),
          fboSummary(context),
        ],
      ],

      if(context.user.isDEO)...[
        assignCE(context),
        gateEntry(context),
        gateExit(context),
        ucoDeposit(context),
        canRequests(context),
        monthlyReport(context),
        assignBDE(context),
      ],
      
      if(context.user.isBDE)...[
        getBDEEnrollFBOWidget(context),
        getRoutesWidget(context),
        getFBOS(context),
        getBDESummaryWidget(context),
      ],
    ];

    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        for (int index = 0; index < features.length; index++) ...[
          StaggeredGridTile.count(
            mainAxisCellCount: getCellCount(index).first,
            crossAxisCellCount: getCellCount(index).second,
            child: features[index],
          ),
        ],
      ],
    );
  }
}
