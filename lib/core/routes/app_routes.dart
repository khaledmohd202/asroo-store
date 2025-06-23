import 'package:asroo_store/core/app/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/screens/custom_web_view.dart';
import 'package:asroo_store/core/common/screens/under_build_screen.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/routes/base_routes.dart';
import 'package:asroo_store/features/admin/home_admin/presentation/screens/home_admin_screen.dart';
import 'package:asroo_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:asroo_store/features/auth/presentation/screens/login_screen.dart';
import 'package:asroo_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:asroo_store/features/customer/main/presentation/cubit/main/main_cubit.dart';
import 'package:asroo_store/features/customer/main/presentation/screen/main_screen.dart';
import 'package:asroo_store/features/customer/product_details/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const login = 'login';
  static const signUp = 'signUp';
  static const homeAdmin = 'homeAdmin';
  static const mainCustomerScreen = 'mainScreen';
  static const webView = 'webView';
  static const productDetails = 'productDetails';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case signUp:
        return BaseRoutes(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<UploadImageCubit>()),
              BlocProvider(create: (context) => sl<AuthBloc>()),
            ],
            child: const SignUpScreen(),
          ),
        );
      case homeAdmin:
        return BaseRoutes(page: const HomeAdminScreen());
      case mainCustomerScreen:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<MainCubit>(),
            child: const MainScreen(),
          ),
        );
      case webView:
        return BaseRoutes(page: CustomWebView(url: args! as String));
      case productDetails:
        return BaseRoutes(page: ProductDetailsScreen(productId: args! as int));
      default:
        return BaseRoutes(page: const PageUnderBuildScreen());
    }
  }
}
