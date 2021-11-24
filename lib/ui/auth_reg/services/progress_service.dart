import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProgressService {

  static final firestoreInstance = FirebaseFirestore.instance;
  static final user = FirebaseAuth.instance.currentUser;


  static getProgress() async{
    var document = await FirebaseFirestore.instance.collection('progresses').doc(user!.uid);
    document.get().then((d) {
      print(d.data());
    });
  }

  static setProgress(String unit, int earnedScore) {
    var progress = getProgress();
    int score = progress['score'] + earnedScore;
    firestoreInstance
        .collection("progresses")
        .doc(user!.uid)
        .update({"score": score, "unit": unit}).then((_) {
      print("success!");
    });
  }

  createProgress() {
    firestoreInstance.collection("progresses").doc(user!.uid).set(
        {
          "unit": "1.1",
          "score": 0
          }
        ).then((_){
      print("success!");
    });
  }

}