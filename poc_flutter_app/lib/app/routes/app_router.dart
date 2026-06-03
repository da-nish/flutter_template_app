import 'package:go_router/go_router.dart';
import 'package:poc_flutter_app/app/routes/route_observer.dart';
import 'package:poc_flutter_app/app/screens/data_view/view/data_view_screen.dart';
import 'package:poc_flutter_app/app/screens/listview_screen/view/listview_screen.dart';
import 'package:poc_flutter_app/app/screens/login_screen/login_screen.dart';
import 'package:poc_flutter_app/app/screens/profile_sub_route/profile_admin_screen.dart';
import 'package:poc_flutter_app/app/screens/profile_sub_route/profile_company_screen.dart';
import 'package:poc_flutter_app/app/screens/profile_sub_route/profile_user_screen.dart';
import 'package:poc_flutter_app/app/screens/whatnext/view/whatnext_screen.dart';

import '../screens/dashboard_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String login1 = '/login1';
  static const String listview = '/listview';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String dashboard = '/dashboard';
  static const String dataViewScreen='/DataViewScreen';
  static const String whatnextScreen='/whatnext_screen';

}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  observers: [AppRouteObserver()],
  
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.login1,
      builder: (context, state) {
        final text = state.extra as String?;
        return LoginScreen1(initialEmail: text);
      },
    ),
    GoRoute(
      path: AppRoutes.listview,
      builder: (context, state) {
        return ListViewScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.profile,
      // builder: (context, state) => const ProfileScreen(),
      builder: (context, state) {
        final user = state.extra as User;
        return ProfileScreen(user: user);
      },
      routes: [
          GoRoute(
            path: "admin",
            builder: (context, state) {
              return ProfileAdminScreen();
            },
          ),
          GoRoute(
            path: "user",
            builder: (context, state) {
              return ProfileUserScreen();
            },
          ),
          GoRoute(
            path: "company",
            builder: (context, state) {
              return ProfileCompanyScreen();
            },
          ),
      ]
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: AppRoutes.dashboard,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: AppRoutes.dataViewScreen,
      builder: (context, state) => const DataViewScreen(),
    ),
    GoRoute(
        path: AppRoutes.whatnextScreen,
        builder: (context, state) => const WhatnextScreen(),
    ),
  ],
);

