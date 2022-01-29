class Fresh<T> {
  final bool isFresh;
  final T entity;
  Fresh.yes({required this.entity}) : isFresh = true;
  Fresh.no({required this.entity}) : isFresh = false;
}
