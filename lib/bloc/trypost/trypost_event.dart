part of 'trypost_bloc.dart';

abstract class TrypostEvent extends Equatable {
  const TrypostEvent();

  @override
  List<Object> get props => [];
}

class TryPostEventLoaded extends TrypostEvent {
  final Contacts contact;

  TryPostEventLoaded(this.contact);
  @override
  List<Object> get props => [];
}
