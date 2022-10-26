import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/product%20info/cubit/product_info_state.dart';
import 'package:task/features/product%20info/repository/product_info_repository.dart';

class ProductInfoCubit extends Cubit<ProductInfoState>
    with ProductInfoRepository {
  ProductInfoCubit() : super(ProductInfoInitial());

  Dio? dio = Dio();

  String? image;

  String? name;

  String? price;

  String? discount;
  double? stars;

  @override
  void getData() {
    emit(ProductInfoLoading());
    try {
      dio!.get(
          'https://www.pricerunner.dk/pl/94-4687044/Hoeretelefoner/Apple-AirPods-%282nd-generation%29-2019-Sammenlign-Priser');
      image = 'https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg';
      name = 'Apple AirPods Pro 2nd generation';
      price = '8,150 EGP';
      discount = '-1% ';
      stars = 4;
      emit(ProductInfoDone());
    } catch (eror) {
      emit(ProductInfoError());
    }
  }
}
