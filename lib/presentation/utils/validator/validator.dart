class Validator {
  static isEmptyString(String string) {
    if (string == null || string.length < 1 || string.isEmpty) {
      return true;
    }

    return false;
  }

  static isEmptyCollection(List col) {
    if (col == null || col.isEmpty) {
      return true;
    }

    return false;
  }
}
