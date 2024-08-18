import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:totalxtest/model/user_model.dart';

class SearchUserService {
  QueryDocumentSnapshot? lastDocs;

  // get search result from firebase
  Future<Either<String, List<UserModel>>> getSearchResults(
      String search) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? ref;
      ref = (lastDocs == null)
          ? await FirebaseFirestore.instance
              .collection("Users")
              .where('search',
                  arrayContains: search.toLowerCase().replaceAll(' ', ''))
              .orderBy('timestamp', descending: true)
              .limit(7) //get initial limited users from firestore
              .get()
          : await FirebaseFirestore.instance
              .collection("Users")
              .where('search',
                  arrayContains: search.toLowerCase().replaceAll(' ', ''))
              .orderBy('timestamp', descending: true)
              .startAfterDocument(lastDocs!)
              .limit(7) //get more users from firestore
              .get();
      if (ref.docs.isEmpty) {
        return left("No User Found");
      } else {
        lastDocs = ref.docs.last;
        return right(ref.docs.map((e) => UserModel.fromMap(e.data())).toList());
      }
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }
}
