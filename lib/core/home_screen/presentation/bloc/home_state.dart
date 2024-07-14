part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetProductsLoadingState extends HomeState {}

class GetProductsSuccessState extends HomeState {}

class GetProductsErrorState extends HomeState {}
