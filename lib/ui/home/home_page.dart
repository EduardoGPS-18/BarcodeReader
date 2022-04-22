import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:barcode_reader/ui/helpers/ui_navigation_manager.dart';
import 'package:barcode_reader/ui/home/home_presenter.dart';
import 'package:barcode_reader/ui/home/widgets/bar_code_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with UINavigationManager {
  @override
  Stream<NavigationArguments> get navigateToStream => widget.presenter.navigationStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTERED BARCODES'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: BarCodeWidget(),
            );
          },
          itemCount: 32,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
        child: FloatingActionButton(
          onPressed: widget.presenter.navigateToAddCodePage,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
