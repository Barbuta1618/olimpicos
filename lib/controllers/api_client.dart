import 'dart:html';

import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:routemaster/routemaster.dart';

import '../utils/http_client.dart';

enum ApiClientState { authenticated, unauthenticated }

enum ApiClientFetchState { loading, failed, loaded }

class ApiClient with ChangeNotifier {
  Uri uri;

  HttpClient httpClient = HttpClient();
  ApiClientState state = ApiClientState.unauthenticated;
  ApiClientFetchState fetchState = ApiClientFetchState.loading;
  int rootFolderId = 0;

  String authToken = "";
  String refreshToken = "";

  ApiClient(String url, String? authToken, String? refreshToken, this.state)
      : uri = Uri.parse(url) {
    if (state == ApiClientState.authenticated) {
      this.authToken = authToken ?? '';
      this.refreshToken = refreshToken ?? '';
    }
  }

  Future<bool> auth(String username, String password) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Map response = await httpClient.post(
        uri,
        {
          'method': "auth.login",
          'params': {
            'username': username,
            'password': password,
          }
        },
        headers);
    if (!response['error']) {
      authToken = response['data']['accessToken'];
      refreshToken = response['data']['refreshToken'];
      state = ApiClientState.authenticated;

      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: authToken);
      await storage.write(key: 'refreshToken', value: refreshToken);
    }

    return response['error'];
  }

  Future<void> checkTokens() async {
    var response = await httpClient.post(uri, {
      'method': 'auth.token',
      'params': {'token': refreshToken}
    }, {
      "Content-type": "application/json",
    });

    if (response['data']['accessToken'] != null) {
      authToken = response['data']['accessToken'];

      const storage = FlutterSecureStorage();
      storage.write(key: 'token', value: authToken);
    } else {
      state = ApiClientState.unauthenticated;
    }
  }
}
