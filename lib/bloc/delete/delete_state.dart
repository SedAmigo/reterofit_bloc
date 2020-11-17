part of 'delete_cubit.dart';

abstract class DeleteState extends Equatable {
  const DeleteState();

  @override
  List<Object> get props => [];
}

class DeleteInitial extends DeleteState {}

class DleteLoading extends DeleteState {}

class DeleteSuccess extends DeleteState {}

class DeleteError extends DeleteState {
  final String error;

  DeleteError(this.error);

  @override
  List<Object> get props => [error];
}
