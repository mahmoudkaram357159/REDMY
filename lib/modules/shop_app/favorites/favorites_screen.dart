import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/layout/shop_app/cubit/cubit.dart';
import 'package:mk/layout/shop_app/cubit/states.dart';
import 'package:mk/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        builder: (context, state) {
          return ConditionalBuilderRec(
            condition: state is! ShopLoadingFavoritesDataState,
            builder: (BuildContext context) => ListView.separated(
                itemBuilder: (context, index) => buildListProduct(
                    ShopCubit.get(context)
                        .favoritesModel!
                        .data!
                        .data[index]
                        .product!,
                    context),
                separatorBuilder: (context, index) => separatorBuilder(),
                itemCount:
                    ShopCubit.get(context).favoritesModel!.data!.data.length),
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),
          );
        },
        listener: (context, state) {});
  }
}
