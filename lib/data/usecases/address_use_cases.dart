import 'package:gazhome/core/usecases/usecases.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/address_model.dart';
import 'package:gazhome/data/models/prediction_model.dart';
import 'package:gazhome/data/repos/address_repo.dart';

class GetAddressesUseCase
    extends ResultFutureUseCaseWithoutParams<List<AddressModel>> {
  GetAddressesUseCase(this._addressRepo);

  final AddressRepo _addressRepo;

  @override
  ResultFuture<List<AddressModel>> call() {
    return _addressRepo.getAddresses();
  }
}

class AddAddressUseCase extends ResultFutureUseCaseWithParams<
    (String, AddressModel), AddressModel> {
  AddAddressUseCase(this._addressRepo);

  final AddressRepo _addressRepo;

  @override
  ResultFuture<(String, AddressModel)> call(AddressModel request) {
    return _addressRepo.addAddress(request);
  }
}

class DeleteAddressUseCase extends ResultFutureUseCaseWithParams<String, int> {
  DeleteAddressUseCase(this._addressRepo);

  final AddressRepo _addressRepo;

  @override
  ResultFuture<String> call(int id) {
    return _addressRepo.deleteAddress(id);
  }
}

class SearchForLocationUseCase
    extends FutureUseCaseWithParams<List<PredictionModel>, String> {
  SearchForLocationUseCase(this._addressRepo);

  final AddressRepo _addressRepo;

  @override
  Future<List<PredictionModel>> call(String query) {
    return _addressRepo.searchForLocation(query);
  }
}
