import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/core/constants/app_images.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/model/user_model.dart';
import 'package:events/providers/user_provider.dart';
import 'package:events/screens/home_screen/home_screen.dart';
import 'package:events/screens/widgets/firebase_servises.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleButton extends StatelessWidget {
  String text;
  GoogleButton({required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onGoogleButtonPressed(context);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: AppColors.lightInputField,
        padding: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Image.asset(AppImages.google, height: 24, width: 24, fit: .scaleDown),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(fontWeight: .w500, fontSize: 20.sp),
          ),
        ],
      ),
    );
  }

  void onGoogleButtonPressed(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
      serverClientId:
          '122228660273-g9ro7gfuvvbir0c41u4n5uovcqllomfn.apps.googleusercontent.com',
    );
    GoogleSignInAccount googleSignInAccount = await googleSignIn.authenticate();
    OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAccount.authentication.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    UserModel user = UserModel(
      name: googleSignInAccount.displayName ?? 'user',
      email: googleSignInAccount.email,
      id: userCredential.user!.uid,
      favEventsId: [],
    );

    if (userCredential.additionalUserInfo!.isNewUser) {
      CollectionReference<UserModel> collection =
          FirebaseServices.getUsersCollection();
      DocumentReference<UserModel> doc = collection.doc(
        userCredential.user!.uid,
      );
      doc.set(user);
      Provider.of<UserProvider>(context, listen: false).updateUser(user);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else {
      CollectionReference<UserModel> collection =
          FirebaseServices.getUsersCollection();
      DocumentReference<UserModel> doc = collection.doc(
        userCredential.user!.uid,
      );
      DocumentSnapshot<UserModel> userSnapShot = await doc.get();
      UserModel user = userSnapShot.data()!;
      Provider.of<UserProvider>(context, listen: false).updateUser(user);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }
}
