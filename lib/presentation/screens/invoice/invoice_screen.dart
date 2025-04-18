import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/utilities/pdf_helper.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/models/complete_order_model.dart';
import 'package:gazhome/data/models/user_model.dart';
import 'package:gazhome/data/models/user_order_model.dart';
import 'package:gazhome/presentation/cubit/invoice/invoice_cubit.dart';
import 'package:gazhome/presentation/screens/invoice/widgets/invoice_helper.dart';
import 'package:gazhome/presentation/widgets/app_bar_icon.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_logo.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/back_icon.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({required this.order, super.key});

  final dynamic order;

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  void initState() {
    super.initState();
    context.read<InvoiceCubit>().generatePdfFile(generateInvoicePdf);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, __) {
        if (didPop) {
          return;
        }
        _backToAccountScreen();
      },
      child: BlocBuilder<InvoiceCubit, InvoiceState>(
        builder: (context, state) {
          return AppScaffold(
            appBar: AppBarWidget(
              leading: BackIcon(onPressed: _backToAccountScreen),
              customTitle: Row(
                children: [
                  12.hSpace,
                  AppLogo(
                    title:
                        sl<SharedData>().userType.isIndividual()
                            ? AppStrings.simplifyInvoice.tr()
                            : AppStrings.taxInvoice.tr(),
                  ),
                ],
              ),
              actions: [
                if (state.requestState.isLoaded())
                  AppBarIcon(
                    icon: AppSvgs.share,
                    onPressed: () {
                      Share.shareXFiles([XFile(state.invoiceFile!.path)]);
                    },
                  ),
              ],
            ),
            body: Builder(
              builder: (context) {
                if (state.requestState.isLoading()) {
                  return AppLoading.fetch();
                } else if (state.requestState.hasError()) {
                  return AppErrorWidget(message: state.message);
                } else if (state.requestState.isLoaded()) {
                  return SfPdfViewer.file(state.invoiceFile!);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            floatingActionButton: AppButton(
              width: 50.r,
              height: 50.r,
              padding: EdgeInsets.zero,
              backgroundColor: context.colorScheme.primary,
              borderColor: context.colorScheme.primary,
              child: Icon(Icons.download, size: 24.r, color: Colors.white),
              onPressed: () {
                OpenFilex.open(state.invoiceFile!.path);
              },
            ),
          );
        },
      ),
    );
  }

  Future<File> generateInvoicePdf(UserModel user) async {
    final isFromCompleteOrderScreen = widget.order is CompleteOrderModel;
    final logo = await InvoiceHelper.loadImageFromAssets(AppImages.logo);
    final qr = await InvoiceHelper.loadImageFromAssets(AppImages.qr);
    final orderId =
        isFromCompleteOrderScreen
            ? (widget.order as CompleteOrderModel).id
            : (widget.order as UserOrderModel).orderId;

    final invoiceFile = await PdfHelper.generate(
      fileName: 'invoice_$orderId.pdf',
      body: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          InvoiceHelper.buildInvoiceHeader(
            user: user,
            orderId: orderId,
            logo: logo,
          ),
          pw.SizedBox(height: 50.h),
          if (isFromCompleteOrderScreen)
            InvoiceHelper.buildBody1(
              context: context,
              items: (widget.order as CompleteOrderModel).items,
            )
          else
            InvoiceHelper.buildBody2(
              context: context,
              products: (widget.order as UserOrderModel).products,
            ),
          pw.SizedBox(height: 30.h),
          pw.Builder(
            builder: (_) {
              if (isFromCompleteOrderScreen) {
                final order = widget.order as CompleteOrderModel;
                return InvoiceHelper.buildFooter(
                  date: order.createdAt,
                  totalPrice: order.totalPrice,
                  shippingCost: order.shippingCost,
                  totalPriceAfterTax: order.totalPriceAfterTax,
                  qr: qr,
                );
              } else {
                final order = widget.order as UserOrderModel;
                return InvoiceHelper.buildFooter(
                  date: order.orderDeliveryDate,
                  totalPrice: order.orderTotalPrice,
                  shippingCost: order.orderShippingCost,
                  totalPriceAfterTax:
                      order.orderTotalPrice +
                      order.orderShippingCost +
                      (0.15 * order.orderTotalPrice),
                  qr: qr,
                );
              }
            },
          ),
        ],
      ),
    );
    return invoiceFile!;
  }

  void _backToAccountScreen() {
    if (widget.order is CompleteOrderModel) {
      context.popUntil(Routes.main);
      context.mainCubit.updateIndex(2);
    } else {
      context.pop();
    }
  }
}
