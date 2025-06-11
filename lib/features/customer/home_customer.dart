import 'package:asroo_store/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:flutter/material.dart';

class HomeCustomer extends StatelessWidget {
  const HomeCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Customer',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: FirebaseCloudMessaging().isNotificationSubscribed,
          builder: (_, value, __) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value ? 'Subscribe' : 'Unsubscribe',
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
                const SizedBox(width: 10),
                Transform.scale(
                  scale: 1.4,
                  child: Switch.adaptive(value: value,
                  inactiveTrackColor: const Color(0xff262626),
                  activeColor: Colors.green,
                  onChanged: (value) async {
                    await FirebaseCloudMessaging().controllerForUserSubscribe();
                  },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
