import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/page/Auth/selectAuthMethod.dart';
import 'package:flutter_twitter_clone/page/Auth/verifyEmail.dart';
import 'package:flutter_twitter_clone/page/common/splash.dart';
import 'package:flutter_twitter_clone/page/feed/composeTweet/createFeed.dart';
import 'package:flutter_twitter_clone/page/feed/feedPostDetail.dart';
import 'package:flutter_twitter_clone/page/settings/accountSettings/about/aboutTwitter.dart';
import 'package:flutter_twitter_clone/page/settings/accountSettings/accessibility/accessibility.dart';
import 'package:flutter_twitter_clone/page/settings/accountSettings/accountSettingsPage.dart';
import 'package:flutter_twitter_clone/page/settings/accountSettings/displaySettings/displayAndSoundPage.dart';
import 'package:flutter_twitter_clone/page/settings/settingsAndPrivacyPage.dart';
import '../page/Auth/signin.dart';
import '../helper/customRoute.dart';
import '../page/Auth/forgetPasswordPage.dart';
import '../page/Auth/signup.dart';
import '../page/profile/EditProfilePage.dart';
import '../page/profile/profilePage.dart';
import '../widgets/customWidgets.dart';

class Routes{
  static dynamic route(){
      return {
          '/': (BuildContext context) =>   SplashPage(),
      };
  }

  static void sendNavigationEventToFirebase(String path) {
    if(path != null && path.isNotEmpty){
      // analytics.setCurrentScreen(screenName: path);
    }
  }

  static Route onGenerateRoute(RouteSettings settings) {
     final List<String> pathElements = settings.name.split('/');
     if (pathElements[0] != '' || pathElements.length == 1) {
       return null;
     }
     switch (pathElements[1]) {
    case "FeedPostDetail":
        var postId = pathElements[2];
          return SlideLeftRoute<bool>(builder:(BuildContext context)=> FeedPostDetail(postId: postId,),settings: RouteSettings(name:'FeedPostDetail'));
        case "ProfilePage":
         String profileId;
         if(pathElements.length > 2){
             profileId = pathElements[2];
         }
        return CustomRoute<bool>(builder:(BuildContext context)=> ProfilePage(
          profileId: profileId,
        ));
      case "WelcomePage":return CustomRoute<bool>(builder:(BuildContext context)=> WelcomePage()); 
      case "SignIn":return CustomRoute<bool>(builder:(BuildContext context)=> SignIn()); 
      case "SignUp":return CustomRoute<bool>(builder:(BuildContext context)=> Signup()); 
      case "ForgetPasswordPage":return CustomRoute<bool>(builder:(BuildContext context)=> ForgetPasswordPage());
      case "CreateFeedPage":return CustomRoute<bool>(builder:(BuildContext context)=> CreateFeedPage(),);
      case "EditProfile":return CustomRoute<bool>(builder:(BuildContext context)=> EditProfilePage());
      case "SettingsAndPrivacyPage":return CustomRoute<bool>(builder:(BuildContext context)=> SettingsAndPrivacyPage(),); 
      case "AccountSettingsPage":return CustomRoute<bool>(builder:(BuildContext context)=> AccountSettingsPage(),); 
      case "AccountSettingsPage":return CustomRoute<bool>(builder:(BuildContext context)=> AccountSettingsPage(),);
      case "DisplayAndSoundPage":return CustomRoute<bool>(builder:(BuildContext context)=> DisplayAndSoundPage(),);
      case "AccessibilityPage":return CustomRoute<bool>(builder:(BuildContext context)=> AccessibilityPage(),);
      case "AboutPage":return CustomRoute<bool>(builder:(BuildContext context)=> AboutPage(),);
      case "VerifyEmailPage":return CustomRoute<bool>(builder:(BuildContext context)=> VerifyEmailPage(),); 
      default:return onUnknownRoute(RouteSettings(name: '/Feature'));
     }
  }

   static Route onUnknownRoute(RouteSettings settings){
     return MaterialPageRoute(
          builder: (_) => Scaffold(
                appBar: AppBar(title: customTitleText(settings.name.split('/')[1]),centerTitle: true,),
                body: Center(
                  child: Text('${settings.name.split('/')[1]} Comming soon..'),
                ),
              ),
        );
   }
}