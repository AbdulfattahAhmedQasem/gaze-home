import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/dialogs/action_dialog.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/back_icon.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({required this.paymentUrl, super.key});
  final String paymentUrl;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _webViewController = WebViewController();
  var _isLoading = true;
  var _hideWebView = false;

  @override
  void didChangeDependencies() {
    _webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(context.theme.scaffoldBackgroundColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            if (_isLoading == true) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            showLog(request.url);
            if (request.url.contains('payment-failed') ||
                request.url.contains('checkout?error')) {
              setState(() {
                _hideWebView = true;
              });
              AppFunctions.showAppDialog<void>(
                context,
                child: ActionDialog(
                  title: AppStrings.unknownError.tr(),
                  type: MessageType.error,
                  confirmText: AppStrings.cancel.tr(),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ).then((_) {
                context.pop();
              });
            } else if (request.url.contains('shop.gazhome.sa/success')) {
              setState(() {
                _hideWebView = true;
              });
              AppFunctions.showAppDialog<void>(
                context,
                child: ActionDialog(
                  title: AppStrings.paymentHasBeenSuccessfully.tr(),
                  type: MessageType.success,
                  confirmText: AppStrings.myOrders.tr(),
                  onPressed: () {
                    context.popUntil(Routes.main);
                    context.mainCubit.updateIndex(2);
                  },
                ),
              ).then((_) {
                context.popUntil(Routes.main);
                context.mainCubit.updateIndex(2);
              });
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: AppStrings.payment.tr(),
        leading: const BackIcon(),
      ),
      body:
          _hideWebView
              ? const SizedBox.shrink()
              : Stack(
                fit: StackFit.expand,
                children: [
                  Transform.scale(
                    scale: getValueForScreenType(medium: 1, large: 2),
                    child: WebViewWidget(controller: _webViewController),
                  ),
                  if (_isLoading) AppLoading.fetch(),
                ],
              ),
    );
  }
}
