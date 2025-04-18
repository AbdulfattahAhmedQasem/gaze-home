import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/datasources/remote/address_remote_data_source.dart';
import 'package:gazhome/data/models/address_model.dart';
import 'package:gazhome/data/models/prediction_model.dart';

class AddressRepo {
  AddressRepo(this._addressRemoteDataSource);

  final AddressRemoteDataSource _addressRemoteDataSource;

  ResultFuture<List<AddressModel>> getAddresses() async {
    return returnResponse<List<AddressModel>>(() async {
      return _addressRemoteDataSource.getAddresses();
    });
  }

  ResultFuture<(String, AddressModel)> addAddress(AddressModel request) async {
    return returnResponse<(String, AddressModel)>(() async {
      return _addressRemoteDataSource.addAddress(request);
    });
  }

  ResultFuture<String> deleteAddress(int id) async {
    return returnResponse<String>(() async {
      return _addressRemoteDataSource.deleteAddress(id);
    });
  }

  Future<List<PredictionModel>> searchForLocation(String query) async {
    return _addressRemoteDataSource.searchForLocation(query);
  }
}
