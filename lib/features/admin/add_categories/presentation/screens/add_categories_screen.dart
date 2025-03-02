import 'package:asroo_store/core/common/widgets/admin_app_bar.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/refactors/add_categories_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  sl<GetAllAdminCategoriesBloc>()..add(
                    const GetAllAdminCategoriesEvent.fetchAdminAllCategories(
                      isNotLoading: true,
                    ),
                  ),
        ),
      ],
      child: Scaffold(
        backgroundColor: DarkColors.mainColor,
        appBar: AdminAppBar(
          title: 'Categories',
          backgroundColor: DarkColors.mainColor,
          isMain: true,
        ),
        body: AddCategoriesBody(),
      ),
    );
  }
}
