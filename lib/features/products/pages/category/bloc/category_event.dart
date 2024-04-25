part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class CategoryGetProducts extends CategoryEvent {
  final String slug;
  final FilterModel? filter;
  final bool reload;
  final int page;
  final bool fromFilter;

  CategoryGetProducts({
    required this.slug,
    this.filter,
    this.reload = true,
    this.page = 1,
    this.fromFilter = false,
  });
}

class CategoryGetFilters extends CategoryEvent {
  final String slug;

  CategoryGetFilters({required this.slug});
}
