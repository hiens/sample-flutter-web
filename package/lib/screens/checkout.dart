import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/responsive.dart';
import '../widgets/responsive.dart';

part 'steps/step1.dart';
part 'steps/step2.dart';
part 'steps/step3.dart';

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
            leading: BackButton(color: Colors.black),
            actions: <IconButton>[
              IconButton(
                icon: Icon(Icons.close),
                color: Colors.black,
                onPressed: () {},
              ),
            ],
            title: Obx(() {
              return Column(
                children: <Widget>[
                  Text(
                    controller.title,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Step ${controller.step + 1}/3',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              );
            }),
          ),
          body: Column(
            children: <Widget>[
              Obx(() =>
                  LinearProgressIndicator(value: (controller.step + 1) / 3)),
              Expanded(
                child: Obx(() {
                  switch (controller.step) {
                    case 0:
                      return CheckoutStep1(
                        onSelected: controller.nextStep,
                      );
                    case 1:
                      return CheckoutStep2(
                        onSelected: controller.nextStep,
                      );
                    case 2:
                      return CheckoutStep3(
                        onRestart: controller.nextStep,
                      );
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

  /// Go to next step
  Future<void> nextStep() async {
    step = step < 2 ? step + 1 : 0;
  }
}
