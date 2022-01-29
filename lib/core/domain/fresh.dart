class Fresh<T> {
  final bool isFresh;
  final T entity;
  final String filter;
  Fresh.yes({required this.entity, required this.filter}) : isFresh = true;
  Fresh.no({required this.entity, required this.filter}) : isFresh = false;
}
