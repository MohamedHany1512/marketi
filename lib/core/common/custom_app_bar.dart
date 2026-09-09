
  import 'package:flutter/material.dart';
import 'package:marketi/core/themes/app_theme.dart';

PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: AppTheme.lightTheme.appBarTheme.backgroundColor,
      foregroundColor: AppTheme.lightTheme.appBarTheme.foregroundColor,
      elevation: 0,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/Logo_Splash_Screen.png'),
          ),
          const SizedBox(width: 8),
          const Text('Hi Youssef !'),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }