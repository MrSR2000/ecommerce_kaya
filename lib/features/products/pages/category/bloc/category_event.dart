part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class CategoryGetProducts extends CategoryEvent {
  final String slug;
  final FilterModel? filter;

  CategoryGetProducts({
    required this.slug,
    this.filter,
  });
}

class CategoryGetFilters extends CategoryEvent {
  final String slug;

  CategoryGetFilters({required this.slug});
}
