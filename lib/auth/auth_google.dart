import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// late String name;
// late String email;
// late String imageUrl;

// Future<String?> signInWithGoogle() async {
//   await Firebase.initializeApp();

//   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication? googleSignInAuthentication =
//       await googleSignInAccount?.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleSignInAuthentication?.accessToken,
//     idToken: googleSignInAuthentication?.idToken,
//   );

//   final UserCredential authResult =
//       await _auth.signInWithCredential(credential);
//   final User? user = authResult.user;

//   if (user != null) {
//     // Checking if email and name is null
//     assert(user.email != null);
//     assert(user.displayName != null);
//     assert(user.photoURL != null);

//     name = user.displayName!;
//     email = user.email!;
//     imageUrl = user.photoURL!;

//     // Only taking the first part of the name, i.e., First Name
//     if (name.contains(" ")) {
//       name = name.substring(0, name.indexOf(" "));
//     }

//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);

//     final User currentUser = _auth.currentUser!;
//     assert(user.uid == currentUser.uid);

//     print('signInWithGoogle succeeded: $user');

//     return '$user';
//   }

//   return null;
// }

// Future<void> signOutGoogle() async {
//   await googleSignIn.signOut();

//   print("User Signed Out");
// }
