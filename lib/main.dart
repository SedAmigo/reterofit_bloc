import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retofit_bloc/bloc/delete/delete_cubit.dart';
import 'package:retofit_bloc/bloc/edit/put_bloc.dart';
import 'package:retofit_bloc/bloc/get/get_bloc.dart';
import 'package:retofit_bloc/bloc/trypost/trypost_bloc.dart';
import 'package:retofit_bloc/di.dart';
import 'package:retofit_bloc/screens/contacts.dart';

void main() {
  locator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetBloc getBloc;
  TrypostBloc trypostBloc;
  PutBloc putBloc;
  DeleteCubit deleteCubit;

  @override
  void initState() {
    getBloc = inject<GetBloc>();
    getBloc.add(GetLoadedEvent());
    trypostBloc = inject<TrypostBloc>();
    putBloc = inject<PutBloc>();
    deleteCubit = inject<DeleteCubit>();
    super.initState();
  }

  @override
  void dispose() {
    getBloc?.close();
    trypostBloc?.close();
    deleteCubit?.close();
    putBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getBloc,
        ),
        BlocProvider(
          create: (context) => trypostBloc,
        ),
        BlocProvider(
          create: (context) => putBloc,
        ),
        BlocProvider(
          create: (context) => deleteCubit,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Contactss(),
      ),
    );
  }
}
