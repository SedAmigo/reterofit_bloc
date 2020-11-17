import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retofit_bloc/bloc/edit/put_bloc.dart';
import 'package:retofit_bloc/data/models/contacts.dart';

class EditScreen extends StatelessWidget {
  final Contacts contacts;

  const EditScreen({
    Key key,
    @required this.contacts,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit'),
      ),
      body: BlocBuilder<PutBloc, PutState>(
        builder: (context, state) {
          if (state is PutLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PutSuccess) {
            return ContactForm(this.contacts);
          } else if (state is PutFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return ContactForm(this.contacts);
        },
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  final Contacts _contacts;
  ContactForm(this._contacts);
  @override
  _ContactFormState createState() => _ContactFormState(this._contacts);
}

class _ContactFormState extends State<ContactForm> {
  final Contacts contact;
  final _formKey = GlobalKey<FormState>();
  String _name, _age, _job;

  _ContactFormState(this.contact);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
        children: [
          TextFormField(
            initialValue: contact.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
            validator: (value) {
              if (value.isEmpty || value.length <= 8) {
                return 'Please enter Name';
              }
              return null;
            },
            onSaved: (name) {
              this._name = name;
            },
          ),
          SizedBox(
            height: 12.0,
          ),
          TextFormField(
            initialValue: contact.age.toString(),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Age',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Age';
              }
              return null;
            },
            onSaved: (age) {
              this._age = age;
            },
          ),
          SizedBox(
            height: 12.0,
          ),
          TextFormField(
            initialValue: contact.job,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Job',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Job';
              }
              return null;
            },
            onSaved: (job) {
              this._job = job;
            },
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(contact.id),
          Builder(
            builder: (context) => FlatButton(
              child: Text('Edit Contact'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Contacts contacts = Contacts(contact.id, _name, _age, _job);
                  BlocProvider.of<PutBloc>(context)
                      .add(PutEventLoaded(contact.id, contacts));
                  // BlocProvider.of<PutCubit>(context).edit(contact.id, contacts);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.blue,
                      content: Text('Edit Succed'),
                    ),
                  );
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Edit Failed'),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
