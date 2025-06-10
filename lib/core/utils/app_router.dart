import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:travel_app1/screens/Auteh/modle/middleware.dart';
import 'package:travel_app1/screens/Auteh/view/Login_signUp_view.dart';
import 'package:travel_app1/screens/Auteh/view/Login_view.dart';
import 'package:travel_app1/screens/Auteh/view/Reset%20password_view.dart';
import 'package:travel_app1/screens/Auteh/view/confirm_Passwor_view.dart';
import 'package:travel_app1/screens/Auteh/view/create_Accont_veiw.dart';
import 'package:travel_app1/screens/Auteh/view/forgot_Password%20_view.dart';
import 'package:travel_app1/screens/Home%20screen/Transportation_view.dart';
import 'package:travel_app1/screens/Home%20screen/view/Home_screen_view.dart';
import 'package:travel_app1/screens/Home%20screen/view/PageNotif_view.dart';
import 'package:travel_app1/screens/Profile_user/view/edit_ProfileUser_view.dart';
import 'package:travel_app1/screens/Reservations/view/edit_Reservation_view.dart';
import 'package:travel_app1/screens/Reservations/view/reservation_view.dart';
import 'package:travel_app1/screens/travel%20page/Book_Flight_View.dart';
import 'package:travel_app1/screens/travel%20page/Succeeded.dart';
import 'package:travel_app1/screens/travel%20page/travel_page_view.dart';

abstract class AppRouter {
  static final routes = [
    GetPage(
      name: '/',
      page: () {
        return Login_signUp_view();
      },
      middlewares: [Authmiddleware()],
    ),
    GetPage(
      name: '/HomeScreenView',
      page: () {
        return const HomeScreenView();
      },
    ),
    GetPage(
      name: '/create_Accont_veiw',
      page: () {
        return const create_Accont_veiw();
      },
    ),
    GetPage(
      name: '/EditProfileuserView',
      page: () {
        return const EditProfileuserView();
      },
    ),
    GetPage(
      name: '/Login_view',
      page: () {
        return const Login_view();
      },
    ),
    GetPage(
      name: '/forgotPassword_View',
      page: () {
        return const forgotPassword_View();
      },
    ),
    GetPage(
      name: '/ConfirmPassworView',
      page: () {
        return const ConfirmPassworView();
      },
    ),
    GetPage(
      name: "/ResetpasswordView",
      page: () {
        return const ResetpasswordView();
      },
    ),
    GetPage(
      name: '/PagenotifView',
      page: () {
        return const PagenotifView();
      },
    ),
    GetPage(
      name: '/ReservationView',
      page: () {
        return const ReservationView();
      },
    ),
    GetPage(
      name: '/TransportationView',
      page: () {
        return const TransportationView();
      },
    ),
    GetPage(
      name: '/EditReservationView',
      page: () {
        return EditReservationView();
      },
    ),
    GetPage(
      name: '/TravelPageView',
      page: () {
        return const TravelPageView();
      },
    ),
    GetPage(
      name: '/BookFlightView',
      page: () {
        return const BookFlightView();
      },
    ),
    GetPage(
      name: '/Succeeded_BooKing_view',
      page: () {
        return const Succeeded_BooKing_view();
      },
    ),
  ];
}
