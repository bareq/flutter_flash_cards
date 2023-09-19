import 'package:flashcardsflutter/features/main_menu/view_model/main_menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final mainMenuViewModel = context.watch<MainMenuViewModel>();
    return Drawer(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Menu item $index'),
            onTap: () {
              mainMenuViewModel.changeMenuItem(index);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
