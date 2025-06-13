import 'package:coffee_app_new/i18n/strings.g.dart';
import 'package:coffee_app_new/screens/splash_screen.dart';
import 'package:coffee_app_new/utils/AppTheme.dart';
import 'package:coffee_app_new/utils/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nb_utils/nb_utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale(); // Used in Localization

  // Initialize nb_utils
  await initialize();

  // Set Default Setting
  pageRouteAnimationGlobal = PageRouteAnimation.Fade;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(TranslationProvider(child: CoffeeShopApp()));
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
      navigatorKey: navigatorKey,
      scrollBehavior: SBehavior(),
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      localeResolutionCallback: (locale, supportedLocales) => locale,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: SafeArea(child: child!),
        );
      },
    );
  }
}
