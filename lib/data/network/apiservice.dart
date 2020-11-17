import 'package:dio/dio.dart';
import 'package:retofit_bloc/data/models/contacts.dart';
import 'package:retofit_bloc/data/network/urls.dart';
import 'package:retrofit/http.dart';
part 'apiservice.g.dart';

@RestApi(baseUrl: baseurl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('')
  Future<List<Contacts>> getContact();

  @POST('')
  Future<Contacts> postContacts(
    @Body() Contacts contact,
  );

  @PUT('{id}')
  Future<Contacts> updateContact(
    @Path() String id,
    @Body() Contacts contact,
  );

  @DELETE('{id}')
  Future<Contacts> deleteContact(
    @Path() String id,
  );
}
