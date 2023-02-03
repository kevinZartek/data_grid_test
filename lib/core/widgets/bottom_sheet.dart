import 'package:data_grid_test/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum DialogAction { yes, abort }

class AppBottomSheet {
  static Future<DialogAction> barBottomSheet({
    required BuildContext context,
    required Widget body,
  }) async {
    final action = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BarBottomSheet(
          builderBody: body,
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}

class BarBottomSheet extends StatefulWidget {
  const BarBottomSheet({
    super.key,
    this.title,
    required this.builderBody,
    this.cancelButton,
  });

  final String? title;
  final Widget builderBody;
  final Widget? cancelButton;

  @override
  State<StatefulWidget> createState() => _CustomAppDialogState();
}

class _CustomAppDialogState extends State<BarBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
          bottom: false,
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.8),
              child: ListView(shrinkWrap: true, children: [
                const SizedBox(height: 8),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  elevation: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Column(
                          children: [
                            SafeArea(
                              bottom: false,
                              child: Container(
                                height: 6,
                                width: 60,
                                decoration:  BoxDecoration(
                                    color: AppColors.white.withOpacity(0.7)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            widget.builderBody,
                          ],
                        )),
                  ),
                ),
              ]))),
    );
  }
}
