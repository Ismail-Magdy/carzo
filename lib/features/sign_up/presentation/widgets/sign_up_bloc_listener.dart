import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/widgets/custom_alert_dialog.dart';
import 'package:carzo/core/widgets/loading_indicator.dart';
import 'package:carzo/features/sign_up/manager/sign_up_cubit.dart';
import 'package:carzo/features/sign_up/manager/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (loginResponse) {
            context.pop();
            showSuccessDialog(context);
          },
          failure: (error) => _showErrorDialog(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogColor: Colors.redAccent,
        dialogHeader: "Signup Failed",
        dialogBody: error,
        dialogIcon: Icons.error,
        onPressed: () => context.pop(),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.primaryColor.withValues(alpha: 0.3),
      builder: (context) => const Center(child: LoadingIndicator()),
    );
  }

  void showSuccessDialog(BuildContext context) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogColor: AppColors.primaryColor,
        dialogHeader: "Signup Successful",
        dialogBody: "Congratulations, you have signed up successfully!",
        dialogIcon: Icons.check_circle_rounded,
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
