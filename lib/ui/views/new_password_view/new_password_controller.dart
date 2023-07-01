import 'package:flutter/material.dart';
import '../../../core/services/base_controller.dart';

class NewPasswordController extends BaseController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
}
