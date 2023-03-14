extension StringHardcoded on String {
  String get hardcoded => this;

  String get capitalizeFirstChar =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
