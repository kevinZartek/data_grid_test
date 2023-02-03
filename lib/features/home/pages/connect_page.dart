import 'package:data_grid_test/core/widgets/text_field.dart';
import 'package:data_grid_test/features/home/pages/home_page.dart';
import 'package:data_grid_test/features/home/view_models/add_field_controller.dart';
import 'package:data_grid_test/features/home/view_models/connect_model.dart';
import 'package:data_grid_test/features/home/view_models/current_field_list_model.dart';
import 'package:data_grid_test/features/home/view_models/url_field_model.dart';
import 'package:data_grid_test/features/home/views/add_column.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectPage extends ConsumerStatefulWidget {
  const ConnectPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConnectPageState();
}

class _ConnectPageState extends ConsumerState<ConnectPage> {


  final _uriCtrl = TextEditingController();

  bool _busy = false;


  @override
  void initState() {
    super.initState();
    _uriCtrl.text = ref.read(urlFieldStateProvider);
  }

  @override
  void dispose() {
    _uriCtrl.dispose();
    super.dispose();
  }

  Future<void> _connect(BuildContext ctx) async {
    try {
      setState(() {
        _busy = true;
      });
      ref.read(urlFieldStateProvider.notifier).updateField(_uriCtrl.text);
      if (ref.read(connectPageViewProvider).formKey.currentState!.validate()) {
        ref.read(addColumnListController.notifier).submit();
        if (ref.read(currentFieldListStateProvider).isNotEmpty) {
          await Navigator.push<void>(
            ctx,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }
      }
    } catch (error) {
      print('Could not connect $error');
    } finally {
      setState(() {
        _busy = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 20,
              ),
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: AppTextField(
                      label: 'URL',
                      ctrl: _uriCtrl,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: AddColumnView()),
                  ElevatedButton(
                    onPressed: _busy ? null : () => _connect(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_busy)
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        const Text('CONNECT'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
