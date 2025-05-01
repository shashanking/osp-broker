// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

part of 'menu_state.dart';

// coverage:ignore-file
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuState {
  String get selectedMenu => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuStateCopyWith<MenuState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuStateCopyWith<$Res> {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) then) = _$MenuStateCopyWithImpl<$Res, MenuState>;
  $Res call({String selectedMenu});
}

/// @nodoc
class _$MenuStateCopyWithImpl<$Res, $Val extends MenuState> implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._value, this._then);

  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @override
  $Res call({
    Object? selectedMenu = null,
  }) {
    return _then(_value.copyWith(
      selectedMenu: null == selectedMenu
          ? _value.selectedMenu
          : selectedMenu // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuStateCopyWith<$Res> implements $MenuStateCopyWith<$Res> {
  factory _$$_MenuStateCopyWith(_$_MenuState value, $Res Function(_$_MenuState) then) = __$$_MenuStateCopyWithImpl<$Res>;
  @override
  $Res call({String selectedMenu});
}

/// @nodoc
class __$$_MenuStateCopyWithImpl<$Res> extends _$MenuStateCopyWithImpl<$Res, _$_MenuState> implements _$$_MenuStateCopyWith<$Res> {
  __$$_MenuStateCopyWithImpl(_$_MenuState _value, $Res Function(_$_MenuState) _then)
      : super(_value, _then);

  @override
  $Res call({
    Object? selectedMenu = null,
  }) {
    return _then(_$_MenuState(
      selectedMenu: null == selectedMenu
          ? _value.selectedMenu
          : selectedMenu // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MenuState implements _MenuState {
  const _$_MenuState({required this.selectedMenu});

  @override
  final String selectedMenu;

  @override
  String toString() {
    return 'MenuState(selectedMenu: $selectedMenu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuState &&
            (identical(other.selectedMenu, selectedMenu) || other.selectedMenu == selectedMenu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMenu);

  @JsonKey(ignore: true)
  @override
  _$$_MenuStateCopyWith<_$_MenuState> get copyWith => __$$_MenuStateCopyWithImpl<_$_MenuState>(this, _$identity);
}

abstract class _MenuState implements MenuState {
  const factory _MenuState({required final String selectedMenu}) = _$_MenuState;

  @override
  String get selectedMenu;
  @override
  @JsonKey(ignore: true)
  _$$_MenuStateCopyWith<_$_MenuState> get copyWith => throw _privateConstructorUsedError;
}
