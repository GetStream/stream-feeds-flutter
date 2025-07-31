//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'models.dart';
export 'models.dart';

part 'api_client.g.dart';
part 'api_helper.g.dart';
part 'api_exception.g.dart';
part 'auth/authentication.g.dart';
part 'auth/api_key_auth.g.dart';
part 'auth/oauth.g.dart';
part 'auth/http_basic_auth.g.dart';
part 'auth/http_bearer_auth.g.dart';

part 'api/default_api.g.dart';

/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
ApiClient defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) =>
    pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
