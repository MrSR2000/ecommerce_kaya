part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final DataModel dataModel;

  CategorySuccess({
    required this.dataModel,
  });
}

class CategoryError extends CategoryState {
  final String error;

  CategoryError({required this.error});
}

class CategoryFilterLoading extends CategoryState {}

class CategoryFilterSuccess extends CategoryState {
  final CategoryFilterModel categoryFilterModel;

  CategoryFilterSuccess({required this.categoryFilterModel});
}

class CategoryFilterError extends CategoryState {
  final String error;

  CategoryFilterError({required this.error});
}
