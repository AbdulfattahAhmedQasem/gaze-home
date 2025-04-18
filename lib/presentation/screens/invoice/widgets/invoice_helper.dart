import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/models/order_item_model.dart';
import 'package:gazhome/data/models/user_model.dart';
import 'package:gazhome/data/models/user_order_product_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class InvoiceHelper {
  const InvoiceHelper._();

  static Widget buildInvoiceHeader({
    required UserModel user,
    required int orderId,
    required ImageProvider logo,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image(logo, width: 50.w, height: 60.h),
            SizedBox(width: 4.w),
            Text(
              AppStrings.gazHome.tr(),
              style: TextStyle(
                fontSize: 24.sp,
                color: PdfColor.fromHex('#B72446'),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextTile(
                  AppStrings.commercialRegistrationNumber.tr(),
                  '2050198849',
                ),
                SizedBox(height: 10.h),
                buildTextTile(
                  AppStrings.authenticationNumber.tr(),
                  '0000140291',
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: AppSizes.inset.h),
        Text(
          '${sl<SharedData>().userType.isIndividual() ? AppStrings.simplifyInvoice.tr() : AppStrings.taxInvoice.tr()}  : ( $orderId )',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        buildDivider(),
        buildTitleText(AppStrings.customerDetails.tr()),
        SizedBox(height: 10.h),
        buildTextTile(
          AppStrings.name.tr(),
          '${user.firstName} ${user.lastName}',
        ),
        SizedBox(height: 10.h),
        buildTextTile(AppStrings.phoneNumber1.tr(), user.phoneNumber),
      ],
    );
  }

  static Widget buildFooter({
    required String date,
    required num totalPrice,
    required num shippingCost,
    required num totalPriceAfterTax,
    required ImageProvider qr,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InvoiceHelper.buildTitleText(AppStrings.orderDetails.tr()),
        SizedBox(height: 10.h),
        InvoiceHelper.buildTextTile(AppStrings.orderDate.tr(), date),
        SizedBox(height: 10.h),
        InvoiceHelper.buildTextTile(
          AppStrings.totalPrice.tr(),
          '${totalPrice.toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
        ),
        SizedBox(height: 10.h),
        InvoiceHelper.buildTextTile(
          AppStrings.shippingAndDeliveryCharges.tr(),
          '${shippingCost.toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
        ),
        SizedBox(height: 10.h),
        InvoiceHelper.buildTextTile(
          '${AppStrings.tax.tr()} ( 15% )',
          '${(0.15 * totalPrice).toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
        ),
        SizedBox(height: 10.h),
        InvoiceHelper.buildTextTile(
          AppStrings.totalIncludingTax.tr(),
          '${totalPriceAfterTax.toInt()} ${AppStrings.sar1.tr()}',
        ),
        SizedBox(height: 30.h),
        Image(qr, width: 100.r, height: 100.r),
      ],
    );
  }

  static Widget buildBody1({
    required BuildContext context,
    required List<OrderItemModel> items,
  }) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(width: 0.3, color: PdfColors.grey500),
      columnWidths: {
        0: const FlexColumnWidth(1.5),
        1: const FlexColumnWidth(1.5),
        2: const FlexColumnWidth(1.5),
        3: const FlexColumnWidth(1.5),
        4: const FlexColumnWidth(2),
      },
      children: [
        TableRow(
          children: [
            InvoiceHelper.pdfTableHeader(AppStrings.total.tr()),
            InvoiceHelper.pdfTableHeader(AppStrings.tax.tr()),
            InvoiceHelper.pdfTableHeader(AppStrings.price.tr()),
            InvoiceHelper.pdfTableHeader(AppStrings.quantity.tr()),
            InvoiceHelper.pdfTableHeader(AppStrings.product.tr()),
          ],
        ),
        ...items.map(
          (item) => TableRow(
            children: [
              InvoiceHelper.pdfTableCell(
                '${item.totalPriceAfterTax.toInt()} ${AppStrings.sar1.tr()}',
              ),
              InvoiceHelper.pdfTableCell(
                '${((item.taxRate / 100) * item.totalPrice).toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
              ),
              InvoiceHelper.pdfTableCell(
                '${item.price.toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
              ),
              InvoiceHelper.pdfTableCell(item.quantity.toString()),
              InvoiceHelper.pdfTableCell(
                context.isRTL() ? item.product.nameAr : item.product.nameEn,
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget buildBody2({
    required BuildContext context,
    required List<UserOrderProductModel> products,
  }) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(width: 0.3, color: PdfColors.grey500),
      columnWidths: {
        0: const FlexColumnWidth(1.5),
        1: const FlexColumnWidth(1.5),
        2: const FlexColumnWidth(1.5),
        3: const FlexColumnWidth(1.5),
        4: const FlexColumnWidth(2),
      },
      children: [
        TableRow(
          children: [
            InvoiceHelper.pdfTableHeader(AppStrings.total.tr()),
            InvoiceHelper.pdfTableHeader(AppStrings.tax.tr()),
            InvoiceHelper.pdfTableHeader(AppStrings.price.tr()),
            InvoiceHelper.pdfTableHeader(AppStrings.quantity.tr()),
            InvoiceHelper.pdfTableHeader(AppStrings.product.tr()),
          ],
        ),
        ...products.map(
          (product) => TableRow(
            children: [
              InvoiceHelper.pdfTableCell(
                '${product.productPriceAfterTax.toInt()} ${AppStrings.sar1.tr()}',
              ),
              InvoiceHelper.pdfTableCell(
                '${(0.15 * product.productPrice).toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
              ),
              InvoiceHelper.pdfTableCell(
                '${product.productPrice.toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
              ),
              InvoiceHelper.pdfTableCell(
                product.productQuantityInOrder.toString(),
              ),
              InvoiceHelper.pdfTableCell(product.productName),
            ],
          ),
        ),
      ],
    );
  }

  static Widget buildTitleText(String title) {
    return Text(
      '* $title',
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
    );
  }

  static Widget buildTextTile(String title, String content) {
    return Text('- $title : $content', style: TextStyle(fontSize: 18.sp));
  }

  static Widget buildDivider() {
    return Divider(
      height: 2 * AppSizes.inset.h,
      color: PdfColor.fromHex('#C1C1C1'),
      thickness: 0.5.r,
    );
  }

  static Widget pdfTableHeader(String title) {
    return Container(
      color: PdfColor.fromHex('#E5E5E5'),
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 6.w),
      child: Text(
        title,
        style: TextStyle(fontSize: 20.sp),
        textAlign: TextAlign.center,
      ),
    );
  }

  static Widget pdfTableCell(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 6.w),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.sp),
        textAlign: TextAlign.center,
      ),
    );
  }

  static Future<ImageProvider> loadImageFromAssets(String path) async {
    final byteData = await rootBundle.load(path);
    final imageBytes = byteData.buffer.asUint8List();
    return MemoryImage(imageBytes);
  }
}
