import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retofit_bloc/bloc/delete/delete_cubit.dart';
import 'package:retofit_bloc/bloc/get/get_bloc.dart';
import 'package:retofit_bloc/data/models/contacts.dart';
import 'package:retofit_bloc/screens/edit_screen.dart';
import 'package:retofit_bloc/screens/post_Screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:retofit_bloc/screens/sqlite.dart';

class Contactss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostScreen(),
            ),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contacts'),
        actions: [
          IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SqulieLearn(),
            ),
          );
          }),
        ],
      ),
      body: BlocBuilder<GetBloc, GetState>(
        builder: (context, state) {
          if (state is GetLoaded) {
            List<Contacts> contacts = state.contacts;
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetBloc>(context).add(
                  GetLoadedEvent(),
                );
              },
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Card(
                      child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.indigoAccent,
                              child: Text(contacts[index].id),
                              foregroundColor: Colors.white,
                            ),
                            trailing: Text(contacts[index].age.toString()),
                            title: Text(contacts[index].name),
                            subtitle: Text(contacts[index].job),
                          ),
                        ),
                        actions: <Widget>[
                          IconSlideAction(
                            caption: 'Edit',
                            color: Colors.blue,
                            icon: Icons.edit,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditScreen(
                                    contacts: contacts[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                        secondaryActions: <Widget>[
                          BlocBuilder<DeleteCubit, DeleteState>(
                            builder: (context, state) {
                              return IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () {
                                  BlocProvider.of<DeleteCubit>(context)
                                      .deleteContact(
                                    contacts[index].id,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
