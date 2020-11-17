import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:retofit_bloc/data/repository/contact_repository.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  final ContactRepository _repository;
  DeleteCubit(this._repository) : super(DeleteInitial());

  void deleteContact(String id) {
    emit(DleteLoading());
    _repository
        .deleteContact(id)
        .then((value) => emit(DeleteSuccess()))
        .catchError((e) => emit(DeleteError(e)));
  }
}
