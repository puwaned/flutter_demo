import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:lpt_client/routers/route-path.dart';
import 'package:lpt_client/services/dio/dio-service.dart';
import 'package:lpt_client/widgets/builder/screen-container.dart';

class LoginScreen extends StatelessWidget {
  final dioService = Get.find<DioService>(tag: 'dio');

  LoginScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  _login() async {
    var validate = _formKey.currentState?.saveAndValidate() ?? false;
    if (validate) {
      var data = _formKey.currentState?.value ?? {};
      var res = await dioService.login(data);
      if (res.success) {
        return Get.offAllNamed(RoutePath.home);
      }
      Get.snackbar('error', res.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenContainer(
          screen: FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      child: FormBuilderTextField(
                        name: 'username',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            border: InputBorder.none,
                            hintText: 'username'.tr),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: FormBuilderTextField(
                        name: 'password',
                        validator: FormBuilderValidators.required(),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            border: InputBorder.none,
                            hintText: 'password'.tr),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _login,
                      style: ButtonStyle(
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                      ),
                      child: Text('login'.tr),
                    )
                  ],
                ),
              ))),
    );
  }
}
