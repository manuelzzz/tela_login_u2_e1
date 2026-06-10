import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/repositories/interface_cart_repository.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/add_product_to_cart.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/clear_cart.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/decrement_cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/get_cart_items.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/increment_cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/remove_cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/external/datasources/cart_local_datasource_impl.dart';
import 'package:tela_login_u2_e1/src/modules/cart/infra/datasources/interface_cart_datasource.dart';
import 'package:tela_login_u2_e1/src/modules/cart/infra/repositories/cart_repository_impl.dart';
import 'package:tela_login_u2_e1/src/modules/cart/presenter/cart_view.dart';
import 'package:tela_login_u2_e1/src/modules/cart/presenter/cart_view_model.dart';

class CartModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<IGetCartItems>(GetCartItemsImpl.new);
    i.addLazySingleton<IAddProductToCart>(AddProductToCartImpl.new);
    i.addLazySingleton<IIncrementCartItem>(IncrementCartItemImpl.new);
    i.addLazySingleton<IDecrementCartItem>(DecrementCartItemImpl.new);
    i.addLazySingleton<IRemoveCartItem>(RemoveCartItemImpl.new);
    i.addLazySingleton<IClearCart>(ClearCartImpl.new);
    i.addLazySingleton<ICartRepository>(CartRepositoryImpl.new);
    i.addLazySingleton<ICartDatasource>(CartLocalDatasourceImpl.new);
    i.addLazySingleton<CartViewModel>(CartViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const CartView());
  }
}
