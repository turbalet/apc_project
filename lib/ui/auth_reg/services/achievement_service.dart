import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AchievementService {

  final firestoreInstance = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  getAchievements() {
    return firestoreInstance.collection("achievements").get().then((value){
      return value.docs;
    });
  }

  getAchievement(String id) {
    return firestoreInstance.collection("achievements").doc(id).get().then((value){
      return value.data();
    });
  }

  getUserAchievements() {
    List achievements = [];
    firestoreInstance.collection("user_achievements").where("userId", isEqualTo: user!.uid).snapshots().listen((res) {
      res.docs.forEach((element) {
        achievements.add(element);
      });
    });

    return achievements;
  }
}