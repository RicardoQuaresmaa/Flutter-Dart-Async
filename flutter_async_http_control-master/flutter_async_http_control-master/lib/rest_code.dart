import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'user_model.dart';
import 'package:rxdart/rxdart.dart';

class Repository {
  final userApiProvider = UserApiProvider();

  Future<UserModel> fetchAllUsersFromRepo(urlidx) => userApiProvider.fetchUserList(urlidx);
}

class UserBloc {
  final _repository = Repository();
  final _userFetcher = PublishSubject<UserModel>();

  Observable<UserModel> get allUsers => _userFetcher.stream;

  fetchAllUsers(int urlidx) async {
    UserModel userModel = await _repository.fetchAllUsersFromRepo(urlidx);
    _userFetcher.sink.add(userModel);
  }

  dispose() {
    _userFetcher.close();
  }
}

final bloc = UserBloc();


class UserApiProvider
{
  static const List<String> srcurls = [
  "https://jsonplaceholder.typicode.com/users",
  "https://jsonplaceholder.typicode.com/users"
  ];

  Client client = Client();

  Future<UserModel> fetchUserList(int srcidx) async
  {
    dynamic exception;

    try
    {
      final response = await client.get(srcurls[srcidx]);
      // "https://123jsonplaceholder.typicode.com/users");
      //  "https://http://172.25.110.123/"); //jsonplaceholder.typicode.com/users");

      if (response.statusCode == 200)
      {
        String tmpUsers = '{"user" :' + response.body + '}';
        return UserModel.fromJson(json.decode(tmpUsers));
      }
      else
      {
        print("Tossing the failure stanza");
        throw Exception('Failed to load users');
      }
    } // try
    on SocketException catch (e)
    {
      print("caught the socket exception");
      exception = e;
    }
    catch (e)
    {
      print("caught a larger exception $e");
      //return Future.error(e);
      exception = e;
//       throw e;
    }
    print("About to send back a future.error $exception");
    return Future.error(exception);
  } // future
}


