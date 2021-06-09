import 'package:bytebank2/components/editor.dart';
import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final ContactDao _dao = ContactDao();

  final String _appBarTitle = 'New contact';
  final String _fullNameLabel = 'Full name';
  final String _accountNumberLabel = 'Account number';
  final String _actionButtonLabel = 'Create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Editor(
              label: _fullNameLabel,
              controller: widget._nameController,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Editor(
                label: _accountNumberLabel,
                controller: widget._accountNumberController,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => _createContact(context),
                  child: Text(_actionButtonLabel),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _createContact(BuildContext context) {
    final String name = widget._nameController.text;
    final int accountNumber =
        int.tryParse(widget._accountNumberController.text);

    if (name != null && accountNumber != null) {
      final Contact newContact = new Contact(0, name, accountNumber);

      _dao.save(newContact).then((id) => Navigator.pop(context));
    }
  }
}
