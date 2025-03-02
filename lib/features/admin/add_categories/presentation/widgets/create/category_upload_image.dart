import 'package:asroo_store/core/app/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.imageUploaded),
            );
          },
          removeImage: (removerImage) {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.imageRemoved),
            );
          },
          error: (error) {
            ShowToast.showToastErrorTop(message: error);
          },
        );
      },
      builder: (context, state) {
        final uploadImageCubit = context.read<UploadImageCubit>();

        return state.maybeWhen(
          orElse: () {
            if (uploadImageCubit.getImageUrl.isNotEmpty) {
              return InkWell(
                onTap: () {
                  context.read<UploadImageCubit>().uploadImage();
                },
                child: Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                      image: NetworkImage(uploadImageCubit.getImageUrl),
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            } else {
              return InkWell(
                onTap: () {
                  context.read<UploadImageCubit>().uploadImage();
                },
                child: Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(15.r),
                    // image: const DecorationImage(
                    //   image: NetworkImage(
                    //     'https://plus.unsplash.com/premium_photo-1677587536653-0d02efbb70ee?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cXVyYW58ZW58MHx8MHx8fDA%3D',
                    //   ),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  child: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              );
            }
          },
          loading: () {
            return Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          },
        );
      },
    );
  }
}
