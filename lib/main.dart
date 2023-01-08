import 'package:easy_localization/easy_localization.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wothoq/core/routes/route_generator.dart';
import 'package:wothoq/core/theme/app_colors.dart';

import 'core/theme/theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColorDark,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [Locale('en',), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('ar'),
        saveLocale: true,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        color: Theme.of(context).scaffoldBackgroundColor,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Wothoq',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        builder: (context, child) {
          return child ?? SizedBox();
        });
  }
}
