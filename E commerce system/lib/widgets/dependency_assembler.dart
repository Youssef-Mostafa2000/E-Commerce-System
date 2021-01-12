import 'package:c_e_commerce/providers/cart_item.dart';
import 'package:c_e_commerce/services/store.dart';
import 'package:get_it/get_it.dart';

GetIt dependencyAssembler = GetIt.instance;

void setupDependencyAssembler() {
  //dependencyAssembler.registerLazySingleton(() => Store());
  //dependencyAssembler.registerFactory(() => ProductListModel());
  dependencyAssembler.registerFactory(() => CartItem());
}
