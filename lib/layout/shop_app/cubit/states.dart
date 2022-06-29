import 'package:mk/models/shop_app/home_model.dart';
import 'package:mk/models/shop_app/login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {
  final HomeModel homeModel;

  ShopSuccessHomeDataState(this.homeModel);
}

class ShopErrorHomeDataState extends ShopStates {
  final String error;
  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoryDataState extends ShopStates {}

class ShopErrorCategoryDataState extends ShopStates {}

class ShopChangeSuccessFavoritesDataState extends ShopStates {}

class ShopChangeFavoritesDataState extends ShopStates {}

class ShopLoadingFavoritesDataState extends ShopStates {}

class ShopErrorChangeFavoritesDataState extends ShopStates {}

class ShopSuccessGetDataFavoritesDataState extends ShopStates {}

class ShopLoadingUserDataState extends ShopStates {}

class ShopErrorUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {}

class ShopLoadingUpdateDataState extends ShopStates {}

class ShopErrorUpdateDataState extends ShopStates {}

class ShopSuccessUpdateDataState extends ShopStates {
  final ShopLoginModel shopLoginModelModel;

  ShopSuccessUpdateDataState(this.shopLoginModelModel);
}

class ShopErrorGetDataFavoritesDataState extends ShopStates {}
