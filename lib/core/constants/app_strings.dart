import 'package:get/get.dart';

class AppStrings {
  static final AppStrings instance = AppStrings._();
  AppStrings._();

  /// Time  =======================================================
  String get now => 'now'.tr;
  String get ago => 'ago'.tr;
  String get seconds => 'seconds'.tr;
  String get minute => 'minute'.tr;
  String get minutes => 'minutes'.tr;
  String get hour => 'hour'.tr;
  String get hours => 'hours'.tr;
  String get day => 'day'.tr;
  String get days => 'days'.tr;
  String get week => 'week'.tr;
  String get weeks => 'weeks'.tr;
  String get month => 'month'.tr;
  String get months => 'months'.tr;
  String get year => 'year'.tr;
  String get years => 'years'.tr;

  /// Default  =======================================================
  String get unexpectedErrorTryAgain => 'unexpectedErrorTryAgain'.tr;
  String get errorBuildScreen => 'errorBuildScreen'.tr;
  String get internetConnectionError => 'internetConnectionError'.tr;
  String get internetConnectionErrorMessage => 'internetConnectionErrorMessage'.tr;
  String get tryAgain => 'tryAgain'.tr;
  String get noAvailableTimes => 'noAvailableTimes'.tr;
  String get success => 'success'.tr;
  String get error => 'error'.tr;
  String get warning => 'warning'.tr;
  String get ok => 'ok'.tr;
  String get noInternetConnection => 'noInternetConnection'.tr;
  String get noInternetConnectionMessage => 'noInternetConnectionMessage'.tr;
  String get updateAvailable => 'updateAvailable'.tr;
  String get updateNow => 'updateNow'.tr;
  String get tapToClose => 'tapToClose'.tr;

  /// Validation  =======================================================
  String get requiredField => 'requiredField'.tr;
  String get invalidEmail => 'invalidEmail'.tr;
  String get noSpacesInEmail => 'noSpacesInEmail'.tr;
  String get invalidPhone => 'invalidPhone'.tr;
  String get enterLongerText => 'enterLongerText'.tr;
  String get enterAge => 'enterAge'.tr;
  String get enterValidNumber => 'enterValidNumber'.tr;
  String get ageRange => 'ageRange'.tr;
  String get passwordsNotMatch => 'passwordsNotMatch'.tr;
  String get textTooLong140 => 'textTooLong140'.tr;
  String get textTooLong90 => 'textTooLong90'.tr;
  String get textTooLong60 => 'textTooLong60'.tr;
  String get version => 'version'.tr;
  String get passwordMustHaveLetter => 'passwordMustHaveLetter'.tr;
  String get passwordMustHaveSymbol => 'passwordMustHaveSymbol'.tr;

  /// Onboarding  =======================================================
  String get next => 'next'.tr;
  String get getStarted => 'getStarted'.tr;
  String get onboardingTitle1 => 'onboardingTitle1'.tr;
  String get onboardingTitle2 => 'onboardingTitle2'.tr;
  String get onboardingTitle3 => 'onboardingTitle3'.tr;
  String get skip => 'skip'.tr;
  String get changeLanguage => 'changeLanguage'.tr;
  String get onboardingDescription1 => 'onboardingDescription1'.tr;
  String get onboardingDescription2 => 'onboardingDescription2'.tr;
  String get onboardingDescription3 => 'onboardingDescription3'.tr;
  String get follow => 'follow'.tr;

  /// BottomNav  =======================================================
  String get home => 'home'.tr;
  String get teachers => 'teachers'.tr;
  String get questions => 'questions'.tr;
  String get sessions => 'sessions'.tr;
  String get profile => 'profile'.tr;

  /// Home  =======================================================
  String get welcomeText => 'welcomeText'.tr;
  String get startSession => 'startSession'.tr;
  String get bookNow => 'bookNow'.tr;
  String get suggestedTeachers => 'suggestedTeachers'.tr;
  String get seeMore => 'seeMore'.tr;
  String get yourDailySchedule => 'yourDailySchedule'.tr;
  String get firstSchedule => 'firstSchedule'.tr;
  String get nextSession => 'nextSession'.tr;
  String get addSchedule => 'addSchedule'.tr;
  String get enterFreeSession => 'enterFreeSession'.tr;


  /// Auth  =======================================================
  String get createNewAccount => 'createNewAccount'.tr;
  String get email => 'email'.tr;
  String get password => 'password'.tr;
  String get confirmPassword => 'confirmPassword'.tr;
  String get passwordConfirmation => 'passwordConfirmation'.tr;
  String get iAgree => 'iAgree'.tr;
  String get termsOfUse => 'termsOfUse'.tr;
  String get and => 'and'.tr;
  String get privacyPolicy => 'privacyPolicy'.tr;
  String get createAccount => 'createAccount'.tr;
  String get or => 'or'.tr;
  String get alreadyHaveAccount => 'alreadyHaveAccount'.tr;
  String get loginNow => 'loginNow'.tr;
  String get login => 'login'.tr;
  String get wrongPassword => 'wrongPassword'.tr;
  String get forgotPassword => 'forgotPassword'.tr;
  String get signIn => 'signIn'.tr;
  String get noAccount => 'noAccount'.tr;
  String get createAccountNow => 'createAccountNow'.tr;
  String get changePassword => 'changePassword'.tr;
  String get newPassword => 'newPassword'.tr;
  String get confirmNewPassword => 'confirmNewPassword'.tr;
  String get confirm => 'confirm'.tr;
  String get codeNotSent => 'codeNotSent'.tr;
  String get resendCode => 'resendCode'.tr;
  String get sentCodeToEmail => 'sentCodeToEmail'.tr;
  String get continueTxt => 'continueTxt'.tr;
  String get onlyNumbersAllowed => 'onlyNumbersAllowed'.tr;
  String get passwordChanged => 'passwordChanged'.tr;
  String get emailConfirmation => 'emailConfirmation'.tr;
  String get emailConfirmed => 'emailConfirmed'.tr;
  String get completeYourData => 'completeYourData'.tr;
  String get enterPreferredName => 'enterPreferredName'.tr;
  String get enterNameHere => 'enterNameHere'.tr;
  String get yourAge => 'yourAge'.tr;
  String get enterAgeHere => 'enterAgeHere'.tr;
  String get yourGender => 'yourGender'.tr;
  String get male => 'male'.tr;
  String get female => 'female'.tr;
  String get general => 'general'.tr;
  String get selectRecitationAndPath => 'selectRecitationAndPath'.tr;
  String get recitation => 'recitation'.tr;
  String get path => 'path'.tr;
  String get emailRegisteredSuccessfully => 'emailRegisteredSuccessfully'.tr;
  String get completeYourInformation => 'completeYourInformation'.tr;
  String get mustAcceptTerms => 'mustAcceptTerms'.tr;
  String get loginAsGuest => 'loginAsGuest'.tr;

  /// Notifications  =======================================================
  String get notifications => 'notifications'.tr;
  String get all => 'all'.tr;
  String get read => 'read'.tr;

  /// Teachers =============================================================
  String get online => "online".tr;
  String get favorites => "favorites".tr;
  String get bookLater => "bookLater".tr;
  String get inSession => "inSession".tr;
  String get onlineNow => "onlineNow".tr;
  String get notAvailable => "notAvailable".tr;
  String get teacherName => "teacherName".tr;
  String get noTeachersAvailable => 'noTeachersAvailable'.tr;

  /// Teacher Profile =====================================================
  String get teacher => "teacher".tr;
  String get teacherProfile => "teacherProfile".tr;
  String get schedule => "schedule".tr;
  String get teacherBio => "teacherBio".tr;
  String get quranReadings => "quranReadings".tr;
  String get permissions => "permissions".tr;
  String get comments => "reviews".tr;
  String get monday => 'monday'.tr;
  String get tuesday => 'tuesday'.tr;
  String get wednesday => 'wednesday'.tr;
  String get thursday => 'thursday'.tr;
  String get friday => 'friday'.tr;
  String get saturday => 'saturday'.tr;
  String get sunday => 'sunday'.tr;
  String get selectDayTime => 'selectDayTime'.tr;
  String get sessionTime => 'sessionTime'.tr;
  String get sessionType => 'sessionType'.tr;
  String get video => 'video'.tr;
  String get audio => 'audio'.tr;
  String get bookSession => 'bookSession'.tr;
  String get completeBooking => 'completeBooking'.tr;
  String get booked => 'booked'.tr;
  String get slotBookedFailed => 'slotBookedFailed'.tr;
  String get slotBookedSuccessfully => 'slotBookedSuccessfully'.tr;

  /// Session =============================================================
  String get sessionStartingSoon => 'sessionStartingSoon'.tr;
  String get pleaseWait => 'pleaseWait'.tr;
  String get saveTeacher => 'saveTeacher'.tr;
  String get rateTeacher => 'rateTeacher'.tr;
  String get writeReview => 'writeReview'.tr;
  String get sendRating => 'sendRating'.tr;

  /// Rating =============================================================
  String get rating => 'rating'.tr;
  String get teacherRating  => 'teacherRating'.tr;
  String get writeYourOpinionAboutTheTeacher  => 'writeYourOpinionAboutTheTeacher'.tr;

  ///Sessions =============================================================
  String get sessionStatus => 'sessionStatus'.tr;
  String get pending => 'pending'.tr;
  String get completed => 'completed'.tr;
  String get finished => 'finished'.tr;
  String get ongoing => 'ongoing'.tr;
  String get cancelled => 'cancelled'.tr;
  String get joinSession => 'joinSession'.tr;
  String get time => 'time'.tr;
  String get groupSession => 'groupSession'.tr;
  String get individualSession => 'individualSession'.tr;
  String get privateSession => 'privateSession'.tr;
  String get hafsAnAsim => 'hafsAnAsim'.tr;
  String get warshAnNafi => 'warshAnNafi'.tr;
  String get qalunAnNafi => 'qalunAnNafi'.tr;
  String get adDuriAnAbiAmr => 'adDuriAnAbiAmr'.tr;
  String get joinOnTime => 'joinOnTime'.tr;
  String get sessionNotStartedYet => 'sessionNotStartedYet'.tr;
  String get pleaseJoinAt => 'pleaseJoinAt'.tr;
  String get addToCalendar => 'addToCalendar'.tr;
  String get done => 'done'.tr;

  ///Session Details =======================================================
  String get sessionDetails => 'sessionDetails'.tr;
  String get allowedAttendance => 'allowedAttendance'.tr;
  String get totalAttendance => 'totalAttendance'.tr;
  String get juz => 'juz'.tr;
  String get ajzaa => 'ajzaa'.tr;
  String get hizb => 'hizb'.tr;
  String get surah => 'surah'.tr;
  String get fromAyah => 'fromAyah'.tr;
  String get toAyah => 'toAyah'.tr;
  String get upcoming => 'upcoming'.tr;
  String get selectSessionTimeFirst => 'selectSessionTimeFirst'.tr;

  ///Add Schedule =========================================================
  String get scheduleTitle => 'scheduleTitle'.tr;
  String get enterScheduleTitle => 'enterScheduleTitle'.tr;
  String get selectStartDate => 'selectStartDate'.tr;
  String get scheduleStartDate => 'scheduleStartDate'.tr;
  String get weekDays => 'weekDays'.tr;
  String get sessionsPerDay => 'sessionsPerDay'.tr;
  String get oneSession => 'oneSession'.tr;
  String get twoSessions => 'twoSessions'.tr;
  String get threeSessions => 'threeSessions'.tr;
  String get preferredTimeForFirstSession => 'preferredTimeForFirstSession'.tr;
  String get nextStep => 'nextStep'.tr;
  String get addTrackToSchedule => 'addTrackToSchedule'.tr;
  String get tilawahCorrection => 'tilawahCorrection'.tr;
  String get selectRequiredAjzaa => 'selectRequiredAjzaa'.tr;
  String get telqeen => 'telqeen'.tr;
  String get review => 'review'.tr;
  String get iqraaIjaza => 'iqraaIjaza'.tr;
  String get hifzAndRevision => 'hifzAndRevision'.tr;
  String get chooseScheduleOrganization => 'chooseScheduleOrganization'.tr;
  String get page => 'page'.tr;
  String get pages => 'pages'.tr;
  String get riwayahType => 'riwayahType'.tr;
  String get type => 'type'.tr;
  String get selectLearningObjectives => 'selectLearningObjectives'.tr;
  String get learningObjective => 'learningObjective'.tr;
  String get tajweedRules => 'tajweedRules'.tr;
  String get hiddenMistakesCorrection => 'hiddenMistakesCorrection'.tr;
  String get clearMistakesCorrection => 'clearMistakesCorrection'.tr;
  String get fromSurah => 'fromSurah'.tr;
  String get toSurah => 'toSurah'.tr;
  String get scheduleDetails => 'scheduleDetails'.tr;
  String get updateSchedule => 'updateSchedule'.tr;
  String get editSchedule => 'editSchedule'.tr;
  String get deleteSchedule => 'deleteSchedule'.tr;
  String get readingTypeLabel => 'readingTypeLabel'.tr;
  String get pagesPerSession => 'pagesPerSession'.tr;
  String get confirmUpdatePlan => 'confirmUpdatePlan'.tr;
  String get planStartDateReset => 'planStartDateReset'.tr;
  String get noKeepIt => 'noKeepIt'.tr;
  String get yesSure => 'yesSure'.tr;
  String get from => 'from'.tr;
  String get to => 'to'.tr;

  ///Profile ===================================================================
  String get editProfile => "editProfile".tr;
  String get active => "active".tr;
  String get noActive => "noActive".tr;
  String get settings => "settings".tr;
  String get mySessions => "mySessions".tr;
  String get trackAndLearningMap => "trackAndLearningMap".tr;
  String get manageSchedules => "manageSchedules".tr;
  String get bundlesAndPaymentMethods => "bundlesAndPaymentMethods".tr;
  String get yourName => "yourName".tr;
  String get saveEditing => "saveEditing".tr;
  String get language => 'language'.tr;
  String get sessionRecording => 'sessionRecording'.tr;
  String get support => 'support'.tr;
  String get aboutUs => 'aboutUs'.tr;
  String get shareApp => 'shareApp'.tr;
  String get deleteAccount => 'deleteAccount'.tr;
  String get confirmDeleteAccount => 'confirmDeleteAccount'.tr;
  String get deleteAccountWarning => 'deleteAccountWarning'.tr;
  String get deleteYes => 'deleteYes'.tr;
  String get deleteNo => 'deleteNo'.tr;
  String get enterNewPassword => 'enterNewPassword'.tr;
  String get subscription => 'subscription'.tr;
  String get learningPath => 'learningPath'.tr;
  String get paymentCards => 'paymentCards'.tr;
  String get paymentHistory => 'paymentHistory'.tr;
  String get volunteerTeacher => 'volunteerTeacher'.tr;
  String get saveChanges => 'saveChanges'.tr;
  String get dailySchedule => 'dailySchedule'.tr;
  String get currentMonthSessions => 'currentMonthSessions'.tr;
  String get primaryCard => 'primaryCard'.tr;
  String get paymentCard => 'paymentCard'.tr;
  String get addPaymentCard => 'addPaymentCard'.tr;
  String get cardHolderName => 'cardHolderName'.tr;
  String get creditCardInfo => 'creditCardInfo'.tr;
  String get arabic => 'arabic'.tr;
  String get english => 'english'.tr;
  String get loginFirst => 'loginFirst'.tr;
  String get loginFirstBody => 'loginFirstBody'.tr;
  String get cancel => 'cancel'.tr;
  String get logout => 'logout'.tr;
  String get logoutBody => 'logoutBody'.tr;
  String get profileUpdatedSuccessfully => 'profileUpdatedSuccessfully'.tr;
  String get enterYourPasswordForDeleteAccount => 'enterYourPasswordForDeleteAccount'.tr;


  ///Countries =================================================================
  String get egypt => 'egypt'.tr;
  String get saudiArabia => 'saudiArabia'.tr;
  String get unitedArabEmirates => 'unitedArabEmirates'.tr;
  String get qatar => 'qatar'.tr;
  String get kuwait => 'kuwait'.tr;
  String get jordan => 'jordan'.tr;
  String get unitedStates => 'unitedStates'.tr;
  String get unitedKingdom => 'unitedKingdom'.tr;
  String get france => 'france'.tr;
  String get germany => 'germany'.tr;
  String get turkey => 'turkey'.tr;
  String get india => 'india'.tr;


  ///Support ===================================================================
  String get phone => 'phone'.tr;
  String get leaveYourPhoneNumber => 'leaveYourPhoneNumber'.tr;
  String get message => 'message'.tr;
  String get writeYourMessage => 'writeYourMessage'.tr;
  String get send => 'send'.tr;
  String get whatsAppNotInstalled => 'whatsAppNotInstalled'.tr;
  String get noEmailAppFound => 'noEmailAppFound'.tr;
  String get whatsApp => 'whatsApp'.tr;
  String get gmail => 'gmail'.tr;

  ///Change Password ===========================================================
  String get oldPassword => 'oldPassword'.tr;
  String get enterOldPassword => 'enterOldPassword'.tr;
  String get passwordUpdatedSuccessfully => 'passwordUpdatedSuccessfully'.tr;

  ///Plans =====================================================================
  String get plans => 'plans'.tr;
  String get validity => 'validity'.tr;
  String get free => 'free'.tr;
  String get inputPaymentInfo => 'inputPaymentInfo'.tr;
  String get noPlansFound => 'noPlansFound'.tr;
  String get selectedPlanDetails => 'selectedPlanDetails'.tr;
  String get gifts => 'gifts'.tr;
  String get useNow => 'useNow'.tr;
  String get notCompletedYet => 'notCompletedYet'.tr;

  ///Ranking ===================================================================
  String get ranking => 'ranking'.tr;
  String get rankingMessage => 'rankingMessage'.tr;
  String get continue_ => 'continue'.tr;
  String get noRankingUsers => 'noRankingUsers'.tr;

  ///Recorded Sessions
  String get noSessionsYet => 'noSessionsYet'.tr;
  String get videoLoadFailed => 'videoLoadFailed'.tr;

  ///About Us ==================================================================
  String get aboutPlatform => 'aboutPlatform'.tr;

  ///Quran Completion Dua ======================================================
  String get quranCompletionDua => 'quranCompletionDua'.tr;
  String get quranCompletionDuaText => 'quranCompletionDuaText'.tr;
  String get chooseOptions => 'chooseOptions'.tr;
}
