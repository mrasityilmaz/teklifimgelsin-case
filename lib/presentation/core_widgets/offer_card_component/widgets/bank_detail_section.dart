part of '../offer_card_component.dart';

@immutable
final class _BankDetailSection extends StatelessWidget {
  const _BankDetailSection({required this.bankId});

  final int? bankId;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: kMinInteractiveDimension,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: [
              SvgPicture.asset(
                'assets/bank_logos/b$bankId.svg',
                placeholderBuilder: SvgPicture.defaultPlaceholderBuilder,
                height: constraints.maxHeight * .8,
              ),
              const Spacer(),
              Container(
                height: constraints.maxHeight * .65,
                padding: context.paddingLowHorizontal * .5,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6), side: BorderSide(color: context.appColors.primaryBlueAccentColor, width: 1.5)),
                ),
                child: Center(child: Text('Reklam', style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700, color: context.appColors.primaryBlueAccentColor))),
              ),
              SizedBox(
                width: context.lowValue * .5,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {},
                child: Container(
                  height: constraints.maxHeight * .65,
                  padding: context.paddingLowHorizontal * .5,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6), side: BorderSide(color: context.appColors.primaryGreyBorderColor, width: 1.5)),
                  ),
                  child: Center(child: Icon(Icons.share_outlined, color: context.appColors.primaryGreyBorderColor)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
