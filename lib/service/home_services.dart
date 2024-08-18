import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:totalxtest/constants/sort.dart';
import '../model/user_model.dart';

class HomeServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final firestore = FirebaseFirestore.instance;
  QueryDocumentSnapshot? lastDocs;

  //get users from firebase
  Future<Either<String, List<UserModel>>> getUsers(AgeType ageType) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? ref;
      if (AgeType.all == ageType) {
        ref = (lastDocs == null)
            ? await FirebaseFirestore.instance
                .collection("Users")
                .orderBy('timestamp', descending: true)
                .limit(7) //get initial limited users from firestore
                .get()
            : await FirebaseFirestore.instance
                .collection("Users")
                .orderBy('timestamp', descending: true)
                .startAfterDocument(lastDocs!)
                .limit(7) //get more users from firestore
                .get();
      } else if (AgeType.younger == ageType) {
        ref = (lastDocs == null)
            ? await firestore
                .collection('Users')
                .where('age', isLessThan: 60)
                .orderBy('age', descending: false)
                .limit(7)
                .get()
            : await firestore
                .collection('Users')
                .where('age', isLessThan: 60)
                .orderBy('age', descending: false)
                .startAfterDocument(lastDocs!)
                .limit(7)
                .get();
      } else {
        ref = (lastDocs == null)
            ? await firestore
                .collection('Users')
                .where('age', isGreaterThanOrEqualTo: 60)
                .orderBy('age', descending: false)
                .limit(7)
                .get()
            : await firestore
                .collection('Users')
                .where('age', isGreaterThanOrEqualTo: 60)
                .orderBy('age', descending: false)
                .startAfterDocument(lastDocs!)
                .limit(7)
                .get();
      }
      if (ref.docs.isEmpty) {
        return left("No More Data");
      } else {
        lastDocs = ref.docs.last;
        return right(ref.docs.map((e) => UserModel.fromMap(e.data())).toList());
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
