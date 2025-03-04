import 'package:asroo_store/core/common/widgets/admin_app_bar.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/features/admin/add_products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/redactors/add_products_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductsScreens extends StatelessWidget {
  const AddProductsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  sl<GetAllAdminProductsBloc>()..add(
                    const GetAllAdminProductsEvent.fetchAdminAllProducts(
                      isNotLoading: true,
                    ),
                  ),
        ),
        BlocProvider(create: (context) => sl<DeleteProductBloc>()),
      ],
      child: const Scaffold(
        backgroundColor: DarkColors.mainColor,
        appBar: AdminAppBar(
          title: 'Products',
          backgroundColor: DarkColors.mainColor,
          isMain: true,
        ),
        body: AddProductsBody(),
      ),
    );
  }
}
