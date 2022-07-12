// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApiController on _ApiController, Store {
  late final _$stateAtom = Atom(name: '_ApiController.state', context: context);

  @override
  ApiState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ApiState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$dataAtom = Atom(name: '_ApiController.data', context: context);

  @override
  List<DataModel> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<DataModel> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_ApiController.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_ApiControllerActionController =
      ActionController(name: '_ApiController', context: context);

  @override
  dynamic searchTitle(String title) {
    final _$actionInfo = _$_ApiControllerActionController.startAction(
        name: '_ApiController.searchTitle');
    try {
      return super.searchTitle(title);
    } finally {
      _$_ApiControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
data: ${data}
    ''';
  }
}
