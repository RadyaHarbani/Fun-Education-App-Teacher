import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app_teacher/app/api/savings/savings-submission/models/saving_submission_model.dart';
import 'package:fun_education_app_teacher/app/api/savings/savings-submission/models/saving_submission_response.dart';
import 'package:fun_education_app_teacher/app/api/savings/savings-submission/service/saving_submission_service.dart';
import 'package:fun_education_app_teacher/app/api/savings/total-savings/models/total_savings_model.dart';
import 'package:fun_education_app_teacher/app/api/savings/total-savings/models/total_savings_response.dart';
import 'package:fun_education_app_teacher/app/api/savings/total-savings/service/total_savings_service.dart';
import 'package:fun_education_app_teacher/app/api/savings/transaction/models/transaction_model.dart';
import 'package:fun_education_app_teacher/app/api/savings/transaction/models/transaction_response.dart';
import 'package:fun_education_app_teacher/app/api/savings/transaction/service/transaction_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailSavingPageController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final GlobalKey<FormState> formKeyIncoming = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyOutgoing = GlobalKey<FormState>();
  TotalSavingsService totalSavingsService = TotalSavingsService();
  TotalSavingsResponse? totalSavingsResponse;
  Rx<TotalSavingsModel> totalSavingsModel = TotalSavingsModel().obs;

  SavingSubmissionService savingSubmissionService = SavingSubmissionService();
  SavingSubmissionResponse? savingSubmissionResponse;
  Rx<SavingSubmissionModel> savingSubmissionModel = SavingSubmissionModel().obs;

  TransactionService transactionService = TransactionService();
  TransactionResponse? transactionResponse;
  RxList<TransactionModel> transactionModel = <TransactionModel>[].obs;

  TextEditingController amountIncomingController = TextEditingController();
  TextEditingController descriptionIncomingController = TextEditingController();
  TextEditingController amoutOutgoingController = TextEditingController();
  TextEditingController descriptionOutgoingController = TextEditingController();

  RxString userId = ''.obs;
  RxBool isLoadingAddTransaction = false.obs;
  RxBool isLoadingDetailSaving = false.obs;
  var totalSavings = 0.obs;

  @override
  void onInit() {
    super.onInit();
    userId.value = Get.arguments;
    showTotalSavingsByUserId(userId.value);
  }

  Future showTotalSavingsByUserId(String userId) async {
    try {
      isLoadingDetailSaving(true);
      final response = await totalSavingsService.getShowSavingsByUserId(userId);
      totalSavingsResponse = TotalSavingsResponse.fromJson(response.data);
      totalSavingsModel.value = totalSavingsResponse!.data;
      totalSavings.value = totalSavingsModel.value.savingInt!;
      showSavingSubmissionByUserId(userId);
      showTransactionByUserId(userId);
      isLoadingDetailSaving(false);
    } catch (e) {
      isLoadingDetailSaving(false);
      throw Exception(e);
    }
  }

  Future showSavingSubmissionByUserId(String userId) async {
    try {
      savingSubmissionModel.value = SavingSubmissionModel();
      final response =
          await savingSubmissionService.getShowSavingSubmissionByUserId(userId);
      savingSubmissionResponse =
          SavingSubmissionResponse.fromJson(response.data);
      savingSubmissionModel.value = savingSubmissionResponse!.data;
    } catch (e) {
      print(e);
    }
  }

  Future showTransactionByUserId(String userId) async {
    try {
      final response =
          await transactionService.getShowTransactionByUserId(userId);
      transactionResponse = TransactionResponse.fromJson(response.data);
      transactionModel.value = transactionResponse!.data;
    } catch (e) {
      print(e);
    }
  }

  Future updateStatusSavingSubmission(String status) async {
    try {
      await savingSubmissionService.putUpdateStatusSavingSubmission(
        savingSubmissionModel.value.id!,
        userId.value,
        savingSubmissionModel.value.category!,
        status,
      );

      showTotalSavingsByUserId(userId.value);
      update();

      if (status == 'Accepted') {
        Get.snackbar(
          'Berhasil',
          'Pengajuan Disetujui Guru',
          backgroundColor: successColor,
          colorText: whiteColor,
        );
      } else {
        Get.snackbar(
          'Berhasil',
          'Pengajuan Ditolak Guru',
          backgroundColor: successColor,
          colorText: whiteColor,
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        'Gagal',
        'Pengajuan Gagal',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    }
  }

  Future storeTransactionByAdmin(
    String category,
  ) async {
    if (category == 'income'
        ? formKeyIncoming.currentState!.validate()
        : formKeyOutgoing.currentState!.validate()) {
      try {
        isLoadingAddTransaction(true);
        String? isDescriptionIncome =
            descriptionIncomingController.text.isNotEmpty
                ? descriptionIncomingController.text
                : null;
        String? isDescriptionOutgoing =
            descriptionOutgoingController.text.isNotEmpty
                ? descriptionOutgoingController.text
                : null;

        await transactionService.postStoreTrasactionByAdmin(
          category == 'income'
              ? isDescriptionIncome != null
              : isDescriptionOutgoing != null,
          userId.value,
          category == 'income'
              ? amountIncomingController.text
              : amoutOutgoingController.text,
          category,
          category == 'income' ? isDescriptionIncome : isDescriptionOutgoing,
        );
        showTotalSavingsByUserId(userId.value);
        update();
        Get.back();
        isLoadingAddTransaction(false);
        Get.snackbar(
          'Berhasil',
          'Transaksi Berhasil Dicatat',
          backgroundColor: successColor,
          colorText: whiteColor,
        );

        amountIncomingController.clear();
        descriptionIncomingController.clear();
        amoutOutgoingController.clear();
        descriptionOutgoingController.clear();
      } catch (e) {
        isLoadingAddTransaction(false);
        print(e);
        Get.snackbar(
          'Gagal',
          'Transaksi Gagal Dicatat',
          backgroundColor: successColor,
          colorText: whiteColor,
        );
      }
    }
  }

  Future storeOutcomingTransactionWithUpdateStatusSubmission() async {
    try {
      await transactionService.postStoreTrasactionByAdmin(
        descriptionOutgoingController.text.isNotEmpty ? true : false,
        userId.value,
        amoutOutgoingController.text,
        'outcome',
        descriptionOutgoingController.text,
      );
      showTotalSavingsByUserId(userId.value);
      update();
      Get.back();
      Get.snackbar(
        'Berhasil',
        'Transaksi Berhasil Dicatat',
        backgroundColor: successColor,
        colorText: whiteColor,
      );

      amountIncomingController.clear();
      descriptionIncomingController.clear();
      amoutOutgoingController.clear();
      descriptionOutgoingController.clear();
    } catch (e) {
      print(e);
      Get.snackbar(
        'Gagal',
        'Transaksi Gagal Dicatat',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }
}
