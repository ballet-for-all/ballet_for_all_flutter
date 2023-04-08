import 'package:flutter/material.dart';

class AgreeTermsView extends StatelessWidget {
  const AgreeTermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('AgreeTermsView'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: const [
                SizedBox(height: 28),
                Text('약관 동의'),
                SizedBox(height: 16),
                Text('모두의 발레 서비스 제공을 위해 이용약관에 동의해주세요.'),
              ],
            ),
          ],
        ),
      );
}
