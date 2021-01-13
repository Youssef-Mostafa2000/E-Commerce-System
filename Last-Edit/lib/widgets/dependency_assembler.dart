import 'package:c_e_commerce/providers/cart_item.dart';
import 'package:get_it/get_it.dart';

GetIt dependencyAssembler = GetIt.instance;

void setupDependencyAssembler() {
  dependencyAssembler.registerFactory(() => CartItem());
}
