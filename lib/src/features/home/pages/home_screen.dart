import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/app_constants/app_strings.dart';
import '../../../core/common_widgets/common_appbar_text.dart';
import '../widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const CommonAppBarText(text: AppStrings.appName),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Theme.of(context).iconTheme.color,
                  size: 30,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            )),
        drawer: const HomeDrawer());
  }
}
