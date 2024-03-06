part of '../home_view.dart';

final class _HomeAppBarWidget extends StatelessWidget {
  const _HomeAppBarWidget();

  @override
  SliverAppBar build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: context.appColors.primaryWhiteBackgroundColor,
      floating: true,
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.appColors.primaryGreyBackgroundColor.withOpacity(.2),
        ),
      ),
      centerTitle: true,
      title: SizedBox(
        height: kToolbarHeight,
        child: FractionallySizedBox(
          heightFactor: .7,
          alignment: const Alignment(0, -.15),
          child: SvgPicture.asset(
            Assets.tg_logo_svg,
          ),
        ),
      ),
      actions: [
        MenuItemButton(
          style: MenuItemButton.styleFrom(),
          child: Icon(
            Icons.menu,
            color: context.appColors.primaryBlueColor,
            size: 26,
          ),
        ),
      ],
    );
  }
}
