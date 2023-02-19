import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/core/network/exceptions/api_exception.dart';
import 'package:jubelio/core/network/exceptions/app_exception.dart';
import 'package:jubelio/core/network/exceptions/database_exception.dart';
import 'package:jubelio/core/network/exceptions/json_format_exception.dart';
import 'package:jubelio/core/network/exceptions/network_exception.dart';
import 'package:jubelio/core/network/exceptions/not_found_exception.dart';
import 'package:jubelio/core/network/exceptions/service_unavailable_exception.dart';
import 'package:jubelio/core/network/exceptions/timeout_exception.dart';
import 'package:jubelio/core/network/exceptions/unauthorize_exception.dart';

void main() {
  var tAppException = AppException(message: "Exception");
  var tApiException =
      ApiException(message: "Exception", httpCode: 400, status: "Error");
  var tDatabaseException = DatabaseException("Exception");
  var tJsonFormatException = JsonFormatException("Exception");
  var tNetworkException = NetworkException("Exception");
  var tNotFoundException = NotFoundException("Exception", "Error");
  var tUnavailableException = ServiceUnavailableException("Exception");
  var tTimeoutException = TimeoutException("Exception");
  var tUnauthorizedException = UnauthorizedException("Exception");

  test('should be a return message (AppException)', () {
    expect("Exception", tAppException.message);
  });

  test('should be a return message (ApiException)', () {
    expect("Exception", tApiException.message);
  });

  test('should be a return message (DatabaseException)', () {
    expect("Exception", tDatabaseException.message);
  });

  test('should be a return message (JsonFormatException)', () {
    expect("Exception", tJsonFormatException.message);
  });

  test('should be a return message (NetworkException)', () {
    expect("Exception", tNetworkException.message);
  });

  test('should be a return message (NotFoundException)', () {
    expect("Exception", tNotFoundException.message);
  });

  test('should be a return message (ServiceUnavailableException)', () {
    expect("Exception", tUnavailableException.message);
  });

  test('should be a return message (TimeoutException)', () {
    expect("Exception", tTimeoutException.message);
  });

  test('should be a return message (UnauthorizedException)', () {
    expect("Exception", tUnauthorizedException.message);
  });
}
