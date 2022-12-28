import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pos_mobile_app/client/dio_client.dart';
import 'package:stacked/stacked_annotations.dart';

import '../app/app.locator.dart';
import '../models/place.model.dart';
import '../models/suggestion.model.dart';

class LocationService {
  Dio dioClient = locator<DioClient>().dio;

  static const String androidKey = 'AIzaSyD0sHioNXayF6qH9eDAwdzSb7PyA6yrk2Q';
  static const String iosKey = 'AIzaSyD0sHioNXayF6qH9eDAwdzSb7PyA6yrk2Q';
  final apiKey = Platform.isAndroid ? androidKey : iosKey;

  final String? sessionToken;
  LocationService(@factoryParam this.sessionToken);

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:ng&key=$apiKey&sessiontoken=$sessionToken';
    final response = await dioClient.get(request);

    if (response.statusCode == 200) {
      final result = response.data;
      if (result['status'] == 'OK') {
        // compose suggestions in a list
        return result['predictions']
            .map<Suggestion>(
              (p) => Suggestion(
                placeId: p['place_id'],
                description: p['description'],
              ),
            )
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw result['error_message'];
    } else {
      throw 'Failed to fetch suggestion';
    }
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=address_component&key=$apiKey&sessiontoken=$sessionToken';
    final response = await dioClient.get(request);

    if (response.statusCode == 200) {
      final result = response.data;
      if (result['status'] == 'OK') {
        final components =
            result['result']['address_components'] as List<dynamic>;
        // build result
        final place = Place();
        for (var c in components) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            place.streetNumber = c['long_name'];
          }
          if (type.contains('route')) {
            place.street = c['long_name'];
          }
          if (type.contains('locality')) {
            place.city = c['long_name'];
          }
          if (type.contains('postal_code')) {
            place.zipCode = c['long_name'];
          }
        }
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
