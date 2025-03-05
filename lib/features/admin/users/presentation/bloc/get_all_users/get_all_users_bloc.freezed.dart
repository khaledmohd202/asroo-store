// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetAllUsersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isNotLoading) getAdminAllUsers,
    required TResult Function(String? searchName) searchForUser,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isNotLoading)? getAdminAllUsers,
    TResult? Function(String? searchName)? searchForUser,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isNotLoading)? getAdminAllUsers,
    TResult Function(String? searchName)? searchForUser,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetAdminAllUsersEvent value) getAdminAllUsers,
    required TResult Function(SearchFroUserEvent value) searchForUser,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetAdminAllUsersEvent value)? getAdminAllUsers,
    TResult? Function(SearchFroUserEvent value)? searchForUser,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetAdminAllUsersEvent value)? getAdminAllUsers,
    TResult Function(SearchFroUserEvent value)? searchForUser,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllUsersEventCopyWith<$Res> {
  factory $GetAllUsersEventCopyWith(
    GetAllUsersEvent value,
    $Res Function(GetAllUsersEvent) then,
  ) = _$GetAllUsersEventCopyWithImpl<$Res, GetAllUsersEvent>;
}

/// @nodoc
class _$GetAllUsersEventCopyWithImpl<$Res, $Val extends GetAllUsersEvent>
    implements $GetAllUsersEventCopyWith<$Res> {
  _$GetAllUsersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$GetAllUsersEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GetAllUsersEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isNotLoading) getAdminAllUsers,
    required TResult Function(String? searchName) searchForUser,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isNotLoading)? getAdminAllUsers,
    TResult? Function(String? searchName)? searchForUser,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isNotLoading)? getAdminAllUsers,
    TResult Function(String? searchName)? searchForUser,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetAdminAllUsersEvent value) getAdminAllUsers,
    required TResult Function(SearchFroUserEvent value) searchForUser,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetAdminAllUsersEvent value)? getAdminAllUsers,
    TResult? Function(SearchFroUserEvent value)? searchForUser,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetAdminAllUsersEvent value)? getAdminAllUsers,
    TResult Function(SearchFroUserEvent value)? searchForUser,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetAllUsersEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetAdminAllUsersEventImplCopyWith<$Res> {
  factory _$$GetAdminAllUsersEventImplCopyWith(
    _$GetAdminAllUsersEventImpl value,
    $Res Function(_$GetAdminAllUsersEventImpl) then,
  ) = __$$GetAdminAllUsersEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isNotLoading});
}

/// @nodoc
class __$$GetAdminAllUsersEventImplCopyWithImpl<$Res>
    extends _$GetAllUsersEventCopyWithImpl<$Res, _$GetAdminAllUsersEventImpl>
    implements _$$GetAdminAllUsersEventImplCopyWith<$Res> {
  __$$GetAdminAllUsersEventImplCopyWithImpl(
    _$GetAdminAllUsersEventImpl _value,
    $Res Function(_$GetAdminAllUsersEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isNotLoading = null}) {
    return _then(
      _$GetAdminAllUsersEventImpl(
        isNotLoading:
            null == isNotLoading
                ? _value.isNotLoading
                : isNotLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$GetAdminAllUsersEventImpl implements GetAdminAllUsersEvent {
  const _$GetAdminAllUsersEventImpl({required this.isNotLoading});

  @override
  final bool isNotLoading;

  @override
  String toString() {
    return 'GetAllUsersEvent.getAdminAllUsers(isNotLoading: $isNotLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAdminAllUsersEventImpl &&
            (identical(other.isNotLoading, isNotLoading) ||
                other.isNotLoading == isNotLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNotLoading);

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAdminAllUsersEventImplCopyWith<_$GetAdminAllUsersEventImpl>
  get copyWith =>
      __$$GetAdminAllUsersEventImplCopyWithImpl<_$GetAdminAllUsersEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isNotLoading) getAdminAllUsers,
    required TResult Function(String? searchName) searchForUser,
  }) {
    return getAdminAllUsers(isNotLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isNotLoading)? getAdminAllUsers,
    TResult? Function(String? searchName)? searchForUser,
  }) {
    return getAdminAllUsers?.call(isNotLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isNotLoading)? getAdminAllUsers,
    TResult Function(String? searchName)? searchForUser,
    required TResult orElse(),
  }) {
    if (getAdminAllUsers != null) {
      return getAdminAllUsers(isNotLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetAdminAllUsersEvent value) getAdminAllUsers,
    required TResult Function(SearchFroUserEvent value) searchForUser,
  }) {
    return getAdminAllUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetAdminAllUsersEvent value)? getAdminAllUsers,
    TResult? Function(SearchFroUserEvent value)? searchForUser,
  }) {
    return getAdminAllUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetAdminAllUsersEvent value)? getAdminAllUsers,
    TResult Function(SearchFroUserEvent value)? searchForUser,
    required TResult orElse(),
  }) {
    if (getAdminAllUsers != null) {
      return getAdminAllUsers(this);
    }
    return orElse();
  }
}

abstract class GetAdminAllUsersEvent implements GetAllUsersEvent {
  const factory GetAdminAllUsersEvent({required final bool isNotLoading}) =
      _$GetAdminAllUsersEventImpl;

  bool get isNotLoading;

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAdminAllUsersEventImplCopyWith<_$GetAdminAllUsersEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchFroUserEventImplCopyWith<$Res> {
  factory _$$SearchFroUserEventImplCopyWith(
    _$SearchFroUserEventImpl value,
    $Res Function(_$SearchFroUserEventImpl) then,
  ) = __$$SearchFroUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? searchName});
}

/// @nodoc
class __$$SearchFroUserEventImplCopyWithImpl<$Res>
    extends _$GetAllUsersEventCopyWithImpl<$Res, _$SearchFroUserEventImpl>
    implements _$$SearchFroUserEventImplCopyWith<$Res> {
  __$$SearchFroUserEventImplCopyWithImpl(
    _$SearchFroUserEventImpl _value,
    $Res Function(_$SearchFroUserEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? searchName = freezed}) {
    return _then(
      _$SearchFroUserEventImpl(
        freezed == searchName
            ? _value.searchName
            : searchName // ignore: cast_nullable_to_non_nullable
                as String?,
      ),
    );
  }
}

/// @nodoc

class _$SearchFroUserEventImpl implements SearchFroUserEvent {
  const _$SearchFroUserEventImpl(this.searchName);

  @override
  final String? searchName;

  @override
  String toString() {
    return 'GetAllUsersEvent.searchForUser(searchName: $searchName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFroUserEventImpl &&
            (identical(other.searchName, searchName) ||
                other.searchName == searchName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchName);

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFroUserEventImplCopyWith<_$SearchFroUserEventImpl> get copyWith =>
      __$$SearchFroUserEventImplCopyWithImpl<_$SearchFroUserEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isNotLoading) getAdminAllUsers,
    required TResult Function(String? searchName) searchForUser,
  }) {
    return searchForUser(searchName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isNotLoading)? getAdminAllUsers,
    TResult? Function(String? searchName)? searchForUser,
  }) {
    return searchForUser?.call(searchName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isNotLoading)? getAdminAllUsers,
    TResult Function(String? searchName)? searchForUser,
    required TResult orElse(),
  }) {
    if (searchForUser != null) {
      return searchForUser(searchName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetAdminAllUsersEvent value) getAdminAllUsers,
    required TResult Function(SearchFroUserEvent value) searchForUser,
  }) {
    return searchForUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetAdminAllUsersEvent value)? getAdminAllUsers,
    TResult? Function(SearchFroUserEvent value)? searchForUser,
  }) {
    return searchForUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetAdminAllUsersEvent value)? getAdminAllUsers,
    TResult Function(SearchFroUserEvent value)? searchForUser,
    required TResult orElse(),
  }) {
    if (searchForUser != null) {
      return searchForUser(this);
    }
    return orElse();
  }
}

abstract class SearchFroUserEvent implements GetAllUsersEvent {
  const factory SearchFroUserEvent(final String? searchName) =
      _$SearchFroUserEventImpl;

  String? get searchName;

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchFroUserEventImplCopyWith<_$SearchFroUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetAllUsersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllUsersModel> usersList) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
    required TResult Function(List<GetAllUsersModel> userList) search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetAllUsersModel> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
    TResult? Function(List<GetAllUsersModel> userList)? search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllUsersModel> usersList)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    TResult Function(List<GetAllUsersModel> userList)? search,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
    required TResult Function(SearchState value) search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SearchState value)? search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    TResult Function(SearchState value)? search,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllUsersStateCopyWith<$Res> {
  factory $GetAllUsersStateCopyWith(
    GetAllUsersState value,
    $Res Function(GetAllUsersState) then,
  ) = _$GetAllUsersStateCopyWithImpl<$Res, GetAllUsersState>;
}

/// @nodoc
class _$GetAllUsersStateCopyWithImpl<$Res, $Val extends GetAllUsersState>
    implements $GetAllUsersStateCopyWith<$Res> {
  _$GetAllUsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
    _$LoadingStateImpl value,
    $Res Function(_$LoadingStateImpl) then,
  ) = __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
    _$LoadingStateImpl _value,
    $Res Function(_$LoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStateImpl implements LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'GetAllUsersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllUsersModel> usersList) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
    required TResult Function(List<GetAllUsersModel> userList) search,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetAllUsersModel> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
    TResult? Function(List<GetAllUsersModel> userList)? search,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllUsersModel> usersList)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    TResult Function(List<GetAllUsersModel> userList)? search,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
    required TResult Function(SearchState value) search,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SearchState value)? search,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    TResult Function(SearchState value)? search,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements GetAllUsersState {
  const factory LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$SuccessStateImplCopyWith<$Res> {
  factory _$$SuccessStateImplCopyWith(
    _$SuccessStateImpl value,
    $Res Function(_$SuccessStateImpl) then,
  ) = __$$SuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GetAllUsersModel> usersList});
}

/// @nodoc
class __$$SuccessStateImplCopyWithImpl<$Res>
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$SuccessStateImpl>
    implements _$$SuccessStateImplCopyWith<$Res> {
  __$$SuccessStateImplCopyWithImpl(
    _$SuccessStateImpl _value,
    $Res Function(_$SuccessStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? usersList = null}) {
    return _then(
      _$SuccessStateImpl(
        usersList:
            null == usersList
                ? _value._usersList
                : usersList // ignore: cast_nullable_to_non_nullable
                    as List<GetAllUsersModel>,
      ),
    );
  }
}

/// @nodoc

class _$SuccessStateImpl implements SuccessState {
  const _$SuccessStateImpl({required final List<GetAllUsersModel> usersList})
    : _usersList = usersList;

  final List<GetAllUsersModel> _usersList;
  @override
  List<GetAllUsersModel> get usersList {
    if (_usersList is EqualUnmodifiableListView) return _usersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersList);
  }

  @override
  String toString() {
    return 'GetAllUsersState.success(usersList: $usersList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessStateImpl &&
            const DeepCollectionEquality().equals(
              other._usersList,
              _usersList,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_usersList));

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      __$$SuccessStateImplCopyWithImpl<_$SuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllUsersModel> usersList) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
    required TResult Function(List<GetAllUsersModel> userList) search,
  }) {
    return success(usersList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetAllUsersModel> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
    TResult? Function(List<GetAllUsersModel> userList)? search,
  }) {
    return success?.call(usersList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllUsersModel> usersList)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    TResult Function(List<GetAllUsersModel> userList)? search,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(usersList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
    required TResult Function(SearchState value) search,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SearchState value)? search,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    TResult Function(SearchState value)? search,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessState implements GetAllUsersState {
  const factory SuccessState({
    required final List<GetAllUsersModel> usersList,
  }) = _$SuccessStateImpl;

  List<GetAllUsersModel> get usersList;

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyStateImplCopyWith<$Res> {
  factory _$$EmptyStateImplCopyWith(
    _$EmptyStateImpl value,
    $Res Function(_$EmptyStateImpl) then,
  ) = __$$EmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyStateImplCopyWithImpl<$Res>
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$EmptyStateImpl>
    implements _$$EmptyStateImplCopyWith<$Res> {
  __$$EmptyStateImplCopyWithImpl(
    _$EmptyStateImpl _value,
    $Res Function(_$EmptyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyStateImpl implements EmptyState {
  const _$EmptyStateImpl();

  @override
  String toString() {
    return 'GetAllUsersState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllUsersModel> usersList) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
    required TResult Function(List<GetAllUsersModel> userList) search,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetAllUsersModel> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
    TResult? Function(List<GetAllUsersModel> userList)? search,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllUsersModel> usersList)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    TResult Function(List<GetAllUsersModel> userList)? search,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
    required TResult Function(SearchState value) search,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SearchState value)? search,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    TResult Function(SearchState value)? search,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyState implements GetAllUsersState {
  const factory EmptyState() = _$EmptyStateImpl;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
    _$ErrorStateImpl value,
    $Res Function(_$ErrorStateImpl) then,
  ) = __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
    _$ErrorStateImpl _value,
    $Res Function(_$ErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$ErrorStateImpl(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorStateImpl implements ErrorState {
  const _$ErrorStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetAllUsersState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllUsersModel> usersList) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
    required TResult Function(List<GetAllUsersModel> userList) search,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetAllUsersModel> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
    TResult? Function(List<GetAllUsersModel> userList)? search,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllUsersModel> usersList)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    TResult Function(List<GetAllUsersModel> userList)? search,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
    required TResult Function(SearchState value) search,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SearchState value)? search,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    TResult Function(SearchState value)? search,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements GetAllUsersState {
  const factory ErrorState({required final String error}) = _$ErrorStateImpl;

  String get error;

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
    _$SearchStateImpl value,
    $Res Function(_$SearchStateImpl) then,
  ) = __$$SearchStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GetAllUsersModel> userList});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
    _$SearchStateImpl _value,
    $Res Function(_$SearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userList = null}) {
    return _then(
      _$SearchStateImpl(
        userList:
            null == userList
                ? _value._userList
                : userList // ignore: cast_nullable_to_non_nullable
                    as List<GetAllUsersModel>,
      ),
    );
  }
}

/// @nodoc

class _$SearchStateImpl implements SearchState {
  const _$SearchStateImpl({required final List<GetAllUsersModel> userList})
    : _userList = userList;

  final List<GetAllUsersModel> _userList;
  @override
  List<GetAllUsersModel> get userList {
    if (_userList is EqualUnmodifiableListView) return _userList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userList);
  }

  @override
  String toString() {
    return 'GetAllUsersState.search(userList: $userList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            const DeepCollectionEquality().equals(other._userList, _userList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_userList));

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllUsersModel> usersList) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
    required TResult Function(List<GetAllUsersModel> userList) search,
  }) {
    return search(userList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetAllUsersModel> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
    TResult? Function(List<GetAllUsersModel> userList)? search,
  }) {
    return search?.call(userList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllUsersModel> usersList)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    TResult Function(List<GetAllUsersModel> userList)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(userList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
    required TResult Function(SearchState value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SearchState value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    TResult Function(SearchState value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class SearchState implements GetAllUsersState {
  const factory SearchState({required final List<GetAllUsersModel> userList}) =
      _$SearchStateImpl;

  List<GetAllUsersModel> get userList;

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
