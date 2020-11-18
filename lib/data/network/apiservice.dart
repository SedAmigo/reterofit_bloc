import 'package:dio/dio.dart' hide Headers;
import 'package:retofit_bloc/data/models/contacts.dart';
import 'package:retofit_bloc/data/network/urls.dart';
import 'package:retrofit/http.dart';
part 'apiservice.g.dart';

@RestApi(baseUrl: baseurl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('')
   @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  Future<List<Contacts>> getContact();

  @POST('')
  Future<Contacts> postContacts(
    @Body() Contacts contact,
  );

  @PUT('/{id}')
  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  Future<Contacts> updateContact(
    @Path('id') String id,
    @Body() Contacts contact,
  );

  @DELETE('/{id}')
  Future<Contacts> deleteContact(
    @Path('id') String id,
  );
}
