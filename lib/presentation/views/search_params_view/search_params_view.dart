import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';
import 'package:my_coding_setup/core/extensions/num_extension.dart';
import 'package:my_coding_setup/core/extensions/string_extension.dart';
import 'package:my_coding_setup/core/parsers__and_formatters/text_formatter.dart';
import 'package:my_coding_setup/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:my_coding_setup/presentation/core_widgets/text_field_widget/text_field.dart';
import 'package:my_coding_setup/presentation/views/search_params_view/search_params_viewmodel.dart';
import 'package:my_coding_setup/vendor/slider_shape_override.dart';
import 'package:stacked/stacked.dart';

part 'widgets/amount_slider.dart';
part 'widgets/amount_textfield.dart';
part 'widgets/confirm_button.dart';
part 'widgets/expiry_slider.dart';
part 'widgets/expiry_textfield.dart';
part 'widgets/last_searches_section.dart';

@immutable
final class SearchParamsView extends StatelessWidget {
  const SearchParamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchParamsViewModel>.reactive(
      viewModelBuilder: SearchParamsViewModel.new,
      builder: (context, viewModel, child) {
        return SafeArea(
          minimum: context.adaptiveScreenPaddingBottom,
          child: Padding(
            padding: context.screenPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedCrossFade(
                  firstChild: const SizedBox(),
                  secondChild: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: context.normalValue,
                      ),
                      Text(viewModel.modelError.toString()),
                      SizedBox(
                        height: context.normalValue,
                      ),
                    ],
                  ),
                  crossFadeState: viewModel.hasError ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                  alignment: Alignment.center,
                  excludeBottomFocus: false,
                  reverseDuration: const Duration(milliseconds: 200),
                  sizeCurve: Curves.bounceInOut,
                ),
                const _AmountTextFieldWidget(),
                const _AmountSliderWidget(),
                SizedBox(
                  height: context.lowValue,
                ),
                const _ExpiryTextFieldWidget(),
                const _ExpirySliderWidget(),
                SizedBox(
                  height: context.lowValue,
                ),
                const _ConfirmButtonWidget(),
                const _LastSearchesSection(),
                SizedBox(
                  height: context.mediaQuery.viewInsets.bottom,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
