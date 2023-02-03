import 'package:data_grid_test/core/config/app_text_styles.dart';
import 'package:data_grid_test/core/widgets/text_field.dart';
import 'package:data_grid_test/features/home/view_models/current_field_list_model.dart';
import 'package:data_grid_test/features/home/view_models/grid_model.dart';
import 'package:data_grid_test/features/home/views/grid_view.dart';
import 'package:data_grid_test/features/home/views/list_view.dart';
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
        style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const HomeListView())
                      else
                        const Expanded(
                          child: HomeGridView(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(bottom: 7.h, right: 2.h, child: const SettingsButton())
          ],
        ),
      ),
    );
  }
}
