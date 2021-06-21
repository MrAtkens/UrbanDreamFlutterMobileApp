// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on AuthBase, Store {
  Computed<User>? _$getUserComputed;

  @override
  User get getUser => (_$getUserComputed ??=
          Computed<User>(() => super.getUser, name: 'AuthBase.getUser'))
      .value;

  final _$userAtom = Atom(name: 'AuthBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isAuthenticatedAtom = Atom(name: 'AuthBase.isAuthenticated');

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  final _$authorizationAsyncAction = AsyncAction('AuthBase.authorization');

  @override
  Future<void> authorization(dynamic context, String email, String password) {
    return _$authorizationAsyncAction
        .run(() => super.authorization(context, email, password));
  }

  final _$registrationAsyncAction = AsyncAction('AuthBase.registration');

  @override
  Future<void> registration(dynamic context, String firstName, String lastName,
      String email, String password) {
    return _$registrationAsyncAction.run(() =>
        super.registration(context, firstName, lastName, email, password));
  }

  final _$logOutAsyncAction = AsyncAction('AuthBase.logOut');

  @override
  Future<void> logOut(dynamic context) {
    return _$logOutAsyncAction.run(() => super.logOut(context));
  }

  final _$setInitialRouteAsyncAction = AsyncAction('AuthBase.setInitialRoute');

  @override
  Future<void> setInitialRoute(dynamic context) {
    return _$setInitialRouteAsyncAction
        .run(() => super.setInitialRoute(context));
  }

  @override
  String toString() {
    return '''
user: ${user},
isAuthenticated: ${isAuthenticated},
getUser: ${getUser}
    ''';
  }
}
