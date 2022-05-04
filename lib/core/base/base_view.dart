import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final T? viewModal;
  final Widget Function(BuildContext context, T value)? onPageBuilder;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key,
      required this.viewModal,
      required this.onPageBuilder,
      this.onModelReady,
      this.onDispose});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  var subscription;
  var internetStatus;
  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult event) {
        setState(() {
          internetStatus = event;
        });
      },
    );
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModal);
  }

  @override
  Widget build(BuildContext context) {
    return internetStatus == ConnectivityResult.none
        ? const Scaffold(
            body: Center(
              child: Text("INTERNETNI ULA!!!!"),
            ),
          )
        : widget.onPageBuilder!(context, widget.viewModal);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
  }
}
