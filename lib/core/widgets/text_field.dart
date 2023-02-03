import 'package:data_grid_test/core/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController? ctrl;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;

  const AppTextField({
    required this.label,
    this.ctrl,
    this.textCapitalization,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              // color: Colors.red,
              height: 80,
              child: TextFormField(
                controller: ctrl,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,

                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  // labelStyle: AppTextStyle.textFieldLabelStyle(),
                  alignLabelWithHint: true,
                  // errorText: widget.validationMessage,
                  errorStyle: AppTextStyles.bodyXs,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(.3), width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(.3), width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(.3),
                      width: 1.2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(.3), width: 1.2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                        color: Colors.red.withOpacity(.3), width: 1.2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                        color: Colors.red.withOpacity(.3), width: 1.2),
                  ),
                ),
                validator: validator,
                keyboardType: TextInputType.text,
              )),
          // Container(
          //   padding: const EdgeInsets.symmetric(
          //     vertical: 8,
          //     horizontal: 10,
          //   ),
          //   height: 42,
          //   decoration: BoxDecoration(
          //     border: Border.all(
          //       width: 1,
          //       color: Colors.white.withOpacity(.3),
          //     ),
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   child: Center(
          //     child: TextFormField(
          //       controller: ctrl,
          //       textCapitalization:
          //           textCapitalization ?? TextCapitalization.none,
          //       autovalidateMode: AutovalidateMode
          //           .onUserInteraction,
          //       decoration: const InputDecoration.collapsed(
          //         border: InputBorder.none,
          //         hintText: ''
          //         // focusedBorder: InputBorder.none,
          //         // enabledBorder: InputBorder.none,
          //         // errorBorder: InputBorder.none,
          //         // disabledBorder: InputBorder.none,
          //       ),
          //
          //       keyboardType: TextInputType.text,
          //       autocorrect: false,
          //       validator: validator,
          //     ),
          //   ),
          // ),
        ],
      );
}
