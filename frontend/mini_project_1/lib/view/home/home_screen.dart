import 'package:flutter/material.dart';
import 'package:mini_project_1/utils/flushbar/flush_bar_utils.dart';
import 'package:mini_project_1/utils/toast/toast_utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                ToastUtils.showToast(
                  message: 'Operation Successful!',
                  toastType: ToastType.success,
                );
              },
              child: Text('Show Success Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                ToastUtils.showToast(
                  message: 'An error occurred!',
                  toastType: ToastType.error,
                );
              },
              child: Text('Show Error Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                ToastUtils.showToast(
                  message: 'Warning: Check this out!',
                  toastType: ToastType.warning,
                );
              },
              child: Text('Show Warning Toast'),
            ),
            
            ElevatedButton(
              onPressed: () {
                ToastUtils.showToast(
                  message: 'Here is some information.',
                  toastType: ToastType.info,
                );
              },
              child: Text('Show Info Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                FlushBarUtils.showFlushBar(
                  context: context,
                  message: 'Operation Successful!',
                  flushBarType: FlushBarType.info,
                );
              },
              child: Text('Show Success FlushBar'),
            ),
            ElevatedButton(
              onPressed: () {
             FlushBarUtils.showFlushBar(
  context: context,
  message: 'Login failed. Please check your credentials.',
  flushBarType: FlushBarType.error,
  animationType: AnimationType.slideInOut,
);

              },
              child: Text('Show Error FlushBar'),
            ),
          ],
        ),
      ),
    );
  }
}
