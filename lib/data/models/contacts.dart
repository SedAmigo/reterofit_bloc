import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contacts.g.dart';

@JsonSerializable()
class Contacts extends Equatable{
  final String id;
  final String name;
  final String age;
  final String job;

  Contacts(
    this.id,
    this.name,
    this.age,
    this.job,
  );

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsToJson(this);

  @override
  List<Object> get props => [id];

  @override

  bool get stringify => true;
}
