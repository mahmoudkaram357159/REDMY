import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/layout/shop_app/cubit/states.dart';
import 'package:mk/models/shop_app/categories_model.dart';
import 'package:mk/models/shop_app/change_favorites_model.dart';
import 'package:mk/models/shop_app/favorite.dart';
import 'package:mk/models/shop_app/home_model.dart';
import 'package:mk/models/shop_app/login_model.dart';
import 'package:mk/modules/shop_app/categories/categories_screen.dart';
import 'package:mk/modules/shop_app/favorites/favorites_screen.dart';
import 'package:mk/modules/shop_app/products/products_screen.dart';
import 'package:mk/modules/shop_app/settings/settings_screen.dart';
import 'package:mk/shared/components/constants.dart';
import 'package:mk/shared/network/end_points.dart';
import 'package:mk/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  ShopLoginModel? userModel;
  CategoryModel? category;
  ChangeFavoriteModel? changeFavoriteModel;
  MyFavorites? favoritesModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    )?.then((value) {
      homeModel = HomeModel.fromJson(value?.data);
      homeModel?.data?.products.forEach((element) {
        favorites.addAll({element.id!: element.inFavorites!});
      });
      print(favorites.toString());
      emit(ShopSuccessHomeDataState(homeModel!));
    }).catchError((error) {
      emit(ShopErrorHomeDataState(error.toString()));
      print(error.toString());
    });
  }

  void getCategoriesData() {
    DioHelper.getData(
      url: GET_CATEGORUES,
      token: token,
    )?.then((value) {
      category = CategoryModel.fromJson(value?.data);
      emit(ShopSuccessCategoryDataState());
    }).catchError((error) {
      emit(ShopErrorCategoryDataState());
      print(error.toString());
    });
  }

  void getFavData() {
    emit(ShopLoadingFavoritesDataState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    )?.then((value) {
      favoritesModel = MyFavorites.fromJson(value?.data);

      emit(ShopSuccessGetDataFavoritesDataState());
    }).catchError((error) {
      emit(ShopErrorGetDataFavoritesDataState());
      print(error.toString());
    });
  }

  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    )?.then((value) {
      userModel = ShopLoginModel.fromJson(value?.data);
      print(userModel!.data!.name);
      emit(ShopSuccessUserDataState());
    }).catchError((error) {
      emit(ShopErrorUserDataState());
      print(error.toString());
    });
  }

  void updateData({
    required String name,
    required String phone,
    required String email,
  }) {
    emit(ShopLoadingUpdateDataState());

    DioHelper.putData(
      url: UPDATE,
      token: token,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
      },
    )?.then((value) {
      userModel = ShopLoginModel.fromJson(value?.data);
      print(userModel!.data!.name);
      emit(ShopSuccessUpdateDataState(userModel!));
    }).catchError((error) {
      emit(ShopErrorUpdateDataState());
      print(error.toString());
    });
  }

  void changeFavorites(int id) {
    favorites[id] = !favorites[id]!;
    emit(ShopChangeFavoritesDataState());
    DioHelper.postData(url: FAVORITES, data: {'product_id': id}, token: token)
        ?.then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value?.data);
      print(value?.data);
      if (!changeFavoriteModel!.status!)
        favorites[id] = !favorites[id]!;
      else
        getFavData();
      emit(ShopChangeSuccessFavoritesDataState());
    }).catchError((error) {
      if (!changeFavoriteModel!.status!) favorites[id] = !favorites[id]!;
      emit(ShopErrorChangeFavoritesDataState());
      print(error.toString());
    });
  }
}
