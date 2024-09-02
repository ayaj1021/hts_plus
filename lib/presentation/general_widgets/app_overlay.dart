import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/type_defs.dart';
import 'package:hts_plus/presentation/general_widgets/app_loader.dart';

class AppOverLay extends StatefulWidget {
  const AppOverLay({
    required this.child,
    required this.controller,
    super.key,
    this.messagePadding,
  });
  final Widget child;
  final OverLayController controller;
  final EdgeInsetsGeometry? messagePadding;

  @override
  State<AppOverLay> createState() => AppOverLayState();

  static AppOverLayState of(BuildContext context) {
    final result = context.findAncestorStateOfType<AppOverLayState>();
    if (result != null) return result;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        '''AppOverLay.of() called with a context that does not contain a AppOverLay.''',
      ),
      ErrorDescription(
        '''No AppOverLay ancestor could be found starting from the context that was passed to AppOverLay.of(). '''
        '''This usually happens when the context provided is from the same StatefulWidget as that '''
        '''whose build function actually creates the AppOverLay widget being sought.''',
      ),
      context.describeElement('The context used was'),
    ]);
  }
}

class AppOverLayState extends State<AppOverLay> {
  OverLayController get controller => widget.controller;
  double scale = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        widget.child,
        ValueListenableBuilder<
            ({OverLayType type, MessageText? msg, Color? color})>(
          valueListenable: widget.controller._valueNotifier,
          builder: (context, listen, child) {
            if (listen.type == OverLayType.loader) {
              return Positioned.fill(
                child: Material(
                  color: Colors.black.withOpacity(.5),
                  child: AppLoader(
                    color: listen.color ?? Colors.white,
                  ),
                ),
              );
            } else if (listen.type == OverLayType.message) {
              return SafeArea(
                child: Container(
                  padding: widget.messagePadding ?? const EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: -40, end: 0),
                    curve: Curves.easeInOut,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, value),
                        child: _messageWidget(
                          messageIcon:
                              listen.msg?.messageType == MessageType.error
                                  ? 'assets/icons/error.svg'
                                  : 'assets/icons/success.svg',
                          messageText: listen.msg,
                          messageColor:
                              listen.msg?.messageType == MessageType.error
                                  ? AppColors.primaryColor
                                  : AppColors.green,
                          onClose: () {
                            controller.removeOverLay();
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _messageWidget({
    required MessageText? messageText,
    required String messageIcon,
    required Color messageColor,
    required VoidCallback onClose,
  }) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: messageText?.messageType == MessageType.error
              ? AppColors.red
              : AppColors.green,
        ),
      ),
      color: messageText?.messageType == MessageType.error
          ? const Color(0XFFFFF2F2)
          : const Color(0XFFDCF3EB),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 63,
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              messageIcon,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (messageText?.title != null)
                    Text(
                      messageText!.title,
                      style: Theme.of(context).textTheme.s12w700.copyWith(
                            color: messageColor,
                          ),
                      textDirection: TextDirection.ltr,
                    ),
                  Text(
                    messageText?.message ?? '',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.s12w400.copyWith(
                          color: messageColor,
                        ),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverLayController {
  final ValueNotifier<({OverLayType type, MessageText? msg, Color? color})>
      _valueNotifier =
      ValueNotifier((type: OverLayType.none, msg: null, color: null));

  void showLoader({Color? color}) {
    _valueNotifier.value = (type: OverLayType.loader, msg: null, color: color);
  }

  void showError({required String message, String? title}) {
    _valueNotifier.value = (
      type: OverLayType.message,
      msg: (
        message: message,
        title: title ?? 'Error',
        messageType: MessageType.error
      ),
      color: AppColors.red,
    );
    Future.delayed(const Duration(seconds: 3), removeOverLay);
  }

  void showSuccess({required String message, String? title}) {
    _valueNotifier.value = (
      type: OverLayType.message,
      msg: (
        message: message,
        title: title ?? 'Success',
        messageType: MessageType.error
      ),
      color: AppColors.green,
    );
    Future.delayed(const Duration(seconds: 3), removeOverLay);
  }

  void removeOverLay() {
    _valueNotifier.value = (type: OverLayType.none, msg: null, color: null);
  }

  void dispose() => _valueNotifier.dispose();
}
