import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/travel%20page/model/percon_info.dart';

class PersonController extends GetxController {
  RxList<Person> persons = <Person>[].obs;
  RxString formkey = "".obs;
  RxInt key = 1.obs;
  RxList<Person> percon = <Person>[].obs;
  RxBool Initialized = false.obs;
  RxBool isloading = false.obs;
  void addPerson() {
    // إنشاء مجموعة جديدة من المفاتيح لكل شخص
    final newFormKeys = {
      'lastname': GlobalKey<FormState>(),
      'firstname': GlobalKey<FormState>(),
      'Box': GlobalKey<FormState>(),
      'mothername': GlobalKey<FormState>(),
      'fathername': GlobalKey<FormState>(),
      'age': GlobalKey<FormState>(),
      'mobileNumber': GlobalKey<FormState>(),
      'nationalID': GlobalKey<FormState>(),
    };

    persons.add(Person(
      formKeys: newFormKeys,
      lastname: null,
      mothername: null,
      Box: null,
      NationaID: null,
      age: null,
      mobleNumber: null,
      first_name: null,
      fathername: null,
    ));
  }

  Future<void> updata_percon({
    String? first_name,
    String? last_name,
    String? mother_name,
    String? father_name,
    String? Box,
    String? age,
    String? mobile,
    String? national_id,
  }) async {
    // التحقق من القيم الفارغة
    // if (first_name.isEmpty ||
    //     last_name.isEmpty ||
    //     mother_name.isEmpty ||
    //     father_name.isEmpty ||
    //     Box.isEmpty ||
    //     mobile.isEmpty ||
    //     national_id.isEmpty) {
    //   throw Exception('All fields are required');
    // }

    // إدخال البيانات في Supabase
    if (national_id == null) {
      throw Exception('national_id مطلوبة');
    }

    try {
      // أضف .select() لإرجاع البيانات المحدثة
      final List<dynamic> response = await supabase
          .from('info_user')
          .update({
            'national_id': national_id,
            'person': {
              'first_name': first_name,
              'last_name': last_name,
              'mother_name': mother_name,
              'father_name': father_name,
              'Box': Box,
              'age': age,
              'mobile_number': mobile,
            },
          })
          .eq('national_id', national_id!)
          .select(); // <-- إضافة select()

      // إذا كانت القائمة فارغة، يعني أنه لم يتم تحديث أي صفوف
      if (response.isEmpty) {
        Get.snackbar(
          "'No data updated! Make sure NationalID is correct ! ",
          ' ERROR',
          icon: Icon(
            Icons.close,
            color: colorwhite,
          ),
          duration: Duration(seconds: 3),
          backgroundColor: colorblue,
          colorText: colorwhite,
        );
        print('ANAS');
      } else {
        Get.snackbar(
          'Success',
          'Data updated successfully!',
          icon: const Icon(Icons.check_circle, color: Colors.white),
          backgroundColor: colorblue,
          colorText: colorwhite,
          duration: const Duration(seconds: 1),
        ).future.then((_) => Get.offAllNamed('/HomeScreenView'));
        print("ADvvvd");
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        icon: const Icon(Icons.error, color: Colors.white),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }
  }

  Future<void> Info_person({
    String? first_name,
    String? last_name,
    String? mother_name,
    String? father_name,
    String? Box,
    String? age,
    String? mobile,
    String? national_id,
  }) async {
    try {
      // التحقق من القيم الفارغة
      // if (first_name.isEmpty ||
      //     last_name.isEmpty ||
      //     mother_name.isEmpty ||
      //     father_name.isEmpty ||
      //     Box.isEmpty ||
      //     mobile.isEmpty ||
      //     national_id.isEmpty) {
      //   throw Exception('All fields are required');
      // }

      // إدخال البيانات في Supabase
      await supabase.from('info_user').upsert({
        'national_id': national_id,
        'person': {
          'first_name': first_name,
          'last_name': last_name,
          'mother_name': mother_name,
          'father_name': father_name,
          'Box': Box,
          'age': age,
          'mobile_number': mobile,
        },
      });

      // التحقق من وجود أخطاء

      print('Data inserted successfully!');
    } on Exception catch (e) {
      print('Error: $e');
      // يمكنك إعادة رمي الخطأ أو التعامل معه حسب الحاجة
      rethrow;
    }
  }

  void deletePerson(int index) {
    if (index >= 0 && index < persons.length) {
      persons.removeAt(index);
    }
  }

  Future<void> receve_info_percon() async {
    final response = await supabase.from("info_user").select(
          "person,national_id",
        );
    final data = response;
    print(data.isEmpty);
    percon.clear();
    for (int i = 0; i < data.length; i++) {
      try {
        final personData = data[i]["person"];
        final isn = data[i]['national_id'];
        final g = Person.fromJson(personData, isn);
        print(g.Box);
        print(percon.length);
        percon.add(g);
      } catch (e) {
        print('Error processing data at index $i: $e');
      }
    }
    isloading.value = true;
  }
}



  // 'first_name': first_name,
  //       'last_name': last_name,
  //       'mother_name': mother_name,
  //       'father_name': father_name,
  //       'age': age,
  //       'mobile_number': mobile,
  //       'national_id': nution_id,