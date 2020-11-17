import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:retofit_bloc/data/models/contacts.dart';
import 'package:retofit_bloc/data/repository/contact_repository.dart';

part 'get_event.dart';
part 'get_state.dart';

class GetBloc extends Bloc<GetEvent, GetState> {
  final ContactRepository _repository;

  GetBloc(
    this._repository,
  ) : super(GetInitial());

  @override
  Stream<GetState> mapEventToState(
    GetEvent event,
  ) async* {
    if (event is GetLoadedEvent) {
      final getContactEither = await _repository.getContacts();
      yield getContactEither.fold((l) => GetError(), (contacts) {
        return GetLoaded(
          contacts: contacts,
        );
      });
    }
  }
}
