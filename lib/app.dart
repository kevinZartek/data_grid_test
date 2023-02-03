import 'package:data_grid_test/core/config/app_themes.dart';
import 'package:data_grid_test/features/home/pages/connect_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
            title: 'Data Grid Test',
            theme: AppThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            home: const ConnectPage(),
          ));
}
