import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtonFlat extends ConsumerStatefulWidget {
  AppButtonFlat({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.text,
    required this.onTap,
  });

  final Color bgColor;
  final Color fgColor;
  final String text;
  final void Function() onTap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppButtonFlatState();
}

class _AppButtonFlatState extends ConsumerState<AppButtonFlat> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          60,
        ),
      ),
      onPressed: widget.onTap,
      child: Text(
        widget.text,
        style: GoogleFonts.lato(
          fontSize: 16,
          color: widget.fgColor,
        ),
      ),
    );
  }
}

class AsyncButtonFlat extends ConsumerStatefulWidget {
  const AsyncButtonFlat({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.text,
    required this.onTap,
    required this.AsyncBtnStatesController,
  });

  final Color bgColor;
  final Color fgColor;
  final String text;
  final Future<void> Function() onTap;
  final AsyncBtnStatesController;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AsyncButtonFlatState();
}

class _AsyncButtonFlatState extends ConsumerState<AsyncButtonFlat> {
  @override
  Widget build(BuildContext context) {
    return AsyncElevatedBtn(
      asyncBtnStatesController: widget.AsyncBtnStatesController,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          60,
        ),
      ),
      onPressed: widget.onTap,
      loadingStyle: AsyncBtnStateStyle(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
        ),
        widget: const SizedBox.square(
          dimension: 24,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      successStyle: AsyncBtnStateStyle(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        widget: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [Icon(Icons.check), SizedBox(width: 4), Text('Success!')],
        ),
      ),
      failureStyle: AsyncBtnStateStyle(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        widget: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.error),
            SizedBox(width: 4),
            Text('Something went wrong!'),
          ],
        ),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.lato(
          fontSize: 16,
          color: widget.fgColor,
        ),
      ),
    );
  }
}
