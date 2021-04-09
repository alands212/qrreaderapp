import 'package:flutter/material.dart';
import 'package:qrreaderapp/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'dni';


  nuevoScan(String valor) async{
    
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    nuevoScan.id = id;

    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
  
  }

  cargarScan() async{
    final scans = await DBProvider.db.getScans();
    this.scans = [...scans];
    notifyListeners();
  }



  cargarScanPorTipo(String tipo) async{
    final scans = await DBProvider.db.getScansByTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async{
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  borrarScan(int id) async{
    await DBProvider.db.deleteScan(id);
    this.cargarScanPorTipo(this.tipoSeleccionado);
  }

}