import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/layout/news_app/cubit/states.dart';
import 'package:mk/modules/news_app/business_screen/business_screen.dart';
import 'package:mk/modules/news_app/science_screen/science_screen.dart';
import 'package:mk/modules/news_app/sports_screen/sports_screen.dart';
import 'package:mk/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: "business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.settings)
    //     , label: "settings"
    //
    // ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    // SettingsScreen(),
  ];
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(NewsBottomNavBarState());
    if (index == 1) getSports();

    if (index == 2) getScience();
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'd66390ed0a594926ba2c8d1754b1f380',
    })?.then((value) {
      business = value?.data['articles'];
      print(business[0]['title'].toString());
      emit(NewsBusinessSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsBusinessErrorState(e.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'd66390ed0a594926ba2c8d1754b1f380',
      })?.then((value) {
        sports = value?.data['articles'];
        print(sports[0]['title'].toString());
        emit(NewsSportsSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsSportsErrorState(e.toString()));
      });
    } else {
      emit(NewsSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'd66390ed0a594926ba2c8d1754b1f380',
      })?.then((value) {
        science = value?.data['articles'];
        print(science[0]['title'].toString());
        emit(NewsScienceSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsScienceErrorState(e.toString()));
      });
    } else
      emit(NewsScienceSuccessState());
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'd66390ed0a594926ba2c8d1754b1f380',
    })?.then((value) {
      search = value?.data['articles'];
      print(search[0]['title'].toString());
      emit(NewsSearchSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsSearchErrorState(e.toString()));
    });
  }
}
