import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({
    required this.authType,
    required this.onPressed,
    super.key,
  });

  final AuthType authType;
  final ValueChanged<AuthType> onPressed;

  @override
  Widget build(BuildContext context) {
    showLog(authType);
    final width = (context.width - (2 * AppSizes.hScreenPadding.w) - 10.r) / 2;
    return AppContainer(
      padding: EdgeInsets.all(4.r),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: width,
                child: AppButton(
                  text: AppStrings.login.tr(),
                  backgroundColor:
                      authType.isLogin() ? context.colorScheme.primary : null,
                  borderColor: Colors.transparent,
                  textColor: authType.isLogin() ? Colors.white : null,
                  onPressed: () {
                    onPressed(AuthType.login);
                  },
                ),
              ),
              SizedBox(
                width: width,
                child: AppButton(
                  text: AppStrings.register.tr(),
                  backgroundColor: authType.isRegister()
                      ? context.colorScheme.primary
                      : null,
                  borderColor: Colors.transparent,
                  textColor: authType.isRegister() ? Colors.white : null,
                  onPressed: () {
                    onPressed(AuthType.register);
                  },
                ),
              ),
            ],
          ),
          AnimatedPositionedDirectional(
            duration: AppFunctions.duration300ms,
            start: authType.isLogin() ? 0 : width,
            width: width,
            child: _MovingButton(
              title: authType.isLogin()
                  ? AppStrings.login.tr()
                  : AppStrings.register.tr(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovingButton extends StatelessWidget {
  const _MovingButton({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: title,
      backgroundColor: context.colorScheme.primary,
      borderColor: context.colorScheme.primary,
      textColor: Colors.white,
    );
  }
}
