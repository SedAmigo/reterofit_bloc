import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:retofit_bloc/bloc/trypost/trypost_bloc.dart';
import 'package:retofit_bloc/data/models/contacts.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Post'),
      ),
      body: BlocBuilder<TrypostBloc, TrypostState>(
        builder: (context, state) {
          if (state is TryPostLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TryPostSuccess) {
            return ContactForm();
            // return Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text('Success'),
            //       FlatButton(
            //         onPressed: () {
            //           Navigator.pop(
            //             context,
            //             'success',
            //           );
            //         },
            //         child: Text('Go Home'),
            //       ),
            //     ],
            //   ),
            // );
          } else if (state is TryPostFail) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return ContactForm();
        },
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String _name, _age, _job;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
        children: [
          TextFormField(
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
          Builder(
            builder: (context) => FlatButton(
              child: Text('Add Contact'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Contacts contacts = Contacts('', _name, _age, _job);
                  BlocProvider.of<TrypostBloc>(context).add(TryPostEventLoaded(contacts));
                  Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.blue,
                    content: Text('Add Succed'),
                  ),
                );
                }else{
                  Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Add Failed'),
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
