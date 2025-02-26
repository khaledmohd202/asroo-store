import 'package:asroo_store/core/common/widgets/admin_app_bar.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/core/utils/admin_drawer_list.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  Widget page = const DashboardScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuAdminScreen(
            onPageChanged: (pageIndex) {
              setState(() {
                page = pageIndex;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24.r,
      showShadow: true,
      drawerShadowsBackgroundColor: DarkColors.mainColor.withValues(alpha: 0.6),
      menuBackgroundColor: DarkColors.blueDark,
    );
  }
}

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({required this.onPageChanged, super.key});
  final void Function(Widget) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.blueDark,
      appBar: const AdminAppBar(
        title: 'Asroo Store',
        isMain: false,
        backgroundColor: DarkColors.blueDark,
      ),
      body: Column(
        children: [
          Column(
            children:
                adminDrawerList(context)
                    .map(
                      (e) => ListTile(
                        onTap: () {
                          onPageChanged(e.page);
                        },
                        title: e.title,
                        leading: e.icon,
                      ),
                    )
                    .toList(),
          ),
          Expanded(child: Image.asset(AppImages.drawerImage)),
        ],
      ),
    );
  }
}
