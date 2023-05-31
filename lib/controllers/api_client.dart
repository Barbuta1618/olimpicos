import 'dart:html';

import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:olimpicos/models/models.dart';
import 'package:routemaster/routemaster.dart';

import '../utils/http_client.dart';

enum ApiClientState { authenticated, unauthenticated }

enum ApiClientFetchState { loading, failed, loaded }

class ApiClient with ChangeNotifier {
  Uri uri;
  String url = "";

  HttpClient httpClient = HttpClient();
  ApiClientState state = ApiClientState.unauthenticated;
  ApiClientFetchState fetchState = ApiClientFetchState.loading;

  bool isNew = true;
  String role = "trainer";

  String authToken = "";
  String refreshToken = "";

  ApiClient(this.url, String? authToken, String? refreshToken, this.state)
      : uri = Uri.parse(url) {
    if (state == ApiClientState.authenticated) {
      this.authToken = authToken ?? '';
    }
  }

  Future<bool> login(String email, String password) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Map response = await httpClient.post(
        Uri.parse("$url/auth/login"),
        {
          'email': email,
          'password': password,
        },
        headers);

    print("====================================");
    print(response);
    authToken = response['data']['token'];

    if (authToken != null && authToken != "") {
      state = ApiClientState.authenticated;
      await getUserDetails();

      // save to secure storage
      final storage = new FlutterSecureStorage();
      await storage.write(key: "authToken", value: authToken);
      return true;
      // notifyListeners();
    }
    return false;
  }

  Future<String> generateInvite() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $authToken"
    };

    Map response = await httpClient.get(
        Uri.parse("$url/auth/generate-trainer-token"), headers);

    print(response);
    return response['data']['token'];
  }

  Future<void> getUserDetails() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $authToken"
    };

    Map response = await httpClient.get(Uri.parse("$url/profile"), headers);

    print(response);
    var data = response['data'];
    if (data['role'] == "TRAINEE") {
      role = "trainee";
      String firstName = data['firstName'];
      String lastName = data['lastName'];
      String email = data['email'];
      String phone = data['phone'];
    }
    if (data['role'] == "TRAINER") {
      role = "trainer";
      String firstName = data['firstName'];
      String lastName = data['lastName'];
      String email = data['email'];
      String phone = data['phone'];
    }
    if (data['role'] == "MANAGER") {
      role = "manager";
      String firstName = data['firstName'];
      String lastName = data['lastName'];
      String email = data['email'];
      // String clubName = data['club']['name'];
      // String clubDescription = data['club']['description'];
    }

    print("plm, p eiaic");
  }

  Future<String> registerManager(
      String firstName,
      String lastName,
      String password,
      String email,
      String clubName,
      String description) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Map response = await httpClient.post(
        Uri.parse("$url/auth/register-club"),
        {
          'firstName': firstName,
          'lastName': lastName,
          'password': password,
          'email': email,
          'clubName': clubName,
          'clubDescription': description,
        },
        headers);
    print("===========================================");
    print(response);
    return response['data']['url'];
  }

  Future<bool> registerTrainer(String code, String password, String email,
      String firstName, String lastName, String phone) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Map response = await httpClient.post(
        Uri.parse("$url/auth/register-trainer"),
        {
          'firstName': firstName,
          'lastName': lastName,
          'password': password,
          'email': email,
          'phone': phone,
          'token': code
        },
        headers);
    print("===========================================");
    print(response);

    authToken = response['data']['token'];

    if (authToken != null && authToken != "") {
      //save to secure storage
      final storage = new FlutterSecureStorage();
      storage.write(key: "authToken", value: authToken);
      state = ApiClientState.authenticated;
      return true;
    }

    return false;
  }

  Future<bool> registerTrainee(String email, String password, String firstName,
      String lastName, String phone) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Map response = await httpClient.post(
        Uri.parse("$url/auth/register"),
        {
          'firstName': firstName,
          'lastName': lastName,
          'password': password,
          'email': email,
          'phone': phone,
        },
        headers);
    print("===========================================");
    print(response);

    authToken = response['data']['token'];

    if (authToken != null && authToken != "") {
      //save to secure storage
      final storage = new FlutterSecureStorage();
      storage.write(key: "authToken", value: authToken);
      state = ApiClientState.authenticated;
      return true;
    }

    return false;
  }
}
