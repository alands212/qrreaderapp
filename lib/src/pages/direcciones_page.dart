import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderapp/providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final scalListProvider = Provider.of<ScanListProvider>(context);
    final scans = scalListProvider.scans;
    
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _, i ) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.pink[200],
        ),
        onDismissed: (DismissDirection direction){
          Provider.of<ScanListProvider>(context, listen: false).borrarScan(scans[i].id);
        },
        child: ListTile(
          leading: Icon( Icons.blur_circular_outlined, color: Theme.of(context).primaryColor ),
          title: Text( scans[i].valor ),
          subtitle: Text( scans[i].id.toString() ),
          trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => {},
        ),
      ),
    );

  }
}