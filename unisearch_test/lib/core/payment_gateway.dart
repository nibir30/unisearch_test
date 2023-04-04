// import 'package:flutter_sslcommerz/model/SSLCAdditionalInitializer.dart';
// import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
// import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
// import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
// import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
// import 'package:flutter_sslcommerz/sslcommerz.dart';
// import 'package:medi_bee/core/user_info.dart';

// class Payment {
//   Future<SSLCTransactionInfoModel> payNow(
//       double amount, String subId, String validity) async {
//     Sslcommerz sslcommerz = Sslcommerz(
//       initializer: SSLCommerzInitialization(
//           ipn_url: "https://medibee.app/admin/api/v1/subscription/buy",
//           currency: SSLCurrencyType.BDT,
//           product_category: subId,
//           sdkType: SSLCSdkType.LIVE,
//           store_id: "medibeecombdlive",
//           store_passwd: "5F2F7E3B9686244306",
//           total_amount: amount,
//           tran_id: userInfo.id+userInfo.username),
//     );
//     sslcommerz.addAdditionalInitializer(
//       sslcAdditionalInitializer: SSLCAdditionalInitializer(
//         valueA: subId,
//         valueB: userInfo.id,
//         valueC: userInfo.username,
//         valueD: validity,
//       ),
//     );
//     var payment = await sslcommerz.payNow();
//     return payment;
//   }
// }
