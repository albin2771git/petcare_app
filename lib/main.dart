import 'package:flutter/material.dart';
import 'package:petcare_app/src/features/theme/presentation/theme_provider.dart';
import 'package:provider/provider.dart';
import 'src/core/app_constants/theme.dart';
import 'src/features/splash/pages/spalsh_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(false, context),
              darkTheme: Styles.themeData(true, context),
              themeMode: value.darkTheme ? ThemeMode.dark : ThemeMode.light,

              home: const SplashScreen(),
            );
          },
        ));
  }
}
