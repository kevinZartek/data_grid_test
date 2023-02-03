import 'package:data_grid_test/core/config/app_colors.dart';
import 'package:data_grid_test/core/config/app_text_styles.dart';
import 'package:data_grid_test/features/home/views/home_grid_view.dart';
import 'package:data_grid_test/features/home/views/home_list_view.dart';
import 'package:data_grid_test/features/home/views/settings_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Data View',
        style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold,color: AppColors.primary),
      )),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      if (MediaQuery.of(context).size.width < 800)
                        Stack(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const HomeListView()),
                            Positioned(bottom: 7.h, right: 2.h, child: const SettingsButton())

                          ],
                        )
                      else
                        const Expanded(
                          child: HomeGridView(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
