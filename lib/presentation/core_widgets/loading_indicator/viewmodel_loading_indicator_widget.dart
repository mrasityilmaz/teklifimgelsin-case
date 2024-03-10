import 'package:flutter/material.dart';
import 'package:teklifimgelsin_case/presentation/core_widgets/loading_indicator/base_loading_indicator_widget.dart';
import 'package:stacked/stacked.dart';

final class ViewModelLoadingIndicator<T extends BaseViewModel> extends ViewModelWidget<T> {
  const ViewModelLoadingIndicator({super.key, this.progressWidget, this.hasBackgroundColor = false});

  final Widget? progressWidget;
  final bool hasBackgroundColor;

  @override
  Widget build(BuildContext context, T viewModel) {
    if (viewModel.isBusy) {
      return BaseLoadingIndicator(
        progressWidget: progressWidget,
        hasBackgroundColor: hasBackgroundColor,
      );
    } else {
      return const SizedBox();
    }
  }
}
