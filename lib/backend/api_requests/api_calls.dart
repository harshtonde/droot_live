import 'api_manager.dart';

Future<dynamic> weatherCall({
  String accessKey = 'efcd6f28c63935375939edcf137a6bf0',
  String query = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Weather',
    apiUrl: 'http://api.weatherstack.com/current',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'access_key': accessKey,
      'query': query,
    },
    returnResponse: true,
  );
}

Future<dynamic> unsplashCall({
  String clientId = 'edZeM-BdyV7qWZvt9FaPMrul0WtQcrmHQggvI5qGUEI',
  String query = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Unsplash',
    apiUrl: 'https://api.unsplash.com/search/photos',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'client_id': clientId,
      'query': query,
    },
    returnResponse: true,
  );
}

Future<dynamic> weatherAPICall({
  String key = '0050c8645ad042d3843184956211505',
  String q = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'WeatherAPI',
    apiUrl: 'https://api.weatherapi.com/v1/current.json',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'key': key,
      'q': q,
    },
    returnResponse: true,
  );
}
