class ValidationException implements Exception {
  final String _message;

  ValidationException(this._message);

  @override
  String toString() {
    return _message;
  }
}

class DatabaseException implements Exception {
  final String _message;

  DatabaseException(this._message);

  @override
  String toString() {
    return _message;
  }

}
