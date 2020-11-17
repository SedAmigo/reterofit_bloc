import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:retofit_bloc/data/models/contacts.dart';
import 'package:retofit_bloc/data/repository/contact_repository.dart';

part 'put_event.dart';
part 'put_state.dart';

class PutBloc extends Bloc<PutEvent, PutState> {
  final ContactRepository repository;
  PutBloc(this.repository) : super(PutInitial());

  @override
  Stream<PutState> mapEventToState(
    PutEvent event,
  ) async* {
    if (event is PutEventLoaded) {
      final putEither = await repository.updateContact(event.id, event.contact);
      putEither.fold((l) => PutFailed('Error'), (r) => PutSuccess());
    }
  }
}
