import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/layout/news_app/cubit/cubit.dart';
import 'package:mk/layout/shop_app/cubit/cubit.dart';
import 'package:mk/layout/shop_app/shop_layout.dart';
import 'package:mk/modules/shop_app/onboarding_screen/onboarding.dart';
import 'package:mk/modules/shop_app/shop_app_login/shop_app_login.dart';
import 'package:mk/shared/bloc_observer.dart';
import 'package:mk/shared/cuibt/cuibt.dart';
import 'package:mk/shared/cuibt/states.dart';
import 'package:mk/shared/network/local/cache_helper.dart';
import 'package:mk/shared/network/remote/dio_helper.dart';
import 'package:mk/shared/styles/themes.dart';

import '../shared/components/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //IMPORT TO FINISH ALL FUTURE FUNCTION THEN RUN APP
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  Widget widget;
  token = CacheHelper.getData(key: 'token');
  widget = ShopLayout();
  if (onBoarding != null) {
    if (token != null) {
    } else
      widget = ShopLoginScreen();
  } else {
    widget = OnBoardingScreen();
  }

  print(token);
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(isDark, widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  final bool? isDark;

  final Widget? startWidget;

  MyApp(
    this.isDark,
    this.startWidget,
  );

  // constructor
  // build
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              AppCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
            create: (BuildContext context) => ShopCubit()
              ..getHomeData()
              ..getCategoriesData()
              ..getFavData()
              ..getUserData()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          //AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light
          home: startWidget,
        ),
      ),
    );
  }
}
//    return MaterialApp(
//       debugShowMaterialGrid: false,
//       theme:
//       ThemeData(
//         brightness: Brightness.dark,
//         /* light theme settings */
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         /* dark theme settings */
//       ),
//       themeMode: ThemeMode.dark,
//       /* ThemeMode.system to follow system theme,
//          ThemeMode.light for light theme,
//          ThemeMode.dark for dark theme
//       */
//       debugShowCheckedModeBanner: false,
//       home: HomeLayout(),
//     );
