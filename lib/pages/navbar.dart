import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView(
          children: [
            // ListTile(
            //   leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
            //   title: Text(
            //     "Settings",
            //     style: TextStyle(
            //       color: Theme.of(context).colorScheme.primary,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/settings');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.info, color: Theme.of(context).colorScheme.primary),
              title: Text(
                "About",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
