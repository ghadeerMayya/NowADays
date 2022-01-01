import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowadays/layout/news_app/cubit/states.dart';
import 'package:nowadays/modules/business/business_screen.dart';
import 'package:nowadays/modules/science/science_screen.dart';
import 'package:nowadays/modules/settings/setting_screen.dart';
import 'package:nowadays/modules/sports/sports_screen.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_handball_sharp), label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(index==1)
      getSports();
    if(index==2)
      getScience();

    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if(business.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'ae',
        'category': 'business',
        'apiKey': 'c4a2cce5b6c94c29843493bcf498c1ce'
      }).then((value) {
        business=value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    }else{
      emit(NewsGetBusinessSuccessState());
    }


  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if(sports.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'ae',
        'category': 'sports',
        'apiKey': 'c4a2cce5b6c94c29843493bcf498c1ce'
      }).then((value) {
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }else{
      emit(NewsGetSportsSuccessState());
    }

  }

  List<dynamic> sciences = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (sciences.length==0){
      DioHelper.getData(url: 'v2/top-headlines',
          query: {
        'country': 'ae',
        'category': 'science',
        'apiKey': 'c4a2cce5b6c94c29843493bcf498c1ce'
      }).then((value) {
        sciences=value.data['articles'];
        print(sciences[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }

  }
}
