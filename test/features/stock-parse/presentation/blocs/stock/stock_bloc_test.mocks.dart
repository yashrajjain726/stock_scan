// Mocks generated by Mockito 5.4.2 from annotations
// in stock_scan/test/features/stock-parse/presentation/blocs/stock/stock_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stock_scan/core/errors/failure.dart' as _i6;
import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart'
    as _i7;
import 'package:stock_scan/features/stock-parse/domain/repository/stock_repository.dart'
    as _i2;
import 'package:stock_scan/features/stock-parse/domain/usecases/get_stock_usecase.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeStockRepository_0 extends _i1.SmartFake
    implements _i2.StockRepository {
  _FakeStockRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetStocksUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetStocksUseCase extends _i1.Mock implements _i4.GetStocksUseCase {
  MockGetStocksUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.StockRepository get stockRepository => (super.noSuchMethod(
        Invocation.getter(#stockRepository),
        returnValue: _FakeStockRepository_0(
          this,
          Invocation.getter(#stockRepository),
        ),
      ) as _i2.StockRepository);

  @override
  set stockRepository(_i2.StockRepository? _stockRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #stockRepository,
          _stockRepository,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Scan>>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, List<_i7.Scan>>>.value(
            _FakeEither_1<_i6.Failure, List<_i7.Scan>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Scan>>>);
}