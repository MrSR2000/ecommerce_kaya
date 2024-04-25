import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kaya/core/resources/components/gaps.dart';

class CustomRefresher extends StatefulWidget {
  final ScrollController? scrollController;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoad;
  final bool canPaginate;
  const CustomRefresher({
    super.key,
    this.scrollController,
    this.child,
    this.padding,
    this.onRefresh,
    this.onLoad,
    this.canPaginate = false,
  });

  @override
  State<CustomRefresher> createState() => _CustomRefresherState();
}

class _CustomRefresherState extends State<CustomRefresher> {
  @override
  void initState() {
    super.initState();
    if (widget.scrollController != null && widget.onLoad != null) {
      log("configure controller");

      widget.scrollController!.addListener(_handleScrollController);
    }
  }

  @override
  void dispose() {
    if (widget.scrollController != null) {
      widget.scrollController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return RefreshIndicator.adaptive(
      onRefresh: () async => widget.onRefresh?.call(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height,
          maxHeight: height,
        ),
        child: SingleChildScrollView(
          controller: widget.scrollController,
          padding: widget.padding,
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Column(
            children: [
              widget.child ?? const SizedBox(),
              if (widget.canPaginate) ...[
                gap10,
                const CircularProgressIndicator(),
              ],
              gap10,
            ],
          ),
        ),
      ),
    );
  }

  void _handleScrollController() {
    final scrollPosition = widget.scrollController!.position;

    if (scrollPosition.pixels >= scrollPosition.maxScrollExtent &&
        !scrollPosition.outOfRange &&
        widget.canPaginate) {
      widget.onLoad?.call();
    }
  }
}
