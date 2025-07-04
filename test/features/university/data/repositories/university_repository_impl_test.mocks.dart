// Mocks generated by Mockito 5.4.6 from annotations
// in flutter_clean_architecture/test/features/university/data/repositories/university_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_clean_architecture/core/network/api_response.dart'
    as _i2;
import 'package:flutter_clean_architecture/features/university/data/datasources/university_data_source.dart'
    as _i3;
import 'package:flutter_clean_architecture/features/university/domain/entities/university.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApiResponse_0<T> extends _i1.SmartFake
    implements _i2.ApiResponse<T> {
  _FakeApiResponse_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [UniversityDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUniversityDataSource extends _i1.Mock
    implements _i3.UniversityDataSource {
  MockUniversityDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get searchUniversityUrl =>
      (super.noSuchMethod(
            Invocation.getter(#searchUniversityUrl),
            returnValue: _i4.dummyValue<String>(
              this,
              Invocation.getter(#searchUniversityUrl),
            ),
          )
          as String);

  @override
  set searchUniversityUrl(String? _searchUniversityUrl) => super.noSuchMethod(
    Invocation.setter(#searchUniversityUrl, _searchUniversityUrl),
    returnValueForMissingStub: null,
  );

  @override
  _i5.Future<_i2.ApiResponse<List<_i6.University>>> search(
    String? keyword,
    String? country,
    int? offset,
    int? limit,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#search, [keyword, country, offset, limit]),
            returnValue:
                _i5.Future<_i2.ApiResponse<List<_i6.University>>>.value(
                  _FakeApiResponse_0<List<_i6.University>>(
                    this,
                    Invocation.method(#search, [
                      keyword,
                      country,
                      offset,
                      limit,
                    ]),
                  ),
                ),
          )
          as _i5.Future<_i2.ApiResponse<List<_i6.University>>>);
}
