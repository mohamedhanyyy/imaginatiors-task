import 'package:equatable/equatable.dart';

abstract class ProductInfoState extends Equatable {}

class ProductInfoInitial extends ProductInfoState {
  @override
  List<Object?> get props => [];
}

class ProductInfoLoading extends ProductInfoState {
  @override
  List<Object?> get props => [];
}

class ProductInfoDone extends ProductInfoState {
  @override
  List<Object?> get props => [];
}

class ProductInfoError extends ProductInfoState {
  @override
  List<Object?> get props => [];
}
