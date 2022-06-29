import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/layout/shop_app/cubit/cubit.dart';
import 'package:mk/layout/shop_app/cubit/states.dart';
import 'package:mk/models/shop_app/categories_model.dart';
import 'package:mk/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      builder: (context, state) => ListView.separated(
          itemBuilder: (context, index) =>
              buildCatItem(ShopCubit.get(context).category!.data!.data[index]),
          separatorBuilder: (context, index) => separatorBuilder(),
          itemCount: ShopCubit.get(context).category!.data!.data.length),
      listener: (context, state) {},
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image(height: 120, width: 120, image: NetworkImage(model.image!)),
            SizedBox(
              width: 7.0,
            ),
            Text(
              model.name!,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_sharp))
          ],
        ),
      );
}
