import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/layout/Cubit/states.dart';
import 'package:meals/models/AreaModel.dart';
import 'package:meals/models/CategoryModel.dart';
import 'package:meals/models/DetailsMealsModel.dart';
import 'package:meals/modules/Categories.dart';
import 'package:meals/network/Diohelper.dart';

import '../../models/CategoryDetails.dart';
import '../../models/Indregient.dart';
import '../../modules/Area.dart';
import '../../modules/ingredients.dart';

class MealsCubit extends Cubit<MealsStates>{
MealsCubit():super(initialState());
static MealsCubit get(context)=>BlocProvider.of(context);
List<Widget> Screen=
    [
      CategoriesScreen(),
      DutiesOfTheCountry(),
      Ingredients()

    ];
List<String> title=[
  'Meals',
  'Country Meals',
  'Ingredients Meals'

];
var currentIndex=0;
void ChangeBottom(index){
  currentIndex=index;
  emit(changeNavBottomState());
}
bool isDark=false;
void changeTheme(){
isDark = !isDark;
emit(changeThemeState());
}
CategoriesModel? CModel;
void GetDataCategory(){
  DioHelper.GetData(url: 'categories.php').then((value) {
   // print(value.data);
    emit(GetCategorySuccessState());
    CModel=CategoriesModel.fromJson(value.data);
   // print(CModel!.data!.data![0]);
  }).catchError((error){
    emit(GetCategoryErrorState());
    print('error category ${error.toString()}');

  });
}
AreaModel? AModel;
void GetDataArea(){
  DioHelper.GetData(
      url: 'list.php',
    query: {
        'a':'list'
    }
  ).then((value) {
    //print(value.data);
    emit(GetAreaSuccessState());
    AModel=AreaModel.fromJson(value.data);
    // print(CModel!.data!.data![0]);
  }).catchError((error){
    emit(GetAreaErrorState());
    print('error category ${error.toString()}');

  });
}
IngredientModel? IModel;
void GetDataIngredient(){
  DioHelper.GetData(
      url: 'list.php',
      query: {
        'i':'list'
      }
  ).then((value) {
    //print(value.data);
    emit(GetIngredientSuccessState());
    IModel=IngredientModel.fromJson(value.data);
    // print(CModel!.data!.data![0]);
  }).catchError((error){
    emit(GetIngredientErrorState());
    print('error category ${error.toString()}');

  });
}

DetailsCategory? DCModel;
void GetDetailsCategory({required String name}){
  //emit(GetDetailsCategoryLoadingState());
  DioHelper.GetData(
      url: 'filter.php',
      query: {
        'c':'$name'
      }
  ).then((value) {
    print(value.data);
    emit(GetDetailsCategorySuccessState());
    DCModel=DetailsCategory.fromJson(value.data);
    //print(DCModel!.meal);
  }).catchError((error){
    emit(GetDetailsCategoryErrorState());
    print('error category ${error.toString()}');

  });
}
DetailsCategory? DAModel;
void GetDetailsArea({required String name}){
  //emit(GetDetailsCategoryLoadingState());
  DioHelper.GetData(
      url: 'filter.php',
      query: {
        'a':'$name'
      }
  ).then((value) {
    print(value.data);
    emit(GetDetailsCategorySuccessState());
    DAModel=DetailsCategory.fromJson(value.data);
    //print(DCModel!.meal);
  }).catchError((error){
    emit(GetDetailsCategoryErrorState());
    print('error category ${error.toString()}');

  });
}
DetailsCategory? DIModel;
void GetDetailsIngredent({required String name}){
  //emit(GetDetailsCategoryLoadingState());
  DioHelper.GetData(
      url: 'filter.php',
      query: {
        'i':'$name'
      }
  ).then((value) {
    print(value.data);
    emit(GetDetailsCategorySuccessState());
    DIModel=DetailsCategory.fromJson(value.data);
    //print(DCModel!.meal);
  }).catchError((error){
    emit(GetDetailsCategoryErrorState());
    print('error category ${error.toString()}');

  });
}
DetailsMealsModel? details;
void GetDetailsMeals({required String name}){
  //emit(GetDetailsCategoryLoadingState());
  DioHelper.GetData(
      url: 'lookup.php',
      query: {
        'i':'$name'
      }
  ).then((value) {
   // print(value.data);
    emit(GetDetailsSuccessState());
    details=DetailsMealsModel.fromJson(value.data);
    //print(DCModel!.meal);
  }).catchError((error){
    emit(GetDetailsErrorState());
    print('error category ${error.toString()}');

  });
}

DetailsMealsModel? search;
void GetSearchMeals({required String name}){
  //emit(GetDetailsCategoryLoadingState());
  //emit(GetSearchLoadingState());
  DioHelper.GetData(
      url: 'search.php',
      query: {
        's':'$name'
      }
  ).then((value) {
    // print(value.data);
    emit(GetSearchSuccesstate());
    search=DetailsMealsModel.fromJson(value.data);
    //print(DCModel!.meal);
  }).catchError((error){
    emit(GetSearchErrorState());
    print('error category ${error.toString()}');

  });
}
}