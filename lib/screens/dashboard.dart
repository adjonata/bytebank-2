import 'package:bytebank2/components/menu_item.dart';
import 'package:bytebank2/screens/contacts_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static const String _logoSrc = 'images/logo.png';

  final String _appBarTitle = 'Dashboard';

  final String _contactsTitle = 'Contacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(_logoSrc),
            MenuItem(
              title: _contactsTitle,
              to: ContactsLists(),
              icon: Icons.people_rounded
            ),
          ],
        ),
      ),
    );
  }
}
