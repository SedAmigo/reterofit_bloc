part of 'put_bloc.dart';

abstract class PutEvent extends Equatable {
  const PutEvent();

  @override
  List<Object> get props => [];
}

class PutEventLoaded extends PutEvent {
  final String id;
  final Contacts contact;

  PutEventLoaded(this.id, this.contact);
  @override
  List<Object> get props => [id, contact];
}
