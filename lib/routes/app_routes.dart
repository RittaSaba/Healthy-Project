

abstract class Routes{
  Routes._();
  static const SPLASH=Paths.SPLASH;
  static const LOGIN=Paths.LOGIN;
  static const LOGOUT=Paths.LOGOUT;
  static const Fuls=Paths.FULS;
  static const SIGNUP=Paths.SIGNUP;
  static const WRONG_MESSAGE=Paths.WRONG_MESSAGE;
  static const AUTHENTICATED=Paths.AUTHENTICATED;
  static const SUCCESS=Paths.SUCCESS;

}

abstract class Paths{
  Paths._();
  static const  SPLASH='/splash';
  static const  LOGIN='/login';
  static const  LOGOUT='/logout_screen';
  static const  FULS='/fuls_screen';
  static const  SIGNUP='/sign_up_screen';
  static const  WRONG_MESSAGE='/wrong_message_screen';

  static const  AUTHENTICATED='/authenticated_screen';
  static const  SUCCESS='/success_bottom_sheet';
}