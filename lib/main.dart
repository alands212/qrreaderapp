import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderapp/providers/scan_list_provider.dart';
import 'package:qrreaderapp/providers/ui_provider.dart';
import 'package:qrreaderapp/src/pages/home_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        providers: [
          ChangeNotifierProvider(create: (_) => new UiProvider()),
          ChangeNotifierProvider(create: (_) => new ScanListProvider())
        ],

        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr App',
        initialRoute: 'home',
        routes: {
          'home'  : (_) => HomePage(),
          'mapa'  : (_) => MapasPage()
        },
      ),
    );
  }
}