import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/auth/model/logged_in_user.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/widgets/widgets.dart';

extension BuildContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get sizeOfWidth => MediaQuery.sizeOf(this).width;
  double get sizeOfHeight => MediaQuery.sizeOf(this).height;

  void exit<T>([T? data]) => Navigator.of(this, rootNavigator: true).pop(data);

  void close<T>([T? data]) => Navigator.of(this, rootNavigator: false).pop(data);

  T cubit<T extends Cubit<Object>>() => BlocProvider.of<T>(this);

  LoggedInUser get user => $sl.get<LoggedInUser>();
  
  String get fboId => $sl.get<String>(instanceName: 'fbo_id');

  String get  getCurrPath => GoRouterState.of(this).uri.path;

  Future<T?> goToPage<T>(Widget child) => Navigator.of(this).push<T?>(
    MaterialPageRoute(builder: (_) => child),
  );

  void showSnackbar(String content, AppSnackBarType type) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: AppSnackBarWidget(content: content, type: type),
      ),
    );
  }

  DateTime get activeDay => read<DateFilterCubit>().state.activeDay;
}


extension NetworkRequestStateExtension<T> on NetworkRequestState<T> {
  
  void onSuccess(void Function(T data) callback) {
    maybeWhen(
      orElse: () {},
      success: callback,
    );
  }

  bool get isSuccess => maybeWhen(orElse: () => false, success: (_) => true);
  bool get isLoading => maybeWhen(orElse: () => false, loading: () => true);
  bool get isFailure => maybeWhen(orElse: () => false, failure: (f) => true);

  void handle(BuildContext context, {required void Function(T data) success}) {
    maybeWhen(
      orElse: () {},
      success: success,
      failure: (f) => AppDialog.showErrorDialog(
        context, 
        content: f.error, 
        onTapDismiss: context.exit, 
        title: 'OOPS', 
        barrierDismissible: false,
      ),
    );
  }

  Widget build({required Widget Function(T data) success}) {
    return when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: LoadingIndicator()),
      success: success,
      failure: (f) => AppFailureWidget(message: f.error),
    );
  }
}
