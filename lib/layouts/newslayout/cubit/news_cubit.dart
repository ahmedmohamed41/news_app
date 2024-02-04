import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/widgets/custom_Bottom_NavigationBar_Item.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

// create object from NewsCubit
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  String url = 'v2/top-headlines';
  String apiKey = 'fe0764dd1dab457d99ba4899405c6bc8';
  String country = 'us';

  void getIndex(int index) {
    currentIndex = index;
    if (index == 1)
      getSports();
    else if (index == 2) getScience();

    emit(NewsBottomNavState());
  }

  List<Widget> listScreen = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen(),
  ];
  List<String> appBarListScreen = [
    'Business Screen',
    'Sports Screen',
    'Science Screen',
    'Settings Screen',
  ];
  List<BottomNavigationBarItem> itemsList = [
    customBottomNavigationBarItem(icon: Icons.business, label: 'Business'),
    customBottomNavigationBarItem(icon: Icons.sports_soccer, label: 'Sports'),
    customBottomNavigationBarItem(icon: Icons.science, label: 'Science'),
    customBottomNavigationBarItem(icon: Icons.settings, label: 'Settings'),
  ];

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getBusiness() {
    emit(NewsBussinessLoadingState());
    DioHelper.getData(url: url, query: {
      'country': country,
      'category': 'business',
      'apiKey': apiKey,
    }).then((value) {
      business = value.data['articles'];

      emit(NewsGetDataBussinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsBussinessErrorState(error.toString()));
    });
  }

  void getSports() {
    if (sports.isEmpty) {
      DioHelper.getData(url: url, query: {
        'country': country,
        'category': 'sports',
        'apiKey': apiKey,
      }).then((value) {
        sports = value.data['articles'];
        emit(NewsGetDataSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetDataSportsSuccessState());
    }
  }

  void getScience() {
    if (science.isEmpty) {
      DioHelper.getData(url: url, query: {
        'country': country,
        'category': 'science',
        'apiKey': apiKey,
      }).then((value) {
        science = value.data['articles'];
        emit(NewsGetDataScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetDataScienceSuccessState());
    }
  }
  bool darkMode = false;
  void changeAppMode() {
    darkMode = !darkMode;
    emit(NewsChngeModeState());
  }
  

}
