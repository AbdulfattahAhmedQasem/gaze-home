import 'package:gazhome/core/networking/api_constants.dart';
import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/address_model.dart';
import 'package:gazhome/data/models/prediction_model.dart';

class AddressRemoteDataSource {
  const AddressRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<AddressModel>> getAddresses() async {
    return returnRemoteResponse<List<AddressModel>>(() async {
      final response = await _apiService.get(ApiConstants.addresses);
      return List<AddressModel>.from(
        (response['data'] as List).map<AddressModel>(
          (address) => AddressModel.fromMap(address as DataMap),
        ),
      );
    });
  }

  Future<(String, AddressModel)> addAddress(AddressModel request) async {
    return returnRemoteResponse<(String, AddressModel)>(() async {
      final response = await _apiService.post(
        ApiConstants.addAddress,
        body: request.toMap(),
      );
      return (
        response['message'] as String,
        AddressModel.fromMap(response['address'] as DataMap)
      );
    });
  }

  Future<String> deleteAddress(int id) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.get(
        '${ApiConstants.deleteAddress}/$id',
      );
      return response['message'] as String;
    });
  }

  Future<List<PredictionModel>> searchForLocation(String query) async {
    try {
      var predictions = <PredictionModel>[];
      if (query.isNotEmpty) {
        final response = await _apiService.get(
          ApiConstants.placeApiAutoComplete,
          baseUrl: ApiConstants.placesBaseUrl,
          queryParameters: {
            'input': query,
            'types': 'geocode',
            'key': EnvService.apiKey,
          },
        );
        if (response['status'] == 'OK') {
          predictions = List<PredictionModel>.from(
            (response['predictions'] as List<dynamic>).map(
              (prediction) => PredictionModel.fromMap(prediction as DataMap),
            ),
          );
        }
      }
      return predictions;
    } on Exception {
      return [];
    }
  }
}
