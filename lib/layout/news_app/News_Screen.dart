import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/layout/news_app/cubit/cubit.dart';
import 'package:mk/layout/news_app/cubit/states.dart';
import 'package:mk/modules/news_app/search_screen/search_screen.dart';
import 'package:mk/shared/components/components.dart';
import 'package:mk/shared/cuibt/cuibt.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states) => {},
      builder: (context, states) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    navigatorTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,

                    //     ,color: Colors.black,
                    // size: 35.0,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(Icons.brightness_4_sharp)),
            ],
            title: Text(
              "7allousi News  ",
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (index) {
              cubit.changeCurrentIndex(index);
            },
          ),
        );
      },
    );
  }
}
