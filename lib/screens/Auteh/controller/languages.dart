import 'package:get/get_navigation/get_navigation.dart';

class Languages implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          // Authentication & Core
          "1": "تسجيل دخول",
          "2": "إنشاء حساب",
          "3": "لوغو",
          "4": "الاسم",
          "5": "كلمة المرور",
          "6": "رقم الموبايل",
          "7": "ذكرني دائمًا",
          "8": "هل نسيت كلمة المرور؟",
          "9": "الإيميل",
          "10": "إرسال",
          "11": "إعادة تعيين كلمة المرور",
          "12": "    أدخل الإيميل لإرسال رمز التحقق",
          "13": "رقم الهاتف",
          "14": "تأكيد الرمز",
          "15": "تحقق من جهازك، لقد أرسلنا رمز التحقق على الإيميل",
          "16": "لم يصلك رمز التحقق؟",
          "17": "إعادة الإرسال",
          "18": "تأكيد كلمة المرور",

          // Booking & Travel
          "19": "تم",
          "20": "أحجز رحلتك الآن",
          "21": "سافر من",
          "22": "إلى",
          "23": "التاريخ",
          "24": "اختر شركة النقل",
          "25": "ابحث عن الرحلات المتاحة",
          "c": "الرحلات المتاحة",
          "26": "دمشق",
          "27": "اللاذقية",
          "28": "شركة القدموس",
          "29": "حلب",
          "v": "شباط",
          "30": "شركة الأهلي",
          "31": "الأعلى تقييمًا",
          "32": "أفضل العروض",
          "33": "عروض 50% لطلاب الجامعات",
          "34":
              "تعلن شركة زريق للسفريات عن خصم لجميع الطلاب المسافرين من دمشق إلى اللاذقية",

          // Navigation & Profile
          "35": "الرئيسية",
          "36": "شركات   النقل",
          "37": "الحجوزات",
          "38": "ابحث عن رحلتك",
          "39": "عروض",
          "40": "حول",
          "41": "تسجيل خروج",
          "42": "موعد الرحلة: 7:00 صباحًا",
          "43": "8,500 ل.س",
          "44": "الخلف",
          "45": "مدة الرحلة: 5 ساعات",
          "46": "تقييم 5.0",

          // Passenger & Booking Details
          "47": "حجز الرحلة",
          "48": "مكان الانطلاق",
          "49": "كراجات البولمان",
          "50": "مكان الوصول",
          "51": "معلومات المسافر",
          "52": "أضف اسمًا آخر",
          "53": "الاسم",
          "54": "الكنية",
          "55": "اسم الأم",
          "56": "الخانة",
          "57": "العمر",
          "58": "الجنس",
          "59": "ذكر",
          "60": "أنثى",
          "61": "رقم الموبايل",
          "62": "أرسل إشعارًا عند إتمام الحجز",
          "63": "الرقم الوطني",

          //notifi
          "100": "الأشعارات",

          // Seats & Payment
          "64": "اختر مقعدك",
          "65": "تثبيت الحجز",
          "66": "قيمة الحجز: 12,000 ل.س",
          "67": "عملية الحجز",
          "68": "تمت عملية الحجز بنجاح",
          "69": "العودة إلى الرئيسية",
          "70": "مراجعة الحجوزات",

          // Companies & Trips
          "71": "شركة الماهر",
          "72": "شركة الحسن",
          "73": "الرحلات من 6 صباحًا حتى 1 ظهرًا",
          "74": "شركة نقل بين دمشق واللاذقية والعكس",
          "75": "للحجز عبر التطبيق أو الاتصال بالرقم أدناه",
          "76": "المسافة: 600 كم",

          // Additional Features
          "77": "الاسم الكامل",
          "78": "محطات الاستراحة",
          "79": "رقم المقعد",
          "80": "تعديل الحجز",
          "81": "الملف الشخصي",
          "82": "حفظ",
          "83": "إلغاء",
          "84": "حذف اسم"
        },
        'en': {
          // Authentication & Core
          "1": "Login",
          "2": "Sign Up",
          "3": "Logo",
          "4": "Name",
          "5": "Password",
          "6": "Mobile Number",
          "7": "Remember Me",
          "8": "Forgot Password?",
          "9": "Email",
          "10": "Send",
          "11": "Reset Password",
          "12": "Enter your email to send a verification code      ",
          "13": "Phone Number",
          "14": "Verify Code",
          "15":
              "Check your device, we have sent the verification code to your email",
          "16": "Didn't receive the verification code?",
          "17": "Resend",
          "18": "Confirm Password",
//notifi
          "100": "Notification",
          // Booking & Travel
          "19": "Done",
          "v": "February",

          "20": "Book Your Trip Now",
          "c": "AvailableTrips",

          "21": "Travel From",
          "22": "To",
          "23": "Date",
          "24": "Choose Transportation Company",
          "25": "Search for Available Trips",
          "26": "Damascus",
          "27": "Lattakia",
          "28": "Al-Qadmus Company",
          "29": "Aleppo",
          "30": "Al-Ahli Company",
          "31": "Top Rated",
          "32": "Best Offers",
          "33": " Discount 50% for University Students",
          "34":
              "Zuraiq Travel Company announces a discount for all students traveling from Damascus to Lattakia",

          // Navigation & Profile
          "35": "Home",
          "36": "Transport Companies",
          "37": "Bookings",
          "38": "Search for Your Trip",
          "39": "Offers",
          "40": "About",
          "41": "Logout",
          "42": "Trip Time: 7:00 AM",
          "43": "8,500 SYP",
          "44": "Back",
          "45": "Trip Duration: 5 Hours",
          "46": "Rating 5.0",

          // Passenger & Booking Details
          "47": "Book Trip",
          "48": "Departure Location",
          "49": "Pullman Garages",
          "50": "Arrival Location",
          "51": "Passenger Information",
          "52": "Add Another Name",
          "53": "First Name",
          "54": "Last Name",
          "55": "Mother's Name",
          "56": "Box",
          "57": "Age",
          "58": "Gender",
          "59": "Male",
          "60": "Female",
          "61": "Mobile Number",
          "62": "Send Notification When Booking is Complete",
          "63": "National ID",

          // Seats & Payment
          "64": "Choose Your Seat",
          "65": "Confirm Booking",
          "66": "Booking Cost: 12,000 SYP",
          "67": "Booking Process",
          "68": "Booking Completed Successfully",
          "69": "Return to Home",
          "70": "Review Bookings",

          // Companies & Trips
          "71": "Al-Maher Company",
          "72": "Al-Hassan Company",
          "73": "Trips from 6 AM to 1 PM",
          "74":
              "Transport Company Between Damascus and Lattakia and Vice Versa",
          "75": "For booking via the app or by contacting the number below",
          "76": "Distance: 600 km",

          // Additional Features
          "77": "Full Name",
          "78": "Rest Stops",
          "79": "Seat Number",
          "80": "Modify Booking",
          "81": "Profile",
          "82": "Save",
          "83": "Cancel",
          "84": "Delete name"
        },
      };
}
