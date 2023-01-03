import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc_template/data/model/user_model.dart';
import 'package:flutter_bloc_template/data/repository/user_repository.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String> getUser() async {
    return _firebaseAuth.currentUser!.displayName!;
  }

  Future<String?> getUserToken() async {
    return await _firebaseAuth.currentUser?.getIdToken();
  }

  Future<String> getUserFid() async {
    return await _firebaseAuth.currentUser!.uid;
  }

  Future<void> deleteUserAccount() async {
    String provider = _firebaseAuth.currentUser?.providerData[0].providerId ?? '';

    if (provider == "google.com")
      _googleSignIn.signIn().then(
          (value) => _firebaseAuth.currentUser?.delete().then((value) => signOut()));
  }

  createUserIfNotExist() async {
    final UserRepository userRepository = new UserRepository();
    String fid = await getUserFid();
    userRepository.getUserData(fid).catchError((e) {
      return UserModel();
    }).then((userModel) {
      if (userModel == "" || userModel.id == null || userModel.id == "") {
      }
    });
  }

  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
}
