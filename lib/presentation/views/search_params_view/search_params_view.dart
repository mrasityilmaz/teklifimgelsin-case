import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/errors/errors.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';
import 'package:my_coding_setup/core/extensions/num_extension.dart';
import 'package:my_coding_setup/core/extensions/string_extension.dart';
import 'package:my_coding_setup/core/parsers__and_formatters/text_formatter.dart';
import 'package:my_coding_setup/data/enums/credit_type_enum.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';
import 'package:my_coding_setup/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:my_coding_setup/presentation/core_widgets/text_field_widget/text_field.dart';
import 'package:my_coding_setup/presentation/views/search_params_view/search_params_viewmodel.dart';
import 'package:my_coding_setup/vendor/slider_shape_override.dart';
import 'package:stacked/stacked.dart';

part 'widgets/amount_slider.dart';
part 'widgets/amount_textfield.dart';
part 'widgets/confirm_button.dart';
part 'widgets/error_section.dart';
part 'widgets/expiry_slider.dart';
part 'widgets/expiry_textfield.dart';
part 'widgets/last_searches_section.dart';
part 'widgets/loan_type_dropdown.dart';

@immutable
final class SearchParamsView<T extends OffersResponseModel?> extends StatelessWidget {
  const SearchParamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchParamsViewModel>.nonReactive(
      viewModelBuilder: SearchParamsViewModel.new,
      builder: (context, viewModel, child) {
        return SafeArea(
          minimum: context.adaptiveScreenPaddingBottom,
          child: Padding(
            padding: context.screenPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _ErrorSection(),
                const _LoanTypeDropdownWidget(),
                SizedBox(
                  height: context.normalValue,
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
