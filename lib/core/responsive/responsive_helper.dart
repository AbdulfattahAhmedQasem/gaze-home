import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/presentation/my_app.dart';

T getValueForScreenType<T>({
  required T medium,
  T? small,
  T? semiLarge,
  T? large,
}) {
  final context = navigatorKey.currentContext!;
  final deviceScreenType = context.deviceScreenType;
  if (deviceScreenType.isLarge() && large != null) {
    return large;
  } else if (deviceScreenType.isSemiLarge() && semiLarge != null) {
    return semiLarge;
  } else if (deviceScreenType.isSmall() && small != null) {
    return small;
  }
  return medium;
}

enum DeviceScreenType { small, medium, semiLarge, large }

extension DeviceScreenTypeExtension on DeviceScreenType {
  bool isSmall() => this == DeviceScreenType.small;
  bool isMedium() => this == DeviceScreenType.medium;
  bool isSemiLarge() => this == DeviceScreenType.semiLarge;
  bool isLarge() => this == DeviceScreenType.large;
}
