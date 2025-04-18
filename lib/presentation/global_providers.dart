import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/presentation/cubit/main/main_cubit.dart';
import 'package:gazhome/presentation/cubit/notifications_count/notifications_count_cubit.dart';
import 'package:gazhome/presentation/cubit/rebuild/rebuild_cubit.dart';

final providers = [
  BlocProvider<RebuildCubit>(create: (context) => sl<RebuildCubit>()),
  BlocProvider<MainCubit>(create: (context) => sl<MainCubit>()),
  BlocProvider<NotificationsCountCubit>(
    create: (context) => sl<NotificationsCountCubit>(),
  ),
];
