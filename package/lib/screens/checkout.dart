import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/responsive.dart';

part 'steps/step1.dart';
part 'steps/step2.dart';
part 'steps/step3.dart';
part 'steps/step4.dart';
part 'steps/step5.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: CheckoutController(),
      builder: (CheckoutController controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: const TextStyle(color: Colors.black),
            title: Obx(() {
              return Column(
                children: <Widget>[
                  Text(controller.title),
                  Text('Step ${controller.step}/5'),
                ],
              );
            }),
          ),
          body: Column(
            children: <Widget>[
              Obx(() =>
                  LinearProgressIndicator(value: (controller.step + 1) / 5)),
              Expanded(
                child: Obx(() {
                  switch (controller.step) {
                    case 0:
                      return CheckoutStep1();
                    case 1:
                      return CheckoutStep2();
                    case 2:
                      return CheckoutStep3();
                    case 3:
                      return CheckoutStep4();
                    case 4:
                      return CheckoutStep5();
                    default:
                      return const SizedBox();
                  }
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CheckoutController extends GetxController {
  // Reactive vars
  final Rx<int> _step = Rx<int>(0);

  // Getters/setters
  int get step => _step.value;
  set step(int value) => _step.value = value;
  String get title => _stepTitles[step];

  // Static vars
  final List<String> _stepTitles = <String>[
    'Card type',
    'Cardholder',
    'Card permissions',
    'Delivery address',
    'Success',
  ];
}
