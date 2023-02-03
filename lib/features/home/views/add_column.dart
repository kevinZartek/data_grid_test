import 'package:data_grid_test/core/config/app_colors.dart';
import 'package:data_grid_test/core/config/app_text_styles.dart';
import 'package:data_grid_test/core/widgets/text_field.dart';
import 'package:data_grid_test/features/home/view_models/add_field_controller.dart';
import 'package:data_grid_test/features/home/view_models/connect_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddColumnView extends ConsumerWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddColumnView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(addColumnListController);
    return Column(
      children: [
        Form(
            key: ref.watch(connectPageViewProvider).formKey,
            child: ListView.builder(
              itemCount: listState.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final labelController = listState[index].labelController;
                final keyController = listState[index].keyController;
                final typeController = listState[index].typeController;
                // print("$index: ${labelController.text}");
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppTextField(
                        ctrl: labelController,
                        textCapitalization: TextCapitalization.words,
                        validator: ref
                            .read(addColumnListController.notifier)
                            .validateString,
                        label: "Label - ${index + 1}",
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                        flex: 1,
                        child: AppTextField(
                          ctrl: keyController,
                          validator: ref
                              .read(addColumnListController.notifier)
                              .validateString,
                          label: "Key - ${index + 1}",
                        )),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                        flex: 1,
                        child: AppTextField(
                          ctrl: typeController,
                          validator: ref
                              .read(addColumnListController.notifier)
                              .validateString,
                          label: "Type - ${index + 1}",
                        )),
                    const SizedBox(
                      width: 6,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {
                          ref
                              .read(addColumnListController.notifier)
                              .remove(index);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
        Row(
          children: [
            const Spacer(),
            TextButton(
                child: Text(
                  'Add column',
                  style: AppTextStyles.body
                      .copyWith(color: AppColors.darkAccentColor),
                ),
                onPressed: () =>
                    ref.read(addColumnListController.notifier).add()),
          ],
        ),
      ],
    );
  }
}
