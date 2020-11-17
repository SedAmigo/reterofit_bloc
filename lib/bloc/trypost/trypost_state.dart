part of 'trypost_bloc.dart';

abstract class TrypostState extends Equatable {
  const TrypostState();
  
  @override
  List<Object> get props => [];
}

class TryPostInitial extends TrypostState {}

class TryPostLoading extends TrypostState {}

class TryPostSuccess extends TrypostState {}

class TryPostFail extends TrypostState {
  final String error;

  TryPostFail(this.error);

  @override
  List<Object> get props => [error];
}
