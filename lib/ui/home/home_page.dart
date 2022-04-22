import 'package:barcode_reader/domain/entities/entities.dart';
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
  void onReciveDataFromNextPage(data) {
    if (data is CodeEntity) {
      widget.presenter.addCode(data);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.presenter.loadCodes();
    widget.presenter.undoDelete.listen((code) {
      if (code != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Undo delete, ${code.title}'),
            backgroundColor: Theme.of(context).primaryColor,
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.white,
              onPressed: () => widget.presenter.reInsertCode(code),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTERED BARCODES'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: StreamBuilder<List<CodeEntity>>(
          stream: widget.presenter.barcodesStream,
          builder: (context, snapshot) {
            final codes = snapshot.data;
            if (codes?.isNotEmpty == true) {
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BarCodeWidget(
                      code: codes![index],
                      onTap: widget.presenter.launch,
                      onDismissed: widget.presenter.deleteCode,
                    ),
                  );
                },
                itemCount: codes?.length,
              );
            } else if (codes?.isEmpty == true && snapshot.hasData) {
              return const Center(child: Text('You dont have any barcode registered'));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
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
