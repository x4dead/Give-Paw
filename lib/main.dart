import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:give_paw/themes/utils/extensions/no_thumb_scroll_behavior.dart';
import 'package:give_paw/themes/utils/router/router.dart';
// ignore: depend_on_referenced_packages
import 'package:media_kit/media_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = AppRouter.router;
    return MaterialApp.router(
      title: 'Дай лапу',
      debugShowCheckedModeBanner: false,
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Gilroy',
        // iconButtonTheme: IconButtonThemeData(
        //   style: IconButton.styleFrom(minimumSize: kS36, padding: kPAll6),
        // ),
        // textSelectionTheme: TextSelectionThemeData(
        //     cursorColor: AppColors.colorDarkGray,
        //     selectionColor: AppColors.colorBlue.withOpacity(0.5),
        //     selectionHandleColor: AppColors.colorBlue)
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      builder: (context, child) => child!,
    );
  }
}
