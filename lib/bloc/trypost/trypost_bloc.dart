import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:retofit_bloc/data/models/contacts.dart';
import 'package:retofit_bloc/data/repository/contact_repository.dart';

part 'trypost_event.dart';
part 'trypost_state.dart';

class TrypostBloc extends Bloc<TrypostEvent, TrypostState> {
  final ContactRepository contactRepository;

  TrypostBloc(this.contactRepository) : super(TryPostInitial());

  @override
  Stream<TrypostState> mapEventToState(
    TrypostEvent event,
  ) async* {
    if (event is TryPostEventLoaded) {
      final tryPostEither = await contactRepository.postContacts(event.contact);
      tryPostEither.fold(
        (l) => TryPostFail('error'),
        (r) => TryPostSuccess(),
      );
    }
  }
}
