part of '../app_theme.dart';

sealed class _AppTheme {
  TextTheme get textTheme;
  ColorScheme get colorScheme;
}

final class _AppDarkTheme implements _AppTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.dark(
        background: AppColorScheme.instance.primaryWhiteBackgroundColor,
        onBackground: AppColorScheme.instance.primaryBlackTextColor,
        onPrimary: AppColorScheme.instance.primaryWhiteBackgroundColor,
        primary: AppColorScheme.instance.primaryBlueColor,
      );

  @override
  TextTheme get textTheme => const TextTheme().apply(
        fontFamily: 'Alibaba',
        displayColor: colorScheme.onBackground,
        bodyColor: colorScheme.onBackground,
        decorationColor: colorScheme.onBackground,
      );

  ThemeData get themeData => ThemeData(
        colorScheme: colorScheme,
        textTheme: textTheme,
        fontFamily: 'Alibaba',
        scaffoldBackgroundColor: colorScheme.background,
        primaryColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onBackground),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: textTheme.labelSmall,
          fillColor: colorScheme.background,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorScheme.background.withOpacity(.9),
          selectedItemColor: colorScheme.primary,
        ),
        tabBarTheme: TabBarTheme(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicatorColor: colorScheme.primary,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: colorScheme.surface,
        ),
        chipTheme: ChipThemeData(
          brightness: Brightness.dark,
          selectedColor: colorScheme.primary,
          backgroundColor: colorScheme.background,
          side: BorderSide(color: colorScheme.primary, width: .7),
          labelStyle: TextStyle(
            fontFamily: 'Alibaba',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colorScheme.primary,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        popupMenuTheme: PopupMenuThemeData(color: colorScheme.background.withOpacity(.1), surfaceTintColor: Colors.amber),
        drawerTheme: DrawerThemeData(
          elevation: 0,
          shadowColor: colorScheme.onBackground.withOpacity(.5),
          backgroundColor: colorScheme.background,
          surfaceTintColor: colorScheme.onBackground,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.background,
          iconTheme: IconThemeData(color: colorScheme.onBackground),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        dividerTheme: DividerThemeData(
          color: colorScheme.onBackground.withOpacity(.2),
          thickness: .3,
        ),
        dividerColor: colorScheme.onBackground.withOpacity(.2),
      );
}

final class _AppLightTheme implements _AppTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.light(
        background: AppColorScheme.instance.primaryWhiteBackgroundColor,
        onBackground: AppColorScheme.instance.primaryBlackTextColor,
        onPrimary: AppColorScheme.instance.primaryWhiteBackgroundColor,
        primary: AppColorScheme.instance.primaryBlueColor,
      );

  @override
  TextTheme get textTheme => const TextTheme().apply(
        fontFamily: 'Alibaba',
      );

  ThemeData get themeData => ThemeData(
        useMaterial3: false,
        colorScheme: colorScheme,
        textTheme: textTheme,
        fontFamily: 'Alibaba',
        scaffoldBackgroundColor: colorScheme.background,
        primaryColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onBackground),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: textTheme.labelSmall,
          fillColor: colorScheme.background,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorScheme.background.withOpacity(.9),
          selectedItemColor: colorScheme.primary,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: colorScheme.background,
        ),
        tabBarTheme: TabBarTheme(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicatorColor: colorScheme.primary,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        chipTheme: ChipThemeData(
          brightness: Brightness.light,
          selectedColor: colorScheme.primary,
          backgroundColor: colorScheme.background,
          side: BorderSide(color: colorScheme.primary, width: .7),
          labelStyle: TextStyle(
            fontFamily: 'Alibaba',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colorScheme.primary,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: colorScheme.onBackground.withOpacity(.2),
          thickness: .3,
        ),
        dividerColor: colorScheme.onBackground.withOpacity(.2),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        popupMenuTheme: PopupMenuThemeData(color: colorScheme.background.withOpacity(.1), surfaceTintColor: Colors.amber),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: colorScheme.primary, refreshBackgroundColor: colorScheme.background),
        drawerTheme: DrawerThemeData(
          elevation: 0,
          shadowColor: colorScheme.onBackground.withOpacity(.5),
          backgroundColor: colorScheme.background,
          surfaceTintColor: colorScheme.onBackground,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.background,
          iconTheme: IconThemeData(color: colorScheme.onBackground),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      );
}
