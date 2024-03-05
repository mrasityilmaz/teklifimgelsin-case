part of '../home_view.dart';

final class HomeSearchTitleWidget extends StatelessWidget {
  const HomeSearchTitleWidget({
    required this.mount,
    required this.amountByK,
    required this.loanType,
    required this.count,
    super.key,
  });
  final int mount;
  final double amountByK;
  final String loanType;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.screenPaddingHorizontal + context.paddingNormalVertical,
      child: Text(
        '''$mount Ay Vadeli ${amountByK.toStringAsFixed(3)} TL $loanType Kredisi için aylık taksite göre sıralanmış $count teklifin var.''',
        textAlign: TextAlign.center,
        maxLines: 3,
        style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 18, color: context.appColors.primaryBlueColor),
      ),
    );
  }
}
