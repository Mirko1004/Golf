import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/pullrefresh/src/indicator/classic_indicator.dart';
import 'package:flutter_section_table_view/pullrefresh/src/smart_refresher.dart';
import 'package:golf/localization/localization.dart';

Indicator getRefreshHeaderWidget(BuildContext context, int mode){
  return ClassicIndicator(
    mode: mode,
    releaseText: Localization.of(context).releaseToRefresh,
    refreshingText: Localization.of(context).loading,
    completeText: Localization.of(context).doneLoading,
    failedText: Localization.of(context).failedLoading,
    idleText: Localization.of(context).pullToRefresh,
    noDataText: '',
  );
}

Indicator getRefreshFooterWidget(BuildContext context, int mode){
  return ClassicIndicator(
    mode: mode,
    releaseText: "Release to load more",
    refreshingText: Localization.of(context).loading,
    completeText: Localization.of(context).doneLoading,
    failedText: Localization.of(context).failedLoading,
    idleText: "Pull to load more",
    noDataText: '',
  );
}