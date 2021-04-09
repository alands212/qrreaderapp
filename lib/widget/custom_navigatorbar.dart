import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderapp/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon( Icons.style_outlined),
          label: 'Todos',
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.supervised_user_circle),
          label: 'Dni'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.category_sharp),
          label: 'Otros'
        )
      ]
    );
  }
}