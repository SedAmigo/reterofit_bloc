part of 'get_bloc.dart';

abstract class GetState extends Equatable {
  const GetState();

  @override
  List<Object> get props => [];
}

class GetInitial extends GetState {}

class GetLoaded extends GetState {
  final List<Contacts> contacts;

  GetLoaded({
    this.contacts,
  });

  @override
  List<Object> get props => [contacts];
}

class GetError extends GetState {
  final String error;

  GetError({this.error});

  @override
  List<Object> get props => [error];
}
