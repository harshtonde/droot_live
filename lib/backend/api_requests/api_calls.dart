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
