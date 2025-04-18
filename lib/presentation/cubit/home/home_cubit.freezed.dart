// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  RequestState get requestState => throw _privateConstructorUsedError;
  RequestState get productsState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<String> get banners => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;
  CategoryModel? get currentCategory => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState productsState,
      String message,
      List<String> banners,
      List<CategoryModel> categories,
      List<ProductModel> products,
      CategoryModel? currentCategory});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? productsState = null,
    Object? message = null,
    Object? banners = null,
    Object? categories = null,
    Object? products = null,
    Object? currentCategory = freezed,
  }) {
    return _then(_value.copyWith(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      productsState: null == productsState
          ? _value.productsState
          : productsState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      currentCategory: freezed == currentCategory
          ? _value.currentCategory
          : currentCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState productsState,
      String message,
      List<String> banners,
      List<CategoryModel> categories,
      List<ProductModel> products,
      CategoryModel? currentCategory});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? productsState = null,
    Object? message = null,
    Object? banners = null,
    Object? categories = null,
    Object? products = null,
    Object? currentCategory = freezed,
  }) {
    return _then(_$HomeStateImpl(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      productsState: null == productsState
          ? _value.productsState
          : productsState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      currentCategory: freezed == currentCategory
          ? _value.currentCategory
          : currentCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.requestState = RequestState.initial,
      this.productsState = RequestState.initial,
      this.message = '',
      final List<String> banners = const [],
      final List<CategoryModel> categories = const [],
      final List<ProductModel> products = const [],
      this.currentCategory})
      : _banners = banners,
        _categories = categories,
        _products = products;

  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final RequestState productsState;
  @override
  @JsonKey()
  final String message;
  final List<String> _banners;
  @override
  @JsonKey()
  List<String> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final CategoryModel? currentCategory;

  @override
  String toString() {
    return 'HomeState(requestState: $requestState, productsState: $productsState, message: $message, banners: $banners, categories: $categories, products: $products, currentCategory: $currentCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.productsState, productsState) ||
                other.productsState == productsState) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.currentCategory, currentCategory) ||
                other.currentCategory == currentCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestState,
      productsState,
      message,
      const DeepCollectionEquality().hash(_banners),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_products),
      currentCategory);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final RequestState requestState,
      final RequestState productsState,
      final String message,
      final List<String> banners,
      final List<CategoryModel> categories,
      final List<ProductModel> products,
      final CategoryModel? currentCategory}) = _$HomeStateImpl;

  @override
  RequestState get requestState;
  @override
  RequestState get productsState;
  @override
  String get message;
  @override
  List<String> get banners;
  @override
  List<CategoryModel> get categories;
  @override
  List<ProductModel> get products;
  @override
  CategoryModel? get currentCategory;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
