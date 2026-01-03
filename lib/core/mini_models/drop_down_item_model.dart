class DropDownItemModel<T> {
  final String title;
  final T value;

  DropDownItemModel({required this.title, required this.value});

  @override
  int get hashCode => title.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DropDownItemModel &&
            title == other.title &&
            value == other.value &&
            runtimeType == other.runtimeType);
  }
}