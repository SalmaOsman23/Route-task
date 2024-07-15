import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/core/home_screen/data/product_model.dart';
import 'package:route_task/helper/api_helper.dart';
import 'package:route_task/helper/end_points.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  ProductModel? productModel;
  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    await ApiHelper.getData(url: EndPoint.baseUrl).then((response) async {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        productModel = ProductModel.fromJson(json.decode(response.body));
        emit(GetProductsSuccessState());
      } else if (response.statusCode == 422) {
        emit(GetProductsErrorState());
      }
    });
  }

  List<ProductModel> products =[] ;
  List<ProductModel>? search ;
    void searchProduct(String? searchTerm) {
    if (products.isNotEmpty) {
      if (searchTerm!.isEmpty) {
        search = products;
      } else {
        search = products
            .where((title) =>
             title.title.toLowerCase().contains(searchTerm.toLowerCase()))
            .toList();
      }
      emit(SearchResultsState());
    }
  }


}
