import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:workmanager/workmanager.dart';

abstract class WorkManagerService {
  static Future<void> initWorkManager() async {
    await Workmanager().initialize(actionTask, isInDebugMode: false);
    await registerMyTask();
  }

  static Future<void> registerMyTask() async {
    await Workmanager().registerPeriodicTask('uniqueName', 'taskName',
        frequency: const Duration(days: 1));
  }
}

@pragma('vm:entry-point')
void actionTask() {
  StoryCubit storyCubit = StoryCubit();
  Workmanager().executeTask((taskName, inputData) async {
    await Firebase.initializeApp().then((_) async {
      await storyCubit.deleteStory(
          userID: FirebaseAuth.instance.currentUser!.uid);
    });
    return Future.value(true);
  });
}
