import 'package:dartz/dartz.dart';
import 'package:retofit_bloc/data/models/contacts.dart';
import 'package:retofit_bloc/data/network/apiservice.dart';
import 'package:retofit_bloc/data/repository/app_error.dart';

class ContactRepository {
  final ApiService _apiService;

  ContactRepository(this._apiService);

  Future<Either<AppError, List<Contacts>>> getContacts() async {
    try {
      final getContacts = await _apiService.getContact();
      return Right(getContacts);
    } on Exception {
      return Left(AppError('error message'));
    }
  }

  Future<Either<AppError, Contacts>> postContacts(Contacts contacts) async {
    try {
      final postContact = await _apiService.postContacts(contacts);
      return Right(postContact);
    } on Exception {
      return Left(AppError('error message'));
    }
  }

  Future<Either<AppError, Contacts>> updateContact(
      String id, Contacts contact) async {
    try {
      final update = await _apiService.updateContact(id, contact);
      return Right(update);
    } on Exception {
      return Left(AppError('error message'));
    }
  }

  Future<Either<AppError, Contacts>> deleteContact(String id) async {
    try {
      final delete = await _apiService.deleteContact(id);
      return Right(delete);
    } on Exception {
      return Left(AppError('error message'));
    }
  }
}
