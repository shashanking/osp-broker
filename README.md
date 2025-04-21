# osp_broker

this project will be a cross platform application providing features such as 
a. Forum (we will start from here)
b. Auction
c. Business directories
d. Marketplace
e. games

initially this will be developed for web nut we will extend to mobile and tab versions with ios and android app.

frontend will be developed using flutter.
frontend specs 
1. light mode and dark mode 
2. domain driven design patern 
    - we will have features 
        in each feature will be domain (if needed), presentation layer , application layer .
        we will not have infrastructure layer. the api calls will be called inside application notifier,
        application layer will hold feature_notifier.dart and feature_state.dart. 
        we will use freezed and build runner for file generation.

        example of state 
```dart

part 'shop_state.freezed.dart';

//dart run build_runner build --delete-conflicting-outputs
@freezed
class ShopState with _$ShopState {
  factory ShopState({
    @Default(false) bool isLoading,
    @Default(false) bool checked,
    @Default(0) int? isSelected,
    @Default([]) List<Collection> collectionResponse,
    @Default(Products()) Products products,
    @Default(Products()) Products topSellerProducts,
    @Default(Products()) Products exclusiveOfferProducts,
    @Default(false) bool isInitLoading,
    @Default(ProductDetails()) ProductDetails productDetails,
    @Default([]) List<Slider> sliderList,
    @Default(0) int selectedSize,
    @Default(0) int selectedQuantity,
    @Default(0) int percentage,
    @Default(0) int productPrice,
    @Default([]) List<UserReviewModel> reviewData,
    @Default(false) bool searchActive,
    @Default([]) List<SearchProducts> searchResponse,
    String? searchQueryId,
  }) = _ShopState;
  const ShopState._();
}
```

3. responsive design
4. we will use dio for api calls
5. we will use flutter_riverpod for state management
6. we will use custom font Basement Grotesque
7. we will use google fonts for other fonts
8. we will use flutter_screenutil 5.9.3 for responsive design
9. we will use flutter_svg for svg images
10. we will use auto_route: for routing
11. outside features will be
    a core folder,
    holding constants,
    core infrastructure.
    - holding api_url string variables,
    - base api service,
    - dio exceptions,
    - hive_flutter (for local storage),
    - dio_exceptions,

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:
- figma design https://www.figma.com/design/fiOXqEiC0hnzWHCDHYMWrX/Website-Design?node-id=25-2672&p=f&t=QCUazz2ykXFNL9ys-0


For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
