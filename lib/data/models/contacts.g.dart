// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contacts _$ContactsFromJson(Map<String, dynamic> json) {
  return Contacts(
    json['id'] as String,
    json['name'] as String,
    json['age'] as String,
    json['job'] as String,
  );
}

Map<String, dynamic> _$ContactsToJson(Contacts instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'job': instance.job,
    };
