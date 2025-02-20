import 'package:asroo_store/core/app/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ShowToast.showToastSuccessTop(
                message: context.translate(LangKeys.imageUploaded),
                seconds: 2,
              );
            },
            removeImage: (imageUrl) {
              ShowToast.showToastErrorTop(
                message: context.translate(LangKeys.imageRemoved),
                seconds: 2,
              );
            },
            error: (errorMessage) {
              ShowToast.showToastErrorTop(message: errorMessage);
            },
          );
        },
        builder: (context, state) {
          final isImageUploaded =
              context.read<UploadImageCubit>().getImageUrl.isNotEmpty;
          return state.maybeWhen(
            loading: () {
              return CircleAvatar(
                radius: 38.r,
                backgroundImage: const AssetImage(AppImages.userAvatar),
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.color.mainColor,
                  ),
                ),
              );
            },
            orElse: () {
              return CircleAvatar(
                radius: 38.r,
                backgroundImage:
                    isImageUploaded
                        ? NetworkImage(
                              context.read<UploadImageCubit>().getImageUrl,
                            )
                            as ImageProvider
                        : const AssetImage(AppImages.userAvatar),
                backgroundColor: Colors.grey.withValues(alpha: 0.1),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    //remove Image
                    if (isImageUploaded)
                      Positioned(
                        top: -10.h,
                        right: -18.w,
                        child: IconButton(
                          onPressed: () {
                            context.read<UploadImageCubit>().removeImage();
                          },
                          icon: const Icon(
                            Icons.delete_outlined,
                            color: Colors.red,
                          ),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isImageUploaded
                                ? Colors.transparent
                                : Colors.black.withValues(alpha: 0.4),
                      ),
                    ),

                    //take Image
                    if (isImageUploaded)
                      const SizedBox.shrink()
                    else
                      IconButton(
                        onPressed: () {
                          context.read<UploadImageCubit>().uploadImage();
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
