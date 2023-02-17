import "package:firebase_auth/firebase_auth.dart";

class Auth {
  //creating a firebase auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //The "?" in front of "User" means that it's a nullable type, meaning the type can be either an instance of the class or the value "null". This allows the developer to handle the case where the current user object is not available, e.g. when no user is currently signed in to the Firebase authentication instance. The "?" symbol is part of Dart's syntax for null safety, which helps prevent null reference errors in the code.
  //getting the current user
  User? get currentUser => _firebaseAuth.currentUser;

  //For automatic login. We can have a stream to see when the user is logged in or logged out
  Stream<User?> get authStateChanged => _firebaseAuth.authStateChanges();

  //loggin in
  Future<void> signInWithUsernameandPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //Signing up
  Future<void> createUserwithEmailandPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //Signing out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
