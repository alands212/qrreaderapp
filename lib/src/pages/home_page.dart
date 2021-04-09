import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderapp/providers/scan_list_provider.dart';
import 'package:qrreaderapp/providers/ui_provider.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/dni_page%20.dart';
import 'package:qrreaderapp/src/pages/todos_page%20.dart';
import 'package:qrreaderapp/widget/custom_navigatorbar.dart';
import 'package:qrreaderapp/widget/scan_buttom.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon( Icons.delete_forever ),
            onPressed: (){
              Provider.of<ScanListProvider>(context, listen: false).borrarTodos();
            },
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScan();
        return TodosPage();
        break;

      case 1:
        scanListProvider.cargarScanPorTipo('dni');
        return DniPage();
        break;

      case 2:
        scanListProvider.cargarScanPorTipo('otros');
        return DireccionesPage();
        break;

      default:
        scanListProvider.cargarScan();
        return TodosPage();
    }
  }
}