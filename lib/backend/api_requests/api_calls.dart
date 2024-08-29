import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class WeatherCall {
  static Future<ApiCallResponse> call({
    String? accessKey = 'efcd6f28c63935375939edcf137a6bf0',
    String? query = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Weather',
      apiUrl: 'http://api.weatherstack.com/current',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_key': accessKey,
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnsplashCall {
  static Future<ApiCallResponse> call({
    String? clientId = 'edZeM-BdyV7qWZvt9FaPMrul0WtQcrmHQggvI5qGUEI',
    String? query = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Unsplash',
      apiUrl: 'https://api.unsplash.com/search/photos',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'client_id': clientId,
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WeatherAPICall {
  static Future<ApiCallResponse> call({
    String? key = '0050c8645ad042d3843184956211505',
    String? q = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'WeatherAPI',
      apiUrl: 'https://api.weatherapi.com/v1/current.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': key,
        'q': q,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
