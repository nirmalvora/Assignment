import 'package:get_it/get_it.dart';
import 'package:sequoiacapdemo/core/helper/navigation_service.dart';
import 'package:sequoiacapdemo/core/viewmodels/add_product_view_model.dart';
import 'package:sequoiacapdemo/core/viewmodels/network_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Repository

  // ViewModels
  locator.registerLazySingleton(() => NetworkViewModel());
  locator.registerLazySingleton(() => AddProductViewModel());

  // Services
  locator.registerLazySingleton(() => NavigationService());
}
