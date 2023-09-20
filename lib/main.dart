import 'package:flutter/material.dart';
import 'package:petcare_app/src/features/theme/presentation/theme_provider.dart';
import 'package:provider/provider.dart';
import 'src/core/app_constants/theme.dart';
import 'src/features/splash/pages/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();

  void getCurrentAppTheme() async {
    themeProvider.setDarkTheme = await themeProvider.themePref.getDarkTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => themeProvider),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeProvider.darkTheme, context),
              home: const SplashScreen(),
            );
          },
        ));
  }
}
