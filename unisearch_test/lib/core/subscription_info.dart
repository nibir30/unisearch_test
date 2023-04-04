// import '../features/packages/domain/entities/subscription_info_entity.dart';

// class SubscriptionInfo {
//   bool isMbbsSubscribed = false;
//   bool isAdmissionSubscribed = false;
//   bool isBdsSubscribed = false;
//   bool isPostGradSubscribed = false;
//   List<String> subscriptionIds = [];
//   static final _info = SubscriptionInfo._internal();
//   SubscriptionInfo._internal();
//   factory SubscriptionInfo() {
//     return _info;
//   }

//   Future<void> clearSubscriptionData() async {
//     subscriptionInfo.subscriptionIds = [];
//     subscriptionInfo.isMbbsSubscribed = false;
//     subscriptionInfo.isAdmissionSubscribed = false;
//     subscriptionInfo.isBdsSubscribed = false;
//     subscriptionInfo.isPostGradSubscribed = false;
//   }

//   Future<void> setSubscriptionData(final List<SubscriptionsInfoEntity> subscriptions) async {
//     subscriptionInfo.subscriptionIds = [];
//     subscriptionInfo.isMbbsSubscribed = false;
//     subscriptionInfo.isAdmissionSubscribed = false;
//     subscriptionInfo.isBdsSubscribed = false;
//     subscriptionInfo.isPostGradSubscribed = false;
//     //
//     for (var i = 0; i < subscriptions.length; i++) {
//       for (var j = 0; j < subscriptions[i].subscriptions!.length; j++) {
//         subscriptionInfo.subscriptionIds.add(subscriptions[i].subscriptions![j].subscriptionId.toString());
//         if (subscriptions[i].subscriptions![j].subscriptionsType == "mbbs-monthly") {
//           subscriptionInfo.isMbbsSubscribed = true;
//           subscriptionInfo.isBdsSubscribed = true;
//         }
//         if (subscriptions[i].subscriptions![j].subscriptionsType == "admission-one-time") {
//           subscriptionInfo.isAdmissionSubscribed = true;
//         }
//         if (subscriptions[i].subscriptions![j].subscriptionsType == "post-grad-monthly") {
//           subscriptionInfo.isPostGradSubscribed = true;
//         }
//       }

//       if (isMbbsSubscribed == true) {
//         print("MBBS subscribed");
//       } else {
//         print("MBBS NOT subscribed");
//       }
//       if (isAdmissionSubscribed == true) {
//         print("Admission subscribed");
//       } else {
//         print("Admission Not subscribed");
//       }
//       if (isPostGradSubscribed == true) {
//         print("PostGrad subscribed");
//       } else {
//         print("PostGrad Not subscribed");
//       }
//     }
//   }
// }

// final SubscriptionInfo subscriptionInfo = SubscriptionInfo();
