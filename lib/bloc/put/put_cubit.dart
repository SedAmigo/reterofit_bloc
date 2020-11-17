// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:retofit_bloc/data/models/contacts.dart';
// import 'package:retofit_bloc/data/repository/contact_repository.dart';

// part 'put_state.dart';

// class PutCubit extends Cubit<PutState> {
//   final ContactRepository repository;
//   PutCubit(this.repository) : super(PutInitial());

//   void edit(String id, Contacts contact) {
//     repository
//         .updateContact(id, contact)
//         .then((value) => emit(PutSuccess()))
//         .catchError((e) => emit(PutFailed(e)));
//   }
// }
