import 'api_manager.dart';

Future<dynamic> unsplashCall({
  String clientId = 'edZeM-BdyV7qWZvt9FaPMrul0WtQcrmHQggvI5qGUEI',
  String query = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Unsplash',
      apiDomain: 'api.unsplash.com',
      apiEndpoint: 'search/photos',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'client_id': clientId,
        'query': query,
      },
      returnResponse: true,
    );

Future<dynamic> weatherCall({
  String accessKey = 'efcd6f28c63935375939edcf137a6bf0',
  String query = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Weather',
      apiDomain: 'api.weatherstack.com',
      apiEndpoint: 'current',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_key': accessKey,
        'query': query,
      },
      returnResponse: true,
    );
