part of '../checkout.dart';

class CheckoutStep3 extends StatelessWidget {
  const CheckoutStep3({this.onRestart});
  final Function()? onRestart;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      childXs: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 640),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveWidget(
                childXs: Image.asset(
                  'assets/images/card-success.png',
                  width: Get.width * 3 / 4,
                  height: 150,
                  package: 'wellcare_checkout',
                ),
                childSm: Image.asset(
                  'assets/images/card-success.png',
                  width: 300,
                  height: 300,
                  package: 'wellcare_checkout',
                ),
              ),
              Text(
                'Card created',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Ok, got it'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: onRestart,
                  child: Text('Create another card'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
