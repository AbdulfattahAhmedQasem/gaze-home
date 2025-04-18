import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/data/models/onboarding_model.dart';
import 'package:gazhome/presentation/cubit/account/account_cubit.dart';
import 'package:gazhome/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import 'package:gazhome/presentation/cubit/book_order/book_order_cubit.dart';
import 'package:gazhome/presentation/cubit/cart/cart_cubit.dart';
import 'package:gazhome/presentation/cubit/driver_orders/driver_orders_cubit.dart';
import 'package:gazhome/presentation/cubit/favorite/favorite_cubit.dart';
import 'package:gazhome/presentation/cubit/main/main_item.dart';
import 'package:gazhome/presentation/cubit/make_order/make_order_cubit.dart';
import 'package:gazhome/presentation/cubit/support/support_cubit.dart';
import 'package:gazhome/presentation/cubit/user_orders/user_orders_cubit.dart';
import 'package:gazhome/presentation/dirver_orders/dirver_orders_screen.dart';
import 'package:gazhome/presentation/screens/account/driver_account_screen.dart';
import 'package:gazhome/presentation/screens/account/user_account_screen.dart';
import 'package:gazhome/presentation/screens/book_order/book_order_screen.dart';
import 'package:gazhome/presentation/screens/cart/cart_screen.dart';
import 'package:gazhome/presentation/screens/home/home_screen.dart';
import 'package:gazhome/presentation/screens/my_favorites/my_favorites_screen.dart';
import 'package:gazhome/presentation/screens/support/support_screen.dart';

final onboardingData = [
  OnboardingModel(
    image: AppImages.onboarding1,
    title:
        '${AppStrings.welcomeTo.tr()} ${AppStrings.in_.tr()} ${AppStrings.gazHome.tr()}',
    description: AppStrings.onboardingDesc1.tr(),
  ),
  OnboardingModel(
    image: AppImages.onboarding2,
    title: AppStrings.onboardingTitle2.tr(),
    description: AppStrings.onboardingDesc2.tr(),
  ),
  OnboardingModel(
    image: AppImages.onboarding3,
    title: AppStrings.onboardingTitle3.tr(),
    description: AppStrings.onboardingDesc3.tr(),
  ),
];

final mainUserItems = <MainItem>[
  MainItem(
    index: 0,
    title: AppStrings.home,
    icon: AppSvgs.home,
    screen: MultiBlocProvider(
      providers: [
        BlocProvider<AddToCartCubit>(create: (context) => sl<AddToCartCubit>()),
        BlocProvider<FavoriteCubit>(create: (context) => sl<FavoriteCubit>()),
      ],
      child: const HomeScreen(),
    ),
  ),
  MainItem(
    index: 1,
    title: AppStrings.cart,
    icon: AppSvgs.cart,
    screen: MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (context) => sl<CartCubit>()..getCartProducts(),
        ),
        BlocProvider<MakeOrderCubit>(create: (context) => sl<MakeOrderCubit>()),
      ],
      child: const CartScreen(),
    ),
  ),
  MainItem(
    index: 2,
    title: AppStrings.account,
    icon: AppSvgs.user,
    screen: MultiBlocProvider(
      providers: [
        BlocProvider<AccountCubit>(create: (context) => sl<AccountCubit>()),
        BlocProvider<UserOrdersCubit>(
          create: (context) => sl<UserOrdersCubit>()..getOrders(),
        ),
      ],
      child: const UserAccountScreen(),
    ),
  ),
  MainItem(
    index: 3,
    title: AppStrings.favorite,
    icon: AppSvgs.favorite2,
    screen: MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteCubit>(
          create: (context) => sl<FavoriteCubit>()..getMyFavorites(),
        ),
        BlocProvider<AddToCartCubit>(create: (context) => sl<AddToCartCubit>()),
      ],
      child: const MyFavoritesScreen(),
    ),
  ),
  MainItem(
    index: 4,
    title: AppStrings.support,
    icon: AppSvgs.headset,
    screen: BlocProvider<SupportCubit>(
      create: (context) => sl<SupportCubit>(),
      child: const SupportScreen(),
    ),
  ),
];

final mainDriverItems = <MainItem>[
  MainItem(
    index: 0,
    title: AppStrings.bookOrder,
    icon: AppSvgs.bookOrder,
    screen: BlocProvider<BookOrderCubit>(
      create: (context) => sl<BookOrderCubit>()..getInitialData(),
      child: const BookOrderScreen(),
    ),
  ), // child: Container(),

  const MainItem(
    index: 1,
    title: AppStrings.myOrders1,
    icon: AppSvgs.truck,
    screen: DirverOrdersScreen(),
  ),
  MainItem(
    index: 2,
    title: AppStrings.account,
    icon: AppSvgs.user,
    screen: BlocProvider<AccountCubit>(
      create: (context) => sl<AccountCubit>(),
      child: const DriverAccountScreen(),
    ),
  ),
  const MainItem(
    index: 3,
    title: AppStrings.support,
    icon: AppSvgs.headset,
    screen: SupportScreen(),
  ),
];
