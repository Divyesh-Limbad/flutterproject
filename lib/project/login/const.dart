const String NAME = 'Name';
const String AGE = 'Age';
const String EMAIL = 'Email';
const String PHONE = 'Phone';
const String CITY = 'City';
const String LOGIN_TEXT = 'LOGIN';
const String REGISTER_TEXT = 'REGISTER';
const String PREF_NAME = 'Name';
const String PREF_IS_WIDGET_SELECTED = 'isWidgetSelected';
const String IS_USER_LOGIN = 'isUserLogin';

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printResultText(String text) {
  print('\x1B[31m$text\x1B[0m');
}
