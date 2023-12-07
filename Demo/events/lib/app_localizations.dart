import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fa'),
    Locale('hi')
  ];

  /// The conventional greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @flutterap.
  ///
  /// In en, this message translates to:
  /// **'Flutterap'**
  String get flutterap;

  /// No description provided for @lorem.
  ///
  /// In en, this message translates to:
  /// **'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'**
  String get lorem;

  /// No description provided for @loremmid.
  ///
  /// In en, this message translates to:
  /// **'Lorem Ipsum is simply dummy text'**
  String get loremmid;

  /// No description provided for @loremshort.
  ///
  /// In en, this message translates to:
  /// **'Lorem Ipsum is simply'**
  String get loremshort;

  /// No description provided for @primary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get primary;

  /// No description provided for @secondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get secondary;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @confidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get confidence;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @fullname.
  ///
  /// In en, this message translates to:
  /// **'Jack Shephard'**
  String get fullname;

  /// No description provided for @adminEmail.
  ///
  /// In en, this message translates to:
  /// **'example@gmail.com'**
  String get adminEmail;

  /// No description provided for @adminMenu.
  ///
  /// In en, this message translates to:
  /// **'Admin Menu'**
  String get adminMenu;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @dashboardtitle.
  ///
  /// In en, this message translates to:
  /// **'Different model of dashboard cards are available in panel by flutter code.'**
  String get dashboardtitle;

  /// No description provided for @charts.
  ///
  /// In en, this message translates to:
  /// **'Charts'**
  String get charts;

  /// No description provided for @barChart.
  ///
  /// In en, this message translates to:
  /// **'Bar chart'**
  String get barChart;

  /// No description provided for @circularChart.
  ///
  /// In en, this message translates to:
  /// **'Circular chart'**
  String get circularChart;

  /// No description provided for @linearChart.
  ///
  /// In en, this message translates to:
  /// **'Linear chart'**
  String get linearChart;

  /// No description provided for @radarChart.
  ///
  /// In en, this message translates to:
  /// **'Radar chart'**
  String get radarChart;

  /// No description provided for @scatterChart.
  ///
  /// In en, this message translates to:
  /// **'Scatter chart'**
  String get scatterChart;

  /// No description provided for @charttitle.
  ///
  /// In en, this message translates to:
  /// **'Different model of charts are available in panel by flutter code.'**
  String get charttitle;

  /// No description provided for @accordion.
  ///
  /// In en, this message translates to:
  /// **'Accordion'**
  String get accordion;

  /// No description provided for @simpleaccordion.
  ///
  /// In en, this message translates to:
  /// **'Simple accordion'**
  String get simpleaccordion;

  /// No description provided for @scrollableaccordion.
  ///
  /// In en, this message translates to:
  /// **'Scrollable accordion'**
  String get scrollableaccordion;

  /// No description provided for @removableaccordion.
  ///
  /// In en, this message translates to:
  /// **'Removable accordion'**
  String get removableaccordion;

  /// No description provided for @solidaccordion.
  ///
  /// In en, this message translates to:
  /// **'Solid accordion'**
  String get solidaccordion;

  /// No description provided for @iconaccordion.
  ///
  /// In en, this message translates to:
  /// **'Icon accordion'**
  String get iconaccordion;

  /// No description provided for @accordionwithdesiredarrowicon.
  ///
  /// In en, this message translates to:
  /// **'accordion with desired arrow icon'**
  String get accordionwithdesiredarrowicon;

  /// No description provided for @accordionwithbackgroundimage.
  ///
  /// In en, this message translates to:
  /// **'accordion with background image'**
  String get accordionwithbackgroundimage;

  /// No description provided for @accordiontitle.
  ///
  /// In en, this message translates to:
  /// **'Different model of accordion are available in panel by flutter code.'**
  String get accordiontitle;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get alert;

  /// No description provided for @simplealert.
  ///
  /// In en, this message translates to:
  /// **'Simple alert'**
  String get simplealert;

  /// No description provided for @borderedalert.
  ///
  /// In en, this message translates to:
  /// **'Bordered alert'**
  String get borderedalert;

  /// No description provided for @removablealert.
  ///
  /// In en, this message translates to:
  /// **'Removable alert'**
  String get removablealert;

  /// No description provided for @alertwithicon.
  ///
  /// In en, this message translates to:
  /// **'Alert with icon'**
  String get alertwithicon;

  /// No description provided for @removablealertwithicon.
  ///
  /// In en, this message translates to:
  /// **'Removable alert with icon'**
  String get removablealertwithicon;

  /// No description provided for @alertwithdesiredcontent.
  ///
  /// In en, this message translates to:
  /// **'Alert with desired content'**
  String get alertwithdesiredcontent;

  /// No description provided for @borderedalertwithicon.
  ///
  /// In en, this message translates to:
  /// **'Bordered alert with icon'**
  String get borderedalertwithicon;

  /// No description provided for @alerttitle.
  ///
  /// In en, this message translates to:
  /// **'Different model of alert are available in panel by flutter code,click them !'**
  String get alerttitle;

  /// No description provided for @button.
  ///
  /// In en, this message translates to:
  /// **'Button'**
  String get button;

  /// No description provided for @blocbutton.
  ///
  /// In en, this message translates to:
  /// **'Bloc button'**
  String get blocbutton;

  /// No description provided for @defaultbutton.
  ///
  /// In en, this message translates to:
  /// **'Default button'**
  String get defaultbutton;

  /// No description provided for @borderedbutton.
  ///
  /// In en, this message translates to:
  /// **'Bordered button'**
  String get borderedbutton;

  /// No description provided for @iconbutton.
  ///
  /// In en, this message translates to:
  /// **'Icon button'**
  String get iconbutton;

  /// No description provided for @icontextbutton.
  ///
  /// In en, this message translates to:
  /// **'Icon and text button'**
  String get icontextbutton;

  /// No description provided for @disabledbutton.
  ///
  /// In en, this message translates to:
  /// **'Disabled button'**
  String get disabledbutton;

  /// No description provided for @socialnetworkbutton.
  ///
  /// In en, this message translates to:
  /// **'Social network button'**
  String get socialnetworkbutton;

  /// No description provided for @roundbutton.
  ///
  /// In en, this message translates to:
  /// **'Round button'**
  String get roundbutton;

  /// No description provided for @buttonsindifferntsize.
  ///
  /// In en, this message translates to:
  /// **'Buttons in different size'**
  String get buttonsindifferntsize;

  /// No description provided for @buttontitle.
  ///
  /// In en, this message translates to:
  /// **'Different model of button are available in panel by flutter code.'**
  String get buttontitle;

  /// No description provided for @groupbutton.
  ///
  /// In en, this message translates to:
  /// **'Group button'**
  String get groupbutton;

  /// No description provided for @textgroupbutton.
  ///
  /// In en, this message translates to:
  /// **'Text group button'**
  String get textgroupbutton;

  /// No description provided for @icongroupbutton.
  ///
  /// In en, this message translates to:
  /// **'Icon group button'**
  String get icongroupbutton;

  /// No description provided for @radiogroupbutton.
  ///
  /// In en, this message translates to:
  /// **'radio group button'**
  String get radiogroupbutton;

  /// No description provided for @groupbuttonwithmaxselection.
  ///
  /// In en, this message translates to:
  /// **'Group button with max selections'**
  String get groupbuttonwithmaxselection;

  /// No description provided for @verticalgroupbutton.
  ///
  /// In en, this message translates to:
  /// **'vertical group button'**
  String get verticalgroupbutton;

  /// No description provided for @groupbuttonwithdisabledlist.
  ///
  /// In en, this message translates to:
  /// **'Group button with disabled list'**
  String get groupbuttonwithdisabledlist;

  /// No description provided for @groupbuttontitle.
  ///
  /// In en, this message translates to:
  /// **'Different model of group buttons are available in panel by flutter code, you can set every widget for them'**
  String get groupbuttontitle;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @textindifferentposition.
  ///
  /// In en, this message translates to:
  /// **'Text in different positions'**
  String get textindifferentposition;

  /// No description provided for @textforuseinlist.
  ///
  /// In en, this message translates to:
  /// **'Text for use in lists'**
  String get textforuseinlist;

  /// No description provided for @textindifferentcolors.
  ///
  /// In en, this message translates to:
  /// **'Text in Different Colors'**
  String get textindifferentcolors;

  /// No description provided for @differentmodelsselectabletext.
  ///
  /// In en, this message translates to:
  /// **'Different models of selectable text'**
  String get differentmodelsselectabletext;

  /// No description provided for @textindifferentemphsizestyles.
  ///
  /// In en, this message translates to:
  /// **'Text in different emphasize styles'**
  String get textindifferentemphsizestyles;

  /// No description provided for @textindifferentsizes.
  ///
  /// In en, this message translates to:
  /// **'Text in different sizes'**
  String get textindifferentsizes;

  /// No description provided for @sampleText.
  ///
  /// In en, this message translates to:
  /// **'Wishing is the reason for talent:)'**
  String get sampleText;

  /// No description provided for @ordinaryText.
  ///
  /// In en, this message translates to:
  /// **'Ordinary Text'**
  String get ordinaryText;

  /// No description provided for @titleText.
  ///
  /// In en, this message translates to:
  /// **'Title Text'**
  String get titleText;

  /// No description provided for @labeledtext.
  ///
  /// In en, this message translates to:
  /// **'Labeled Text'**
  String get labeledtext;

  /// No description provided for @dottedText.
  ///
  /// In en, this message translates to:
  /// **'Dotted Text'**
  String get dottedText;

  /// No description provided for @markedText.
  ///
  /// In en, this message translates to:
  /// **'Marked Text'**
  String get markedText;

  /// No description provided for @texttitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of text with various sizes and styles are available in panel by flutter code.'**
  String get texttitle;

  /// No description provided for @label.
  ///
  /// In en, this message translates to:
  /// **'Labels'**
  String get label;

  /// No description provided for @labelondifferentwidgets.
  ///
  /// In en, this message translates to:
  /// **'Label on different widgets'**
  String get labelondifferentwidgets;

  /// No description provided for @labelinsinglemode.
  ///
  /// In en, this message translates to:
  /// **'Label in unique mode'**
  String get labelinsinglemode;

  /// No description provided for @labelwithdifferentcontents.
  ///
  /// In en, this message translates to:
  /// **'Label with different contents'**
  String get labelwithdifferentcontents;

  /// No description provided for @labelwithsepratorborder.
  ///
  /// In en, this message translates to:
  /// **'Label with separator border'**
  String get labelwithsepratorborder;

  /// No description provided for @labelindifferentcolors.
  ///
  /// In en, this message translates to:
  /// **'Label in different colors'**
  String get labelindifferentcolors;

  /// No description provided for @labelindifferentsizesandborderradiuss.
  ///
  /// In en, this message translates to:
  /// **'Label in different sizes and border radii'**
  String get labelindifferentsizesandborderradiuss;

  /// No description provided for @labeltitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of label with various sizes and contents are available in panel by flutter code.'**
  String get labeltitle;

  /// No description provided for @breadcrumb.
  ///
  /// In en, this message translates to:
  /// **'Breadcrumb'**
  String get breadcrumb;

  /// No description provided for @breadcrumbwithsolidstructureindifferentcolors.
  ///
  /// In en, this message translates to:
  /// **'Breadcrumb with solid structure in different colors'**
  String get breadcrumbwithsolidstructureindifferentcolors;

  /// No description provided for @breadcrumbwithsolidstructureindifferentsizes.
  ///
  /// In en, this message translates to:
  /// **'Breadcrumb with solid structure in different sizes'**
  String get breadcrumbwithsolidstructureindifferentsizes;

  /// No description provided for @breadcrumbwithiconseparator.
  ///
  /// In en, this message translates to:
  /// **'Breadcrumb with icon separator'**
  String get breadcrumbwithiconseparator;

  /// No description provided for @navigatebreadcrumb.
  ///
  /// In en, this message translates to:
  /// **'Navigate Breadcrumb'**
  String get navigatebreadcrumb;

  /// No description provided for @breadcrumbwithtypingelementsseparator.
  ///
  /// In en, this message translates to:
  /// **'Breadcrumb with typing elements separator'**
  String get breadcrumbwithtypingelementsseparator;

  /// No description provided for @breadcrumbtitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of breadcrumb styles are available in panel by flutter code, for more information press info button in each card.'**
  String get breadcrumbtitle;

  /// No description provided for @pageindicator.
  ///
  /// In en, this message translates to:
  /// **'Page indicator'**
  String get pageindicator;

  /// No description provided for @simplepageindicator.
  ///
  /// In en, this message translates to:
  /// **'Simple page indicator in different styles'**
  String get simplepageindicator;

  /// No description provided for @simplepageindicatorwithbutton.
  ///
  /// In en, this message translates to:
  /// **'Simple page indicator with button in different styles'**
  String get simplepageindicatorwithbutton;

  /// No description provided for @numberpageindicator.
  ///
  /// In en, this message translates to:
  /// **'Number page indicator in different styles'**
  String get numberpageindicator;

  /// No description provided for @numberpageindicatorwithbutton.
  ///
  /// In en, this message translates to:
  /// **'Number page indicator with button in different styles'**
  String get numberpageindicatorwithbutton;

  /// No description provided for @numberpageindicatorwithbuttonandlimitation.
  ///
  /// In en, this message translates to:
  /// **'Number page indicator with button and limitation in different styles'**
  String get numberpageindicatorwithbuttonandlimitation;

  /// No description provided for @pageindicatortitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of page indicators  are available in panel by flutter code.'**
  String get pageindicatortitle;

  /// No description provided for @dropdownbutton.
  ///
  /// In en, this message translates to:
  /// **'Dropdown button'**
  String get dropdownbutton;

  /// No description provided for @dropdownbuttonsindifferentcolors.
  ///
  /// In en, this message translates to:
  /// **'Dropdown buttons in different colors'**
  String get dropdownbuttonsindifferentcolors;

  /// No description provided for @dropdownbuttonsindifferentsizes.
  ///
  /// In en, this message translates to:
  /// **'Dropdown buttons in different sizes'**
  String get dropdownbuttonsindifferentsizes;

  /// No description provided for @dropdownbuttonsindifferentpositions.
  ///
  /// In en, this message translates to:
  /// **'Dropdown buttons in different positions'**
  String get dropdownbuttonsindifferentpositions;

  /// No description provided for @dropdownbuttonsincustomicons.
  ///
  /// In en, this message translates to:
  /// **'Dropdown buttons with custom icons'**
  String get dropdownbuttonsincustomicons;

  /// No description provided for @dropdownbuttonsindifferentmenudecoration.
  ///
  /// In en, this message translates to:
  /// **'Dropdown buttons in different menu decoration'**
  String get dropdownbuttonsindifferentmenudecoration;

  /// No description provided for @dropdownbuttonsindifferentmenusizes.
  ///
  /// In en, this message translates to:
  /// **'Dropdown Buttons in different menu sizes'**
  String get dropdownbuttonsindifferentmenusizes;

  /// No description provided for @dropdownbuttontitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of dropdown buttons  are available in panel by flutter code.'**
  String get dropdownbuttontitle;

  /// No description provided for @slider.
  ///
  /// In en, this message translates to:
  /// **'Slider'**
  String get slider;

  /// No description provided for @simplecarouselsliderwithoutanimation.
  ///
  /// In en, this message translates to:
  /// **'Simple carousel slider without animation'**
  String get simplecarouselsliderwithoutanimation;

  /// No description provided for @carouselsliderwithanimation.
  ///
  /// In en, this message translates to:
  /// **'Carousel Slider with animation'**
  String get carouselsliderwithanimation;

  /// No description provided for @carouselsliderwithindicator.
  ///
  /// In en, this message translates to:
  /// **'Carousel slider with indicator'**
  String get carouselsliderwithindicator;

  /// No description provided for @carouselsliderwithicon.
  ///
  /// In en, this message translates to:
  /// **'Carousel Slider with icon'**
  String get carouselsliderwithicon;

  /// No description provided for @carouselsliderwithindicatorandicon.
  ///
  /// In en, this message translates to:
  /// **'Carousel slider with indicator and icon'**
  String get carouselsliderwithindicatorandicon;

  /// No description provided for @slidertitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of sliders  are available in panel by flutter code.'**
  String get slidertitle;

  /// No description provided for @tables.
  ///
  /// In en, this message translates to:
  /// **'Tables'**
  String get tables;

  /// No description provided for @simpletables.
  ///
  /// In en, this message translates to:
  /// **'Simple tables'**
  String get simpletables;

  /// No description provided for @nolinetable.
  ///
  /// In en, this message translates to:
  /// **'No line table'**
  String get nolinetable;

  /// No description provided for @responsivetable.
  ///
  /// In en, this message translates to:
  /// **'Responsive table'**
  String get responsivetable;

  /// No description provided for @simpletable.
  ///
  /// In en, this message translates to:
  /// **'Simple table'**
  String get simpletable;

  /// No description provided for @simpletablewithcustomwidgets.
  ///
  /// In en, this message translates to:
  /// **'Simple table with custom widgets'**
  String get simpletablewithcustomwidgets;

  /// No description provided for @simpletablewithcustomwidgetsindesiredcolor.
  ///
  /// In en, this message translates to:
  /// **'Simple table with custom widgets in desired color'**
  String get simpletablewithcustomwidgetsindesiredcolor;

  /// No description provided for @simpletablewithdesiredheadingcolor.
  ///
  /// In en, this message translates to:
  /// **'Simple table with desired heading color'**
  String get simpletablewithdesiredheadingcolor;

  /// No description provided for @simpletableinzebramode.
  ///
  /// In en, this message translates to:
  /// **'Simple table in zebra mode'**
  String get simpletableinzebramode;

  /// No description provided for @simpletableindarkzebramode.
  ///
  /// In en, this message translates to:
  /// **'Simple table in dark zebra mode'**
  String get simpletableindarkzebramode;

  /// No description provided for @simpletablewithlineframe.
  ///
  /// In en, this message translates to:
  /// **'Simple table with line frame'**
  String get simpletablewithlineframe;

  /// No description provided for @simpletabletitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of simple tables  are available in panel by flutter code.'**
  String get simpletabletitle;

  /// No description provided for @responsivetabletitle.
  ///
  /// In en, this message translates to:
  /// **'This responsive table is available in panel with flutter code and its data is received from the server.'**
  String get responsivetabletitle;

  /// No description provided for @grouplist.
  ///
  /// In en, this message translates to:
  /// **'Group list'**
  String get grouplist;

  /// No description provided for @grouplistwithsimplecontent.
  ///
  /// In en, this message translates to:
  /// **'Group list with simple content'**
  String get grouplistwithsimplecontent;

  /// No description provided for @reordablegrouplist.
  ///
  /// In en, this message translates to:
  /// **'Reordable group list'**
  String get reordablegrouplist;

  /// No description provided for @grouplistwithoutdivider.
  ///
  /// In en, this message translates to:
  /// **'Group list without divider'**
  String get grouplistwithoutdivider;

  /// No description provided for @grouplistwithborder.
  ///
  /// In en, this message translates to:
  /// **'Group list with border'**
  String get grouplistwithborder;

  /// No description provided for @grouplistwithcomplexcontent.
  ///
  /// In en, this message translates to:
  /// **'Group list with complex content'**
  String get grouplistwithcomplexcontent;

  /// No description provided for @grouplistwithdesireditemscolor.
  ///
  /// In en, this message translates to:
  /// **'Group list with desired items color'**
  String get grouplistwithdesireditemscolor;

  /// No description provided for @grouplisttitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of group lists  are available in panel by flutter code.'**
  String get grouplisttitle;

  /// No description provided for @progressbar.
  ///
  /// In en, this message translates to:
  /// **'progress bar'**
  String get progressbar;

  /// No description provided for @animatedprogressbarfromzero.
  ///
  /// In en, this message translates to:
  /// **'Animated progress bar from zero'**
  String get animatedprogressbarfromzero;

  /// No description provided for @simplelinearprogressbarindifferentsizes.
  ///
  /// In en, this message translates to:
  /// **'Simple linear progress bar in different sizes'**
  String get simplelinearprogressbarindifferentsizes;

  /// No description provided for @simplecircularprogressbarindifferentsizes.
  ///
  /// In en, this message translates to:
  /// **'Simple circular progress bar in different sizes'**
  String get simplecircularprogressbarindifferentsizes;

  /// No description provided for @simpleprogressbarindifferentcolors.
  ///
  /// In en, this message translates to:
  /// **'Simple progress bar in different colors'**
  String get simpleprogressbarindifferentcolors;

  /// No description provided for @gradientprogressbar.
  ///
  /// In en, this message translates to:
  /// **'Gradient  progress bar'**
  String get gradientprogressbar;

  /// No description provided for @progressbartitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of progress bars  are available in panel by flutter code.'**
  String get progressbartitle;

  /// No description provided for @waitingindicator.
  ///
  /// In en, this message translates to:
  /// **'Waiting indicator'**
  String get waitingindicator;

  /// No description provided for @waitingindicatorsindifferentcolors.
  ///
  /// In en, this message translates to:
  /// **'Waiting indicators in different colors'**
  String get waitingindicatorsindifferentcolors;

  /// No description provided for @waitingindicatorsindifferentsizes.
  ///
  /// In en, this message translates to:
  /// **'Waiting indicators in different sizes'**
  String get waitingindicatorsindifferentsizes;

  /// No description provided for @waitingindicatorsonbuttons.
  ///
  /// In en, this message translates to:
  /// **'Waiting indicators in buttons'**
  String get waitingindicatorsonbuttons;

  /// No description provided for @waitingindicatortitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of Waiting indicators  are available in panel by flutter code.'**
  String get waitingindicatortitle;

  /// No description provided for @avatar.
  ///
  /// In en, this message translates to:
  /// **'Avatar'**
  String get avatar;

  /// No description provided for @avatarsindifferentsizes.
  ///
  /// In en, this message translates to:
  /// **'Avatars in different sizes'**
  String get avatarsindifferentsizes;

  /// No description provided for @avatarsindifferentstatuses.
  ///
  /// In en, this message translates to:
  /// **'Avatars in different statuses'**
  String get avatarsindifferentstatuses;

  /// No description provided for @avatarswithdifferentwidgets.
  ///
  /// In en, this message translates to:
  /// **'Avatars with different widgets'**
  String get avatarswithdifferentwidgets;

  /// No description provided for @avatarswithdifferentbackgroundcolors.
  ///
  /// In en, this message translates to:
  /// **'Avatars with different background colors'**
  String get avatarswithdifferentbackgroundcolors;

  /// No description provided for @avatarsindifferentshapes.
  ///
  /// In en, this message translates to:
  /// **'Avatars in different shapes'**
  String get avatarsindifferentshapes;

  /// No description provided for @groupavatar.
  ///
  /// In en, this message translates to:
  /// **'Group avatar'**
  String get groupavatar;

  /// No description provided for @avatartitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of avatars  are available in panel by flutter code.'**
  String get avatartitle;

  /// No description provided for @tabbarnavigator.
  ///
  /// In en, this message translates to:
  /// **'Tab bar navigator'**
  String get tabbarnavigator;

  /// No description provided for @toptabbarnavigator.
  ///
  /// In en, this message translates to:
  /// **'Top tab bar navigator'**
  String get toptabbarnavigator;

  /// No description provided for @tabbarnavigatorwithdesiredtabdecoration.
  ///
  /// In en, this message translates to:
  /// **'Tab bar navigator with desired tab decoration'**
  String get tabbarnavigatorwithdesiredtabdecoration;

  /// No description provided for @tabbarnavigatorwithdesiredwidgetintabs.
  ///
  /// In en, this message translates to:
  /// **'Tab bar navigator with desired widget in tabs'**
  String get tabbarnavigatorwithdesiredwidgetintabs;

  /// No description provided for @bottomtabbarnavigator.
  ///
  /// In en, this message translates to:
  /// **'Bottom tab bar navigator'**
  String get bottomtabbarnavigator;

  /// No description provided for @leftsidetabbarnavigator.
  ///
  /// In en, this message translates to:
  /// **'Left side tab bar navigator'**
  String get leftsidetabbarnavigator;

  /// No description provided for @rightsidebarnavigator.
  ///
  /// In en, this message translates to:
  /// **'Right side tab bar navigator'**
  String get rightsidebarnavigator;

  /// No description provided for @tabbartitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of tab bar navigators  are available in panel by flutter code.'**
  String get tabbartitle;

  /// No description provided for @simplenavigationbar.
  ///
  /// In en, this message translates to:
  /// **'Simple navigation bar'**
  String get simplenavigationbar;

  /// No description provided for @expandednavigationbar.
  ///
  /// In en, this message translates to:
  /// **'Expanded navigation bar'**
  String get expandednavigationbar;

  /// No description provided for @tabbarnavigationbar.
  ///
  /// In en, this message translates to:
  /// **'Tab bar navigation bar'**
  String get tabbarnavigationbar;

  /// No description provided for @buttonnavigationbar.
  ///
  /// In en, this message translates to:
  /// **'Button navigation bar'**
  String get buttonnavigationbar;

  /// No description provided for @navigationbarwithinactivebutton.
  ///
  /// In en, this message translates to:
  /// **'Navigation bar with inactive button'**
  String get navigationbarwithinactivebutton;

  /// No description provided for @verticalnavigationbar.
  ///
  /// In en, this message translates to:
  /// **'Vertical navigation bar'**
  String get verticalnavigationbar;

  /// No description provided for @navigationbarwithcustomwidget.
  ///
  /// In en, this message translates to:
  /// **'Navigation bar with custom widget'**
  String get navigationbarwithcustomwidget;

  /// No description provided for @navigationbar.
  ///
  /// In en, this message translates to:
  /// **'Navigation bar'**
  String get navigationbar;

  /// No description provided for @navigationbartitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of navigation bar  are available in panel by flutter code.'**
  String get navigationbartitle;

  /// No description provided for @hardwarecommunication.
  ///
  /// In en, this message translates to:
  /// **'Hardware Communication'**
  String get hardwarecommunication;

  /// No description provided for @zoomableimage.
  ///
  /// In en, this message translates to:
  /// **'Zoomable image'**
  String get zoomableimage;

  /// No description provided for @zoomableimagetitle.
  ///
  /// In en, this message translates to:
  /// **'Zoomable image is available in panel by flutter code.'**
  String get zoomableimagetitle;

  /// No description provided for @imagecropper.
  ///
  /// In en, this message translates to:
  /// **'Image cropper'**
  String get imagecropper;

  /// No description provided for @imagecroppertitle.
  ///
  /// In en, this message translates to:
  /// **'Image cropper is available in panel by flutter code.'**
  String get imagecroppertitle;

  /// No description provided for @filesaving.
  ///
  /// In en, this message translates to:
  /// **'File saving'**
  String get filesaving;

  /// No description provided for @filesavingtitle.
  ///
  /// In en, this message translates to:
  /// **'Files saving is available in panel by flutter code.'**
  String get filesavingtitle;

  /// No description provided for @screenshot.
  ///
  /// In en, this message translates to:
  /// **'Screenshot'**
  String get screenshot;

  /// No description provided for @screenshottitle.
  ///
  /// In en, this message translates to:
  /// **'Screenshot of flutter widget is available in panel by flutter code.'**
  String get screenshottitle;

  /// No description provided for @printtitle.
  ///
  /// In en, this message translates to:
  /// **'Printing is available in panel by flutter code.'**
  String get printtitle;

  /// No description provided for @lightbox.
  ///
  /// In en, this message translates to:
  /// **'Light box'**
  String get lightbox;

  /// No description provided for @gallerylightboxshowingimage.
  ///
  /// In en, this message translates to:
  /// **'Gallery light box showing image'**
  String get gallerylightboxshowingimage;

  /// No description provided for @singlelightboxshowingimage.
  ///
  /// In en, this message translates to:
  /// **'Single light box showing image'**
  String get singlelightboxshowingimage;

  /// No description provided for @lightboxtitle.
  ///
  /// In en, this message translates to:
  /// **'Light boxs in two mode  are available in panel by flutter code.'**
  String get lightboxtitle;

  /// No description provided for @modal.
  ///
  /// In en, this message translates to:
  /// **'Modal'**
  String get modal;

  /// No description provided for @modalsindifferentsizes.
  ///
  /// In en, this message translates to:
  /// **'modals in different sizes'**
  String get modalsindifferentsizes;

  /// No description provided for @modalsindifferentcontents.
  ///
  /// In en, this message translates to:
  /// **'modals in different content'**
  String get modalsindifferentcontents;

  /// No description provided for @modalsindifferentalignments.
  ///
  /// In en, this message translates to:
  /// **'modals in different alignments'**
  String get modalsindifferentalignments;

  /// No description provided for @seriesofmodals.
  ///
  /// In en, this message translates to:
  /// **'Series of modals'**
  String get seriesofmodals;

  /// No description provided for @modaltitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of modals  are available in panel by flutter code.'**
  String get modaltitle;

  /// No description provided for @smallmodal.
  ///
  /// In en, this message translates to:
  /// **'Small modal'**
  String get smallmodal;

  /// No description provided for @mediummodal.
  ///
  /// In en, this message translates to:
  /// **'Medium modal'**
  String get mediummodal;

  /// No description provided for @fullscreenmodal.
  ///
  /// In en, this message translates to:
  /// **'Full screen modal'**
  String get fullscreenmodal;

  /// No description provided for @informationmodal.
  ///
  /// In en, this message translates to:
  /// **'Information modal'**
  String get informationmodal;

  /// No description provided for @confirmmodal.
  ///
  /// In en, this message translates to:
  /// **'Confirm modal'**
  String get confirmmodal;

  /// No description provided for @formmodal.
  ///
  /// In en, this message translates to:
  /// **'Form modal'**
  String get formmodal;

  /// No description provided for @gridmodal.
  ///
  /// In en, this message translates to:
  /// **'Grid modal'**
  String get gridmodal;

  /// No description provided for @bottomscreenmodal.
  ///
  /// In en, this message translates to:
  /// **'Bottom screen modal'**
  String get bottomscreenmodal;

  /// No description provided for @centermodal.
  ///
  /// In en, this message translates to:
  /// **'Center modal'**
  String get centermodal;

  /// No description provided for @topleftmodal.
  ///
  /// In en, this message translates to:
  /// **'Top left modal'**
  String get topleftmodal;

  /// No description provided for @toprightmodal.
  ///
  /// In en, this message translates to:
  /// **'Top right modal'**
  String get toprightmodal;

  /// No description provided for @bottomrightmodal.
  ///
  /// In en, this message translates to:
  /// **'Bottom right modal'**
  String get bottomrightmodal;

  /// No description provided for @bottomleftmodal.
  ///
  /// In en, this message translates to:
  /// **'bottom left modal'**
  String get bottomleftmodal;

  /// No description provided for @customalignmmentmodal.
  ///
  /// In en, this message translates to:
  /// **'Custom alignment modal'**
  String get customalignmmentmodal;

  /// No description provided for @tooltip.
  ///
  /// In en, this message translates to:
  /// **'Tooltip'**
  String get tooltip;

  /// No description provided for @tooltipindifferentalignments.
  ///
  /// In en, this message translates to:
  /// **'Tooltip in different alignments'**
  String get tooltipindifferentalignments;

  /// No description provided for @tooltipfordifferentwidgets.
  ///
  /// In en, this message translates to:
  /// **'Tooltip on different widgets'**
  String get tooltipfordifferentwidgets;

  /// No description provided for @tooltipindifferentshowduration.
  ///
  /// In en, this message translates to:
  /// **'Tooltip in different show duration'**
  String get tooltipindifferentshowduration;

  /// No description provided for @tooltiptitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of tooltips  are available in panel by flutter code.'**
  String get tooltiptitle;

  /// No description provided for @sweetalert.
  ///
  /// In en, this message translates to:
  /// **'Sweet alert'**
  String get sweetalert;

  /// No description provided for @sweetalerttitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of sweet alerts  are available in panel by flutter code.'**
  String get sweetalerttitle;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @subtitle.
  ///
  /// In en, this message translates to:
  /// **'Subtitle'**
  String get subtitle;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get link;

  /// No description provided for @footer.
  ///
  /// In en, this message translates to:
  /// **'Footer'**
  String get footer;

  /// No description provided for @header.
  ///
  /// In en, this message translates to:
  /// **'header'**
  String get header;

  /// No description provided for @quotation.
  ///
  /// In en, this message translates to:
  /// **'Quotation'**
  String get quotation;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @primarycard.
  ///
  /// In en, this message translates to:
  /// **'Primary card'**
  String get primarycard;

  /// No description provided for @primarycardtitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of primary cards  are available in panel by flutter code.'**
  String get primarycardtitle;

  /// No description provided for @scrollablecard.
  ///
  /// In en, this message translates to:
  /// **'Scrollable card'**
  String get scrollablecard;

  /// No description provided for @scrollablecardtitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of scrollable cards  are available in panel by flutter code.'**
  String get scrollablecardtitle;

  /// No description provided for @imagecard.
  ///
  /// In en, this message translates to:
  /// **'Image card'**
  String get imagecard;

  /// No description provided for @imagecardtitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of image cards  are available in panel by flutter code.'**
  String get imagecardtitle;

  /// No description provided for @toastmessage.
  ///
  /// In en, this message translates to:
  /// **'Toast message'**
  String get toastmessage;

  /// No description provided for @toasttitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of toast message  are available in panel by flutter code.'**
  String get toasttitle;

  /// No description provided for @tutorial.
  ///
  /// In en, this message translates to:
  /// **'Tutorial'**
  String get tutorial;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @tutorialintro.
  ///
  /// In en, this message translates to:
  /// **'It is tutorial click bottom below and start it.'**
  String get tutorialintro;

  /// No description provided for @tutorialtitle.
  ///
  /// In en, this message translates to:
  /// **'Tutorial by flutter code is available in panel for introduction.'**
  String get tutorialtitle;

  /// No description provided for @treelist.
  ///
  /// In en, this message translates to:
  /// **'Tree list'**
  String get treelist;

  /// No description provided for @defaulttreelistview.
  ///
  /// In en, this message translates to:
  /// **'Default tree list view'**
  String get defaulttreelistview;

  /// No description provided for @treelistviewwithdesiredicon.
  ///
  /// In en, this message translates to:
  /// **'Tree list view with desired icon'**
  String get treelistviewwithdesiredicon;

  /// No description provided for @treelistviewtitle.
  ///
  /// In en, this message translates to:
  /// **'Tree listview by flutter code is available in panel.'**
  String get treelistviewtitle;

  /// No description provided for @mediaplayer.
  ///
  /// In en, this message translates to:
  /// **'Media player'**
  String get mediaplayer;

  /// No description provided for @audioplayer.
  ///
  /// In en, this message translates to:
  /// **'Audio player'**
  String get audioplayer;

  /// No description provided for @simplevideoplayer.
  ///
  /// In en, this message translates to:
  /// **'Simple video player'**
  String get simplevideoplayer;

  /// No description provided for @videoplayerwithcover.
  ///
  /// In en, this message translates to:
  /// **'Video player with cover'**
  String get videoplayerwithcover;

  /// No description provided for @videoplayerwithicons.
  ///
  /// In en, this message translates to:
  /// **'Video player with icons'**
  String get videoplayerwithicons;

  /// No description provided for @videoplayerwithdescription.
  ///
  /// In en, this message translates to:
  /// **'Video player with description'**
  String get videoplayerwithdescription;

  /// No description provided for @mediaplayertitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of Media players are available in panel by flutter code.'**
  String get mediaplayertitle;

  /// No description provided for @primaryform.
  ///
  /// In en, this message translates to:
  /// **'Primary form'**
  String get primaryform;

  /// No description provided for @customform.
  ///
  /// In en, this message translates to:
  /// **'Custom form'**
  String get customform;

  /// No description provided for @advancedform.
  ///
  /// In en, this message translates to:
  /// **'Advanced form'**
  String get advancedform;

  /// No description provided for @validateform.
  ///
  /// In en, this message translates to:
  /// **'Validate form'**
  String get validateform;

  /// No description provided for @stepperform.
  ///
  /// In en, this message translates to:
  /// **'Stepper form'**
  String get stepperform;

  /// No description provided for @texteditor.
  ///
  /// In en, this message translates to:
  /// **'Text editor'**
  String get texteditor;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @horizontalform.
  ///
  /// In en, this message translates to:
  /// **'Horizontal form'**
  String get horizontalform;

  /// No description provided for @formcontrols.
  ///
  /// In en, this message translates to:
  /// **'Form controls'**
  String get formcontrols;

  /// No description provided for @textfieldindifferentwidthandheight.
  ///
  /// In en, this message translates to:
  /// **'Text field in different width and height'**
  String get textfieldindifferentwidthandheight;

  /// No description provided for @dropdownbuttonsindifferentwidthandheight.
  ///
  /// In en, this message translates to:
  /// **'Drop down buttons in different width and height'**
  String get dropdownbuttonsindifferentwidthandheight;

  /// No description provided for @readonlyfield.
  ///
  /// In en, this message translates to:
  /// **'read only field'**
  String get readonlyfield;

  /// No description provided for @sliderinput.
  ///
  /// In en, this message translates to:
  /// **'Slider input'**
  String get sliderinput;

  /// No description provided for @dropdownsample.
  ///
  /// In en, this message translates to:
  /// **'Drop down sample'**
  String get dropdownsample;

  /// No description provided for @textareasample.
  ///
  /// In en, this message translates to:
  /// **'Text area sample'**
  String get textareasample;

  /// No description provided for @multiselectsample.
  ///
  /// In en, this message translates to:
  /// **'Multi select sample'**
  String get multiselectsample;

  /// No description provided for @checkboxsample.
  ///
  /// In en, this message translates to:
  /// **'Checkbox sample'**
  String get checkboxsample;

  /// No description provided for @radiobuttonsgroup.
  ///
  /// In en, this message translates to:
  /// **'Radio buttons group'**
  String get radiobuttonsgroup;

  /// No description provided for @primaryformtitle.
  ///
  /// In en, this message translates to:
  /// **'Different types of primary forms are available in panel by flutter code.'**
  String get primaryformtitle;

  /// No description provided for @customformtitle.
  ///
  /// In en, this message translates to:
  /// **'Different types of custom forms are available in panel by flutter code.'**
  String get customformtitle;

  /// No description provided for @switchbutton.
  ///
  /// In en, this message translates to:
  /// **'Switch Button'**
  String get switchbutton;

  /// No description provided for @checkbox.
  ///
  /// In en, this message translates to:
  /// **'Check box'**
  String get checkbox;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @colorpicker.
  ///
  /// In en, this message translates to:
  /// **'Color picker'**
  String get colorpicker;

  /// No description provided for @ringcolorpicker.
  ///
  /// In en, this message translates to:
  /// **'Ring Color picker'**
  String get ringcolorpicker;

  /// No description provided for @labelinput.
  ///
  /// In en, this message translates to:
  /// **'Label input'**
  String get labelinput;

  /// No description provided for @maskedinput.
  ///
  /// In en, this message translates to:
  /// **'Masked input'**
  String get maskedinput;

  /// No description provided for @dateinput.
  ///
  /// In en, this message translates to:
  /// **'Date input'**
  String get dateinput;

  /// No description provided for @timeinput.
  ///
  /// In en, this message translates to:
  /// **'Time input'**
  String get timeinput;

  /// No description provided for @phonenumberinput.
  ///
  /// In en, this message translates to:
  /// **'Phone number input'**
  String get phonenumberinput;

  /// No description provided for @shabanumberinput.
  ///
  /// In en, this message translates to:
  /// **'Shaba number input'**
  String get shabanumberinput;

  /// No description provided for @currencyinput.
  ///
  /// In en, this message translates to:
  /// **'Currency input'**
  String get currencyinput;

  /// No description provided for @ipaddressinput.
  ///
  /// In en, this message translates to:
  /// **'IP Address input'**
  String get ipaddressinput;

  /// No description provided for @sliderwithjustintegerselect.
  ///
  /// In en, this message translates to:
  /// **'Slider with just integer select'**
  String get sliderwithjustintegerselect;

  /// No description provided for @sliderwithdoubleselect.
  ///
  /// In en, this message translates to:
  /// **'Slider with double select'**
  String get sliderwithdoubleselect;

  /// No description provided for @sliderwithcurrencylabel.
  ///
  /// In en, this message translates to:
  /// **'Slider with currency unit label'**
  String get sliderwithcurrencylabel;

  /// No description provided for @sliderwithstringchoice.
  ///
  /// In en, this message translates to:
  /// **'Slider with string choice'**
  String get sliderwithstringchoice;

  /// No description provided for @advancedformtitle.
  ///
  /// In en, this message translates to:
  /// **'Different types of advanced forms are available in panel by flutter code.'**
  String get advancedformtitle;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @usernamehint.
  ///
  /// In en, this message translates to:
  /// **'Enter your username:'**
  String get usernamehint;

  /// No description provided for @passwordhint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password:'**
  String get passwordhint;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @lockscreen.
  ///
  /// In en, this message translates to:
  /// **'Lock screen'**
  String get lockscreen;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @components.
  ///
  /// In en, this message translates to:
  /// **'Components'**
  String get components;

  /// No description provided for @advancedcomponents.
  ///
  /// In en, this message translates to:
  /// **'Advanced components'**
  String get advancedcomponents;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// No description provided for @theinputlengthistooshort.
  ///
  /// In en, this message translates to:
  /// **'The input length is too short!'**
  String get theinputlengthistooshort;

  /// No description provided for @thisfieldcannotbeempty.
  ///
  /// In en, this message translates to:
  /// **'This field can not be empty'**
  String get thisfieldcannotbeempty;

  /// No description provided for @theinputmustberepeated.
  ///
  /// In en, this message translates to:
  /// **'The input must be repeated'**
  String get theinputmustberepeated;

  /// No description provided for @youshouldacceptthetermsandconditionsbeforeregister.
  ///
  /// In en, this message translates to:
  /// **'You should accept the Terms and Conditions.'**
  String get youshouldacceptthetermsandconditionsbeforeregister;

  /// No description provided for @acceptthetermsandconditions.
  ///
  /// In en, this message translates to:
  /// **'Accept the Terms and Conditions.'**
  String get acceptthetermsandconditions;

  /// No description provided for @pleaseselectoneitem.
  ///
  /// In en, this message translates to:
  /// **'Please select one item.'**
  String get pleaseselectoneitem;

  /// No description provided for @pleaseselectavalue.
  ///
  /// In en, this message translates to:
  /// **'Please select a value.'**
  String get pleaseselectavalue;

  /// No description provided for @pleaseselectatleastoneitem.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one item.'**
  String get pleaseselectatleastoneitem;

  /// No description provided for @validationforms.
  ///
  /// In en, this message translates to:
  /// **'Validation forms'**
  String get validationforms;

  /// No description provided for @validationformstitle.
  ///
  /// In en, this message translates to:
  /// **'Different types of validation forms are available in panel by flutter code.'**
  String get validationformstitle;

  /// No description provided for @stepperwithoutvalidationfield.
  ///
  /// In en, this message translates to:
  /// **'Stepper without validation field'**
  String get stepperwithoutvalidationfield;

  /// No description provided for @stepperformwithvalidationfields.
  ///
  /// In en, this message translates to:
  /// **'Stepper form with validation fields'**
  String get stepperformwithvalidationfields;

  /// No description provided for @verticalstepperform.
  ///
  /// In en, this message translates to:
  /// **'Vertical stepper form'**
  String get verticalstepperform;

  /// No description provided for @stepperformtitle.
  ///
  /// In en, this message translates to:
  /// **'Different types of stepper forms are available in panel by flutter code.'**
  String get stepperformtitle;

  /// No description provided for @quilltexteditor.
  ///
  /// In en, this message translates to:
  /// **'Quill text editor'**
  String get quilltexteditor;

  /// No description provided for @htmltexteditor.
  ///
  /// In en, this message translates to:
  /// **'HTML text editor'**
  String get htmltexteditor;

  /// No description provided for @textstyleeditortitle.
  ///
  /// In en, this message translates to:
  /// **'Text style editor is available in panel by flutter code.'**
  String get textstyleeditortitle;

  /// No description provided for @htmltexteditortitle.
  ///
  /// In en, this message translates to:
  /// **'HTML text editor is available in panel by flutter code.'**
  String get htmltexteditortitle;

  /// No description provided for @quilltexteditortitle.
  ///
  /// In en, this message translates to:
  /// **'Quill text editor is available in panel by flutter code.'**
  String get quilltexteditortitle;

  /// No description provided for @blocpattern.
  ///
  /// In en, this message translates to:
  /// **'bloc pattern'**
  String get blocpattern;

  /// No description provided for @blocpatterntitle.
  ///
  /// In en, this message translates to:
  /// **'bloc pattern usage sample is available in panel by flutter code.'**
  String get blocpatterntitle;

  /// No description provided for @panelmanagement.
  ///
  /// In en, this message translates to:
  /// **'Panel management'**
  String get panelmanagement;

  /// No description provided for @fillfieldstocontinue.
  ///
  /// In en, this message translates to:
  /// **'Fill fields to continue:'**
  String get fillfieldstocontinue;

  /// No description provided for @emailoruserName.
  ///
  /// In en, this message translates to:
  /// **'Email or UserName'**
  String get emailoruserName;

  /// No description provided for @forgetthepassword.
  ///
  /// In en, this message translates to:
  /// **'Forget the password ?'**
  String get forgetthepassword;

  /// No description provided for @rememberme.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberme;

  /// No description provided for @withgoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign with Google'**
  String get withgoogle;

  /// No description provided for @withfacebook.
  ///
  /// In en, this message translates to:
  /// **'Sign with Facebook'**
  String get withfacebook;

  /// No description provided for @donothaveanaccount.
  ///
  /// In en, this message translates to:
  /// **'Do not have an Account ?'**
  String get donothaveanaccount;

  /// No description provided for @haveanaccount.
  ///
  /// In en, this message translates to:
  /// **'Do you have an Account ?'**
  String get haveanaccount;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'create'**
  String get create;

  /// No description provided for @createanewaccount.
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get createanewaccount;

  /// No description provided for @createaccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createaccount;

  /// No description provided for @emailadress.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailadress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @repeatthepassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get repeatthepassword;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signin;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @pleaseenteremail.
  ///
  /// In en, this message translates to:
  /// **'Please enter email'**
  String get pleaseenteremail;

  /// No description provided for @pleaseenterpassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get pleaseenterpassword;

  /// No description provided for @pleaseselectme.
  ///
  /// In en, this message translates to:
  /// **'Please select me'**
  String get pleaseselectme;

  /// No description provided for @recoverpassword.
  ///
  /// In en, this message translates to:
  /// **'Recover password'**
  String get recoverpassword;

  /// No description provided for @recoveryourpasswordnow.
  ///
  /// In en, this message translates to:
  /// **'Recover your password now'**
  String get recoveryourpasswordnow;

  /// No description provided for @enternow.
  ///
  /// In en, this message translates to:
  /// **'Enter now'**
  String get enternow;

  /// No description provided for @unlocking.
  ///
  /// In en, this message translates to:
  /// **'Unlocking'**
  String get unlocking;

  /// No description provided for @youraccessneedsunlocking.
  ///
  /// In en, this message translates to:
  /// **'Your access needs unlocking.'**
  String get youraccessneedsunlocking;

  /// No description provided for @icons.
  ///
  /// In en, this message translates to:
  /// **'Icons'**
  String get icons;

  /// No description provided for @emptyscreen.
  ///
  /// In en, this message translates to:
  /// **'Empty screen'**
  String get emptyscreen;

  /// No description provided for @authentication.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get authentication;

  /// No description provided for @pages.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get pages;

  /// No description provided for @errors.
  ///
  /// In en, this message translates to:
  /// **'Errors'**
  String get errors;

  /// No description provided for @maintenance.
  ///
  /// In en, this message translates to:
  /// **'maintenance'**
  String get maintenance;

  /// No description provided for @wewillbebacksoon.
  ///
  /// In en, this message translates to:
  /// **'We will be back soon ...'**
  String get wewillbebacksoon;

  /// No description provided for @lookforsomethingsearchit.
  ///
  /// In en, this message translates to:
  /// **'Look for something, Search it:'**
  String get lookforsomethingsearchit;

  /// No description provided for @thesiteiscurrentlyundermaintenance.
  ///
  /// In en, this message translates to:
  /// **'The site is currently under maintenance'**
  String get thesiteiscurrentlyundermaintenance;

  /// No description provided for @menulevel.
  ///
  /// In en, this message translates to:
  /// **'Menu level'**
  String get menulevel;

  /// No description provided for @emptyscreentitle.
  ///
  /// In en, this message translates to:
  /// **'Empty screen is available in panel by flutter code.'**
  String get emptyscreentitle;

  /// No description provided for @bill.
  ///
  /// In en, this message translates to:
  /// **'Bill'**
  String get bill;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @sendbill.
  ///
  /// In en, this message translates to:
  /// **'Send bill'**
  String get sendbill;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @number.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get number;

  /// No description provided for @totalamountp.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalamountp;

  /// No description provided for @currencyunit.
  ///
  /// In en, this message translates to:
  /// **'\$'**
  String get currencyunit;

  /// No description provided for @totalbill.
  ///
  /// In en, this message translates to:
  /// **'Total: 13,986,000 \$'**
  String get totalbill;

  /// No description provided for @tax.
  ///
  /// In en, this message translates to:
  /// **'Tax (10%): 138,000 \$'**
  String get tax;

  /// No description provided for @totalamount.
  ///
  /// In en, this message translates to:
  /// **'Total amount: 12,348,000 \$'**
  String get totalamount;

  /// No description provided for @billtitle.
  ///
  /// In en, this message translates to:
  /// **'Bill screen is available in panel by flutter code.'**
  String get billtitle;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'yesterday'**
  String get yesterday;

  /// No description provided for @timeline.
  ///
  /// In en, this message translates to:
  /// **'Time line'**
  String get timeline;

  /// No description provided for @customtimeline.
  ///
  /// In en, this message translates to:
  /// **'Custom time Line'**
  String get customtimeline;

  /// No description provided for @processtimeline.
  ///
  /// In en, this message translates to:
  /// **'Process time Line'**
  String get processtimeline;

  /// No description provided for @packagedeliverytimeline.
  ///
  /// In en, this message translates to:
  /// **'Package delivery time Line'**
  String get packagedeliverytimeline;

  /// No description provided for @statustimeline.
  ///
  /// In en, this message translates to:
  /// **'Status time Line '**
  String get statustimeline;

  /// No description provided for @timelinetitle.
  ///
  /// In en, this message translates to:
  /// **'Different types of timeline are available in panel by flutter code.'**
  String get timelinetitle;

  /// No description provided for @forstart.
  ///
  /// In en, this message translates to:
  /// **'For start'**
  String get forstart;

  /// No description provided for @golden.
  ///
  /// In en, this message translates to:
  /// **'Golden'**
  String get golden;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearly;

  /// No description provided for @teststart.
  ///
  /// In en, this message translates to:
  /// **'Test start'**
  String get teststart;

  /// No description provided for @pricecard.
  ///
  /// In en, this message translates to:
  /// **'Price card'**
  String get pricecard;

  /// No description provided for @complexpricecard.
  ///
  /// In en, this message translates to:
  /// **'Complex price card'**
  String get complexpricecard;

  /// No description provided for @pricecardtitle.
  ///
  /// In en, this message translates to:
  /// **'Different types of price cards are available in panel by flutter code.'**
  String get pricecardtitle;

  /// No description provided for @resultsfindfor.
  ///
  /// In en, this message translates to:
  /// **'results find for:'**
  String get resultsfindfor;

  /// No description provided for @classic.
  ///
  /// In en, this message translates to:
  /// **'Classic'**
  String get classic;

  /// No description provided for @articles.
  ///
  /// In en, this message translates to:
  /// **'Articles'**
  String get articles;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'users'**
  String get users;

  /// No description provided for @readmore.
  ///
  /// In en, this message translates to:
  /// **'Read more ...'**
  String get readmore;

  /// No description provided for @searchresult.
  ///
  /// In en, this message translates to:
  /// **'Search result'**
  String get searchresult;

  /// No description provided for @searchresulttitle.
  ///
  /// In en, this message translates to:
  /// **'Different types of Search results are available in panel by flutter code.'**
  String get searchresulttitle;

  /// No description provided for @editprofile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editprofile;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @follower.
  ///
  /// In en, this message translates to:
  /// **'Follower'**
  String get follower;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @firstname.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstname;

  /// No description provided for @lastname.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastname;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @job.
  ///
  /// In en, this message translates to:
  /// **'Job'**
  String get job;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @like.
  ///
  /// In en, this message translates to:
  /// **'Like'**
  String get like;

  /// No description provided for @completetheprofile.
  ///
  /// In en, this message translates to:
  /// **'Complete the profile'**
  String get completetheprofile;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @software.
  ///
  /// In en, this message translates to:
  /// **'Soft Ware'**
  String get software;

  /// No description provided for @design.
  ///
  /// In en, this message translates to:
  /// **'Design'**
  String get design;

  /// No description provided for @seo.
  ///
  /// In en, this message translates to:
  /// **'SEO'**
  String get seo;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followers;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @profilepage.
  ///
  /// In en, this message translates to:
  /// **'Profile page'**
  String get profilepage;

  /// No description provided for @profilepagetitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of profile cards  are available in panel by flutter code.'**
  String get profilepagetitle;

  /// No description provided for @numberofsales.
  ///
  /// In en, this message translates to:
  /// **'Number of sales'**
  String get numberofsales;

  /// No description provided for @sharesomthing.
  ///
  /// In en, this message translates to:
  /// **'Share something ...'**
  String get sharesomthing;

  /// No description provided for @shareanactivity.
  ///
  /// In en, this message translates to:
  /// **'Share an activity'**
  String get shareanactivity;

  /// No description provided for @icontitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of icons  are available in panel by flutter code.'**
  String get icontitle;

  /// No description provided for @panelicons.
  ///
  /// In en, this message translates to:
  /// **'Panel icons'**
  String get panelicons;

  /// No description provided for @fontawesomefluttericons.
  ///
  /// In en, this message translates to:
  /// **'Font awesome flutter icons'**
  String get fontawesomefluttericons;

  /// No description provided for @fluttericons.
  ///
  /// In en, this message translates to:
  /// **'Flutter icons'**
  String get fluttericons;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @maptitle.
  ///
  /// In en, this message translates to:
  /// **'Location is available in panel by flutter code.'**
  String get maptitle;

  /// No description provided for @colors.
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get colors;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @colorstitle.
  ///
  /// In en, this message translates to:
  /// **'Different kinds of colors  are defined in panel by flutter code.'**
  String get colorstitle;

  /// No description provided for @primarycolor.
  ///
  /// In en, this message translates to:
  /// **'Primary color'**
  String get primarycolor;

  /// No description provided for @primarydarkcolor.
  ///
  /// In en, this message translates to:
  /// **'Primary dark color'**
  String get primarydarkcolor;

  /// No description provided for @primarylightcolor.
  ///
  /// In en, this message translates to:
  /// **'Primary light color'**
  String get primarylightcolor;

  /// No description provided for @onprimarycolor.
  ///
  /// In en, this message translates to:
  /// **'On primary color'**
  String get onprimarycolor;

  /// No description provided for @onsecondarycolor.
  ///
  /// In en, this message translates to:
  /// **'On secondary color'**
  String get onsecondarycolor;

  /// No description provided for @backgroundcolor.
  ///
  /// In en, this message translates to:
  /// **'Background color'**
  String get backgroundcolor;

  /// No description provided for @bordercolor.
  ///
  /// In en, this message translates to:
  /// **'Border color'**
  String get bordercolor;

  /// No description provided for @hovercolor.
  ///
  /// In en, this message translates to:
  /// **'Hover color'**
  String get hovercolor;

  /// No description provided for @buttonhovercolor.
  ///
  /// In en, this message translates to:
  /// **'Button hover color'**
  String get buttonhovercolor;

  /// No description provided for @texthovercolor.
  ///
  /// In en, this message translates to:
  /// **'Text hover color'**
  String get texthovercolor;

  /// No description provided for @cardColor.
  ///
  /// In en, this message translates to:
  /// **'Card color'**
  String get cardColor;

  /// No description provided for @menucolor.
  ///
  /// In en, this message translates to:
  /// **'Menu color'**
  String get menucolor;

  /// No description provided for @shadowcolor.
  ///
  /// In en, this message translates to:
  /// **'Shadow color'**
  String get shadowcolor;

  /// No description provided for @dividercolor.
  ///
  /// In en, this message translates to:
  /// **'Divider color'**
  String get dividercolor;

  /// No description provided for @iconcolor.
  ///
  /// In en, this message translates to:
  /// **'Icon color'**
  String get iconcolor;

  /// No description provided for @specificcolor.
  ///
  /// In en, this message translates to:
  /// **'Specific color'**
  String get specificcolor;

  /// No description provided for @secondarybordercolor.
  ///
  /// In en, this message translates to:
  /// **'Secondary border color'**
  String get secondarybordercolor;

  /// No description provided for @textinputcolor.
  ///
  /// In en, this message translates to:
  /// **'text input color'**
  String get textinputcolor;

  /// No description provided for @backgroundinputcolor.
  ///
  /// In en, this message translates to:
  /// **'background input color'**
  String get backgroundinputcolor;

  /// No description provided for @labelinputcolor.
  ///
  /// In en, this message translates to:
  /// **'label input color'**
  String get labelinputcolor;

  /// No description provided for @hintinputcolor.
  ///
  /// In en, this message translates to:
  /// **'hint input color'**
  String get hintinputcolor;

  /// No description provided for @borderinputcolor.
  ///
  /// In en, this message translates to:
  /// **'Border input color'**
  String get borderinputcolor;

  /// No description provided for @white.
  ///
  /// In en, this message translates to:
  /// **'white color'**
  String get white;

  /// No description provided for @black.
  ///
  /// In en, this message translates to:
  /// **'Black color'**
  String get black;

  /// No description provided for @buttonColor.
  ///
  /// In en, this message translates to:
  /// **'Button color'**
  String get buttonColor;

  /// No description provided for @textColor.
  ///
  /// In en, this message translates to:
  /// **'Text color'**
  String get textColor;

  /// No description provided for @secondaryTextColor.
  ///
  /// In en, this message translates to:
  /// **'Secondary text color'**
  String get secondaryTextColor;

  /// No description provided for @titletextcolor.
  ///
  /// In en, this message translates to:
  /// **'Title text color'**
  String get titletextcolor;

  /// No description provided for @sectionTitleTextColor.
  ///
  /// In en, this message translates to:
  /// **'Section title text color'**
  String get sectionTitleTextColor;

  /// No description provided for @buttontextcolor.
  ///
  /// In en, this message translates to:
  /// **'Button text color'**
  String get buttontextcolor;

  /// No description provided for @disableColorRegular.
  ///
  /// In en, this message translates to:
  /// **'Disable regular color'**
  String get disableColorRegular;

  /// No description provided for @disableColorLight.
  ///
  /// In en, this message translates to:
  /// **'Disable light color'**
  String get disableColorLight;

  /// No description provided for @disableColorDark.
  ///
  /// In en, this message translates to:
  /// **'Disable dark color'**
  String get disableColorDark;

  /// No description provided for @disableColors.
  ///
  /// In en, this message translates to:
  /// **'Disable colors'**
  String get disableColors;

  /// No description provided for @sectioncolor.
  ///
  /// In en, this message translates to:
  /// **'Section color'**
  String get sectioncolor;

  /// No description provided for @secondarycolor.
  ///
  /// In en, this message translates to:
  /// **'Secondary color'**
  String get secondarycolor;

  /// No description provided for @secondarydarkcolor.
  ///
  /// In en, this message translates to:
  /// **'Secondary dark color'**
  String get secondarydarkcolor;

  /// No description provided for @secondarylightcolor.
  ///
  /// In en, this message translates to:
  /// **'Secondary light color'**
  String get secondarylightcolor;

  /// No description provided for @primarycolors.
  ///
  /// In en, this message translates to:
  /// **'Primary colors'**
  String get primarycolors;

  /// No description provided for @successcolors.
  ///
  /// In en, this message translates to:
  /// **'Success color'**
  String get successcolors;

  /// No description provided for @warningcolors.
  ///
  /// In en, this message translates to:
  /// **'Warning color'**
  String get warningcolors;

  /// No description provided for @informationcolors.
  ///
  /// In en, this message translates to:
  /// **'Information color'**
  String get informationcolors;

  /// No description provided for @dangercolors.
  ///
  /// In en, this message translates to:
  /// **'Danger colors'**
  String get dangercolors;

  /// No description provided for @dangerregularcolor.
  ///
  /// In en, this message translates to:
  /// **'Danger regular color'**
  String get dangerregularcolor;

  /// No description provided for @dangerlightcolor.
  ///
  /// In en, this message translates to:
  /// **'Danger light color'**
  String get dangerlightcolor;

  /// No description provided for @dangerdarkcolor.
  ///
  /// In en, this message translates to:
  /// **'Danger dark color'**
  String get dangerdarkcolor;

  /// No description provided for @warningregularcolor.
  ///
  /// In en, this message translates to:
  /// **'Warning regular color'**
  String get warningregularcolor;

  /// No description provided for @warninglightcolor.
  ///
  /// In en, this message translates to:
  /// **'Warning light color'**
  String get warninglightcolor;

  /// No description provided for @warningdarkcolor.
  ///
  /// In en, this message translates to:
  /// **'Warning dark color'**
  String get warningdarkcolor;

  /// No description provided for @informationregularcolor.
  ///
  /// In en, this message translates to:
  /// **'Information regular color'**
  String get informationregularcolor;

  /// No description provided for @informationlightcolor.
  ///
  /// In en, this message translates to:
  /// **'Information light color'**
  String get informationlightcolor;

  /// No description provided for @informationdarkcolor.
  ///
  /// In en, this message translates to:
  /// **'Information dark color'**
  String get informationdarkcolor;

  /// No description provided for @successregularcolor.
  ///
  /// In en, this message translates to:
  /// **'Success regular color'**
  String get successregularcolor;

  /// No description provided for @successlightcolor.
  ///
  /// In en, this message translates to:
  /// **'Success light color'**
  String get successlightcolor;

  /// No description provided for @successdarkcolor.
  ///
  /// In en, this message translates to:
  /// **'Success dark color'**
  String get successdarkcolor;

  /// No description provided for @dialogeBoxDescription.
  ///
  /// In en, this message translates to:
  /// **'different kinds of dialog box with various function are available in panel.'**
  String get dialogeBoxDescription;

  /// No description provided for @dialogBox.
  ///
  /// In en, this message translates to:
  /// **'Dialog Box'**
  String get dialogBox;

  /// No description provided for @successDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get successDialogTitle;

  /// No description provided for @successDialogText.
  ///
  /// In en, this message translates to:
  /// **'Successful Dialog'**
  String get successDialogText;

  /// No description provided for @successDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'The process was Successful:)'**
  String get successDialogDesc;

  /// No description provided for @errorDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorDialogTitle;

  /// No description provided for @errorDialogText.
  ///
  /// In en, this message translates to:
  /// **'Error Dialog'**
  String get errorDialogText;

  /// No description provided for @errorDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'The process has error!!!'**
  String get errorDialogDesc;

  /// No description provided for @infoDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get infoDialogTitle;

  /// No description provided for @infoDialogText.
  ///
  /// In en, this message translates to:
  /// **'Info Dialog'**
  String get infoDialogText;

  /// No description provided for @infoDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'The process has information'**
  String get infoDialogDesc;

  /// No description provided for @warningDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warningDialogTitle;

  /// No description provided for @warningDialogText.
  ///
  /// In en, this message translates to:
  /// **'Warning Dialog'**
  String get warningDialogText;

  /// No description provided for @warningDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'The process has warning'**
  String get warningDialogDesc;

  /// No description provided for @autoHideDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto Hide'**
  String get autoHideDialogTitle;

  /// No description provided for @autoHideDialogText.
  ///
  /// In en, this message translates to:
  /// **'Auto Hide Dialog'**
  String get autoHideDialogText;

  /// No description provided for @autoHideDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'I disapear in 2 sec.'**
  String get autoHideDialogDesc;

  /// No description provided for @bodyDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Body dialog'**
  String get bodyDialogTitle;

  /// No description provided for @bodyDialogText.
  ///
  /// In en, this message translates to:
  /// **'Body dialog'**
  String get bodyDialogText;

  /// No description provided for @bodyDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'body dialog body dialog body dialog body dialog body dialog'**
  String get bodyDialogDesc;

  /// No description provided for @inputDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Input dialog'**
  String get inputDialogTitle;

  /// No description provided for @inputDialogText.
  ///
  /// In en, this message translates to:
  /// **'Input dialog'**
  String get inputDialogText;

  /// No description provided for @inputDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'Input dialog'**
  String get inputDialogDesc;

  /// No description provided for @input1.
  ///
  /// In en, this message translates to:
  /// **'Input1'**
  String get input1;

  /// No description provided for @input2.
  ///
  /// In en, this message translates to:
  /// **'Input2'**
  String get input2;

  /// No description provided for @form.
  ///
  /// In en, this message translates to:
  /// **'Forms'**
  String get form;

  /// No description provided for @textField.
  ///
  /// In en, this message translates to:
  /// **'Test Field'**
  String get textField;

  /// No description provided for @priceTextField.
  ///
  /// In en, this message translates to:
  /// **'Price Test Field'**
  String get priceTextField;

  /// No description provided for @phoneNumbertextField.
  ///
  /// In en, this message translates to:
  /// **'Phone Number Test Field'**
  String get phoneNumbertextField;

  /// No description provided for @shabaNumbertextField.
  ///
  /// In en, this message translates to:
  /// **'Shaba Number Test Field'**
  String get shabaNumbertextField;

  /// No description provided for @datePickerfa.
  ///
  /// In en, this message translates to:
  /// **'Date Picker(Jalali)'**
  String get datePickerfa;

  /// No description provided for @datePickeren.
  ///
  /// In en, this message translates to:
  /// **'Date Picker(Gregorian)'**
  String get datePickeren;

  /// No description provided for @timePickerHMS.
  ///
  /// In en, this message translates to:
  /// **'Time Picker(H:M:S)'**
  String get timePickerHMS;

  /// No description provided for @timePickerHM.
  ///
  /// In en, this message translates to:
  /// **'Time Picker(H:M)'**
  String get timePickerHM;

  /// No description provided for @ordinarySlider.
  ///
  /// In en, this message translates to:
  /// **'Ordinary Slider'**
  String get ordinarySlider;

  /// No description provided for @rangedSlider.
  ///
  /// In en, this message translates to:
  /// **'Ranged Slider'**
  String get rangedSlider;

  /// No description provided for @radioButons.
  ///
  /// In en, this message translates to:
  /// **'Radio Buttons'**
  String get radioButons;

  /// No description provided for @textArea.
  ///
  /// In en, this message translates to:
  /// **'Text Area'**
  String get textArea;

  /// No description provided for @starRateBar.
  ///
  /// In en, this message translates to:
  /// **'Star Rate Bar'**
  String get starRateBar;

  /// No description provided for @dropDownButton.
  ///
  /// In en, this message translates to:
  /// **'Drop down button'**
  String get dropDownButton;

  /// No description provided for @ordinaryCheckBox.
  ///
  /// In en, this message translates to:
  /// **'Ordinary Check Box'**
  String get ordinaryCheckBox;

  /// No description provided for @animationCheckBox.
  ///
  /// In en, this message translates to:
  /// **'Animation Check Box'**
  String get animationCheckBox;

  /// No description provided for @validationCheckBox.
  ///
  /// In en, this message translates to:
  /// **'Check Box with validation'**
  String get validationCheckBox;

  /// No description provided for @filePicker.
  ///
  /// In en, this message translates to:
  /// **'File and Folder Picker'**
  String get filePicker;

  /// No description provided for @textFieldType.
  ///
  /// In en, this message translates to:
  /// **'TextField'**
  String get textFieldType;

  /// No description provided for @textFieldHint.
  ///
  /// In en, this message translates to:
  /// **'TextField Hint'**
  String get textFieldHint;

  /// No description provided for @textAreaType.
  ///
  /// In en, this message translates to:
  /// **'TextArea'**
  String get textAreaType;

  /// No description provided for @textAreaHint.
  ///
  /// In en, this message translates to:
  /// **'TextArea Hint'**
  String get textAreaHint;

  /// No description provided for @ampm.
  ///
  /// In en, this message translates to:
  /// **'AM/PM'**
  String get ampm;

  /// No description provided for @selectcolor.
  ///
  /// In en, this message translates to:
  /// **'select color'**
  String get selectcolor;

  /// No description provided for @openText.
  ///
  /// In en, this message translates to:
  /// **'Open file picker'**
  String get openText;

  /// No description provided for @pickText.
  ///
  /// In en, this message translates to:
  /// **'Pick a folder'**
  String get pickText;

  /// No description provided for @clearText.
  ///
  /// In en, this message translates to:
  /// **'Clear temporary files'**
  String get clearText;

  /// No description provided for @checkBoxTitle.
  ///
  /// In en, this message translates to:
  /// **'CheckBox title'**
  String get checkBoxTitle;

  /// No description provided for @checkBoxWithValidator.
  ///
  /// In en, this message translates to:
  /// **'CheckBox with validator'**
  String get checkBoxWithValidator;

  /// No description provided for @animatedCheckBoxTitle.
  ///
  /// In en, this message translates to:
  /// **'Animated checkBox'**
  String get animatedCheckBoxTitle;

  /// No description provided for @checkBoxErrorText.
  ///
  /// In en, this message translates to:
  /// **'CheckBox error text'**
  String get checkBoxErrorText;

  /// No description provided for @checkBoxButtonText.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get checkBoxButtonText;

  /// No description provided for @toggleButton.
  ///
  /// In en, this message translates to:
  /// **'Toggle Button'**
  String get toggleButton;

  /// No description provided for @carouselSlider.
  ///
  /// In en, this message translates to:
  /// **'Carousel Slider'**
  String get carouselSlider;

  /// No description provided for @perspectiveSlider.
  ///
  /// In en, this message translates to:
  /// **'Perspective Slider'**
  String get perspectiveSlider;

  /// No description provided for @progressBar.
  ///
  /// In en, this message translates to:
  /// **'Progress Bar'**
  String get progressBar;

  /// No description provided for @linearProgressBar.
  ///
  /// In en, this message translates to:
  /// **'Linear Progress Bar'**
  String get linearProgressBar;

  /// No description provided for @circularProgressBar.
  ///
  /// In en, this message translates to:
  /// **'Circular Progress Bar'**
  String get circularProgressBar;

  /// No description provided for @images.
  ///
  /// In en, this message translates to:
  /// **'Images'**
  String get images;

  /// No description provided for @zoomingImages.
  ///
  /// In en, this message translates to:
  /// **'Zooming Image'**
  String get zoomingImages;

  /// No description provided for @lightBoxShowingImage.
  ///
  /// In en, this message translates to:
  /// **'Light Box Showing Image'**
  String get lightBoxShowingImage;

  /// No description provided for @avatarImages.
  ///
  /// In en, this message translates to:
  /// **'Avatar Image'**
  String get avatarImages;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @simpleNotifications.
  ///
  /// In en, this message translates to:
  /// **'Ordinary Notifications'**
  String get simpleNotifications;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending...'**
  String get pending;

  /// No description provided for @unsuccessful.
  ///
  /// In en, this message translates to:
  /// **'unSuccessful'**
  String get unsuccessful;

  /// No description provided for @successful.
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get successful;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'status'**
  String get status;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @newusers.
  ///
  /// In en, this message translates to:
  /// **'New users'**
  String get newusers;

  /// No description provided for @taskslist.
  ///
  /// In en, this message translates to:
  /// **'tasks list'**
  String get taskslist;

  /// No description provided for @memberbenefits.
  ///
  /// In en, this message translates to:
  /// **'Member benefits'**
  String get memberbenefits;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @logistics.
  ///
  /// In en, this message translates to:
  /// **'Logistics'**
  String get logistics;

  /// No description provided for @tickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get tickets;

  /// No description provided for @newvisitorstoday.
  ///
  /// In en, this message translates to:
  /// **'New visitors today'**
  String get newvisitorstoday;

  /// No description provided for @totalmonthlyorders.
  ///
  /// In en, this message translates to:
  /// **'Total monthly orders'**
  String get totalmonthlyorders;

  /// No description provided for @totalincomethisyear.
  ///
  /// In en, this message translates to:
  /// **'Total income this year'**
  String get totalincomethisyear;

  /// No description provided for @onlinemembership.
  ///
  /// In en, this message translates to:
  /// **'Online membership'**
  String get onlinemembership;

  /// No description provided for @socialnetworksatistic.
  ///
  /// In en, this message translates to:
  /// **'Social network satistic'**
  String get socialnetworksatistic;

  /// No description provided for @platformstatus.
  ///
  /// In en, this message translates to:
  /// **'Platform status'**
  String get platformstatus;

  /// No description provided for @growthrate.
  ///
  /// In en, this message translates to:
  /// **'Growth rate'**
  String get growthrate;

  /// No description provided for @participation.
  ///
  /// In en, this message translates to:
  /// **'Participation'**
  String get participation;

  /// No description provided for @adaccess.
  ///
  /// In en, this message translates to:
  /// **'Ad access'**
  String get adaccess;

  /// No description provided for @engagement.
  ///
  /// In en, this message translates to:
  /// **'engagement'**
  String get engagement;

  /// No description provided for @saleschart.
  ///
  /// In en, this message translates to:
  /// **'Sales chart'**
  String get saleschart;

  /// No description provided for @adminpaneltitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter admin panel'**
  String get adminpaneltitle;

  /// No description provided for @typemessage.
  ///
  /// In en, this message translates to:
  /// **'Type your message...'**
  String get typemessage;

  /// No description provided for @generatedleads.
  ///
  /// In en, this message translates to:
  /// **'Generated leads'**
  String get generatedleads;

  /// No description provided for @monthlyreport.
  ///
  /// In en, this message translates to:
  /// **'Monthly report'**
  String get monthlyreport;

  /// No description provided for @usercomments.
  ///
  /// In en, this message translates to:
  /// **'User comments'**
  String get usercomments;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'edit'**
  String get edit;

  /// No description provided for @socialnetworkvisits.
  ///
  /// In en, this message translates to:
  /// **'Social network visits'**
  String get socialnetworkvisits;

  /// No description provided for @lastyearvisits.
  ///
  /// In en, this message translates to:
  /// **'Last year visits'**
  String get lastyearvisits;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get business;

  /// No description provided for @profit.
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get profit;

  /// No description provided for @lastmonth.
  ///
  /// In en, this message translates to:
  /// **'Last month'**
  String get lastmonth;

  /// No description provided for @youhave5newmessages.
  ///
  /// In en, this message translates to:
  /// **'You have 5 new messages'**
  String get youhave5newmessages;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @todolist.
  ///
  /// In en, this message translates to:
  /// **'To do list'**
  String get todolist;

  /// No description provided for @recentcomments.
  ///
  /// In en, this message translates to:
  /// **'Recent comments'**
  String get recentcomments;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @mostsalesincountries.
  ///
  /// In en, this message translates to:
  /// **'Most sales in countries'**
  String get mostsalesincountries;

  /// No description provided for @saleslast90days.
  ///
  /// In en, this message translates to:
  /// **'Sales last 90 days'**
  String get saleslast90days;

  /// No description provided for @earningreports.
  ///
  /// In en, this message translates to:
  /// **'Earning reports'**
  String get earningreports;

  /// No description provided for @eventcalender.
  ///
  /// In en, this message translates to:
  /// **'Event calender'**
  String get eventcalender;

  /// No description provided for @netprofit.
  ///
  /// In en, this message translates to:
  /// **'Net profit'**
  String get netprofit;

  /// No description provided for @totalincome.
  ///
  /// In en, this message translates to:
  /// **'Total income'**
  String get totalincome;

  /// No description provided for @totalexpenses.
  ///
  /// In en, this message translates to:
  /// **'Total expenses'**
  String get totalexpenses;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// No description provided for @telecommuting.
  ///
  /// In en, this message translates to:
  /// **'Telecommuting'**
  String get telecommuting;

  /// No description provided for @outsourcing.
  ///
  /// In en, this message translates to:
  /// **'Outsourcing'**
  String get outsourcing;

  /// No description provided for @regular.
  ///
  /// In en, this message translates to:
  /// **'Regular'**
  String get regular;

  /// No description provided for @desktop.
  ///
  /// In en, this message translates to:
  /// **'Desktop'**
  String get desktop;

  /// No description provided for @mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @weather.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weather;

  /// No description provided for @rainyday.
  ///
  /// In en, this message translates to:
  /// **'Rainy day'**
  String get rainyday;

  /// No description provided for @secondpage.
  ///
  /// In en, this message translates to:
  /// **'Second page'**
  String get secondpage;

  /// No description provided for @thirdpage.
  ///
  /// In en, this message translates to:
  /// **'Third page'**
  String get thirdpage;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @openbelowlink.
  ///
  /// In en, this message translates to:
  /// **'1.Open below link and Sign in to your ChatGPT account '**
  String get openbelowlink;

  /// No description provided for @clickbutton.
  ///
  /// In en, this message translates to:
  /// **'2.Then click the “Create new secret key” button.'**
  String get clickbutton;

  /// No description provided for @createsecretkey.
  ///
  /// In en, this message translates to:
  /// **'3.Enter the name of your new key then press “Create secret key”.'**
  String get createsecretkey;

  /// No description provided for @enterapikey.
  ///
  /// In en, this message translates to:
  /// **'Please copy and  enter api key here:'**
  String get enterapikey;

  /// No description provided for @startworkingwithchat.
  ///
  /// In en, this message translates to:
  /// **'To start working with chatGPT, you must first enter valid api key, so press the button below to start:'**
  String get startworkingwithchat;

  /// No description provided for @enterapi.
  ///
  /// In en, this message translates to:
  /// **'Enter api key'**
  String get enterapi;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @startchat.
  ///
  /// In en, this message translates to:
  /// **'Start chat'**
  String get startchat;

  /// No description provided for @alreadyregistered.
  ///
  /// In en, this message translates to:
  /// **'You have already registered api key.'**
  String get alreadyregistered;

  /// No description provided for @areyousure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to do this again?'**
  String get areyousure;

  /// No description provided for @beaware.
  ///
  /// In en, this message translates to:
  /// **'Be aware that if the api key is not valid, ChatGPT will not respond.'**
  String get beaware;

  /// No description provided for @lottiewaitingindicator.
  ///
  /// In en, this message translates to:
  /// **'Lottie waiting indicator'**
  String get lottiewaitingindicator;

  /// No description provided for @hearyou.
  ///
  /// In en, this message translates to:
  /// **'We always ready to hear you:'**
  String get hearyou;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @jan.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get jan;

  /// No description provided for @feb.
  ///
  /// In en, this message translates to:
  /// **'Feb'**
  String get feb;

  /// No description provided for @mar.
  ///
  /// In en, this message translates to:
  /// **'Mar'**
  String get mar;

  /// No description provided for @apri.
  ///
  /// In en, this message translates to:
  /// **'Apri'**
  String get apri;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @jun.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get jun;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @aug.
  ///
  /// In en, this message translates to:
  /// **'Aug'**
  String get aug;

  /// No description provided for @sep.
  ///
  /// In en, this message translates to:
  /// **'Sep'**
  String get sep;

  /// No description provided for @oct.
  ///
  /// In en, this message translates to:
  /// **'Oct'**
  String get oct;

  /// No description provided for @nov.
  ///
  /// In en, this message translates to:
  /// **'Nov'**
  String get nov;

  /// No description provided for @dec.
  ///
  /// In en, this message translates to:
  /// **'Dec'**
  String get dec;

  /// No description provided for @socialnetworkcolors.
  ///
  /// In en, this message translates to:
  /// **'Social network colors'**
  String get socialnetworkcolors;

  /// No description provided for @profession.
  ///
  /// In en, this message translates to:
  /// **'Profession'**
  String get profession;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @thisisfluttertoast.
  ///
  /// In en, this message translates to:
  /// **'This is flutter toast'**
  String get thisisfluttertoast;

  /// No description provided for @thisiscustomtoast.
  ///
  /// In en, this message translates to:
  /// **'This is custom toast'**
  String get thisiscustomtoast;

  /// No description provided for @confirmabovewidgetforscreenshot.
  ///
  /// In en, this message translates to:
  /// **'Confirm above widget for screenshot'**
  String get confirmabovewidgetforscreenshot;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @lastupdatewas.
  ///
  /// In en, this message translates to:
  /// **'last update was 3 min ago'**
  String get lastupdatewas;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @step.
  ///
  /// In en, this message translates to:
  /// **'Step'**
  String get step;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'Id'**
  String get id;

  /// No description provided for @page.
  ///
  /// In en, this message translates to:
  /// **'Page'**
  String get page;

  /// No description provided for @tab.
  ///
  /// In en, this message translates to:
  /// **'Tab'**
  String get tab;

  /// No description provided for @rotation.
  ///
  /// In en, this message translates to:
  /// **'Rotation'**
  String get rotation;

  /// No description provided for @scale.
  ///
  /// In en, this message translates to:
  /// **'Scale'**
  String get scale;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// No description provided for @successfulsave.
  ///
  /// In en, this message translates to:
  /// **'Save was successful :) in'**
  String get successfulsave;

  /// No description provided for @bannerdesign.
  ///
  /// In en, this message translates to:
  /// **'Banner design'**
  String get bannerdesign;

  /// No description provided for @logodesign.
  ///
  /// In en, this message translates to:
  /// **'logo design'**
  String get logodesign;

  /// No description provided for @appdesign.
  ///
  /// In en, this message translates to:
  /// **'App design'**
  String get appdesign;

  /// No description provided for @printad.
  ///
  /// In en, this message translates to:
  /// **'Print Ad'**
  String get printad;

  /// No description provided for @avatarname.
  ///
  /// In en, this message translates to:
  /// **'FA'**
  String get avatarname;

  /// No description provided for @cityname.
  ///
  /// In en, this message translates to:
  /// **'Vancouver, Canada'**
  String get cityname;

  /// No description provided for @itistitlecardofpage.
  ///
  /// In en, this message translates to:
  /// **'It is title card of page.'**
  String get itistitlecardofpage;

  /// No description provided for @itisintrocardoftutorial.
  ///
  /// In en, this message translates to:
  /// **'It is intro card of tutorial.'**
  String get itisintrocardoftutorial;

  /// No description provided for @itisinformationbuttonofcard.
  ///
  /// In en, this message translates to:
  /// **'It is information button of card.'**
  String get itisinformationbuttonofcard;

  /// No description provided for @itisanimagecard.
  ///
  /// In en, this message translates to:
  /// **'It is an image card.'**
  String get itisanimagecard;

  /// No description provided for @oops.
  ///
  /// In en, this message translates to:
  /// **'Ooops...'**
  String get oops;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @thereisaproblem.
  ///
  /// In en, this message translates to:
  /// **'There is a problem!'**
  String get thereisaproblem;

  /// No description provided for @asuccessfulmessage.
  ///
  /// In en, this message translates to:
  /// **'A successful message'**
  String get asuccessfulmessage;

  /// No description provided for @showasuccessmessagewithanicon.
  ///
  /// In en, this message translates to:
  /// **'Show a success message with an icon'**
  String get showasuccessmessagewithanicon;

  /// No description provided for @youwontbeabletorevertthis.
  ///
  /// In en, this message translates to:
  /// **'You won\'t be able to revert this!'**
  String get youwontbeabletorevertthis;

  /// No description provided for @yesdeleteit.
  ///
  /// In en, this message translates to:
  /// **'Yes, delete it'**
  String get yesdeleteit;

  /// No description provided for @deleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted!'**
  String get deleted;

  /// No description provided for @thereisaquestion.
  ///
  /// In en, this message translates to:
  /// **'There is a question'**
  String get thereisaquestion;

  /// No description provided for @showaquestionmessagewithanicon.
  ///
  /// In en, this message translates to:
  /// **'Show a question message with an icon'**
  String get showaquestionmessagewithanicon;

  /// No description provided for @customcontentalert.
  ///
  /// In en, this message translates to:
  /// **'Custom content alert'**
  String get customcontentalert;

  /// No description provided for @prospect.
  ///
  /// In en, this message translates to:
  /// **'Prospect'**
  String get prospect;

  /// No description provided for @tour.
  ///
  /// In en, this message translates to:
  /// **'Tour'**
  String get tour;

  /// No description provided for @offer.
  ///
  /// In en, this message translates to:
  /// **'Offer'**
  String get offer;

  /// No description provided for @contract.
  ///
  /// In en, this message translates to:
  /// **'Contract'**
  String get contract;

  /// No description provided for @settled.
  ///
  /// In en, this message translates to:
  /// **'Settled'**
  String get settled;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @am.
  ///
  /// In en, this message translates to:
  /// **'Am'**
  String get am;

  /// No description provided for @pm.
  ///
  /// In en, this message translates to:
  /// **'Pm'**
  String get pm;

  /// No description provided for @ontime.
  ///
  /// In en, this message translates to:
  /// **'On-time'**
  String get ontime;

  /// No description provided for @driver.
  ///
  /// In en, this message translates to:
  /// **'driver'**
  String get driver;

  /// No description provided for @drivername.
  ///
  /// In en, this message translates to:
  /// **'Karen'**
  String get drivername;

  /// No description provided for @packageprocess.
  ///
  /// In en, this message translates to:
  /// **'Package Process'**
  String get packageprocess;

  /// No description provided for @packagereceivedbydriver.
  ///
  /// In en, this message translates to:
  /// **'Package received by driver'**
  String get packagereceivedbydriver;

  /// No description provided for @reachedhalfwaymark.
  ///
  /// In en, this message translates to:
  /// **'Reached halfway mark'**
  String get reachedhalfwaymark;

  /// No description provided for @intransit.
  ///
  /// In en, this message translates to:
  /// **'In Transit'**
  String get intransit;

  /// No description provided for @driverarrivedatdestination.
  ///
  /// In en, this message translates to:
  /// **'Driver arrived at destination'**
  String get driverarrivedatdestination;

  /// No description provided for @packagedeliveredby.
  ///
  /// In en, this message translates to:
  /// **'Package delivered by Jack'**
  String get packagedeliveredby;

  /// No description provided for @weeklyearningsoverview.
  ///
  /// In en, this message translates to:
  /// **'Weekly Earnings Overview'**
  String get weeklyearningsoverview;

  /// No description provided for @desktopmediaplayernote1.
  ///
  /// In en, this message translates to:
  /// **'It is a simple video player located in: '**
  String get desktopmediaplayernote1;

  /// No description provided for @desktopmediaplayernote2.
  ///
  /// In en, this message translates to:
  /// **'and is used as '**
  String get desktopmediaplayernote2;

  /// No description provided for @desktopmediaplayernote3.
  ///
  /// In en, this message translates to:
  /// **' package should be added in pubspec.yaml \'s dependencies'**
  String get desktopmediaplayernote3;

  /// No description provided for @desktopmediaplayernote4.
  ///
  /// In en, this message translates to:
  /// **'The note that this component has conflict in the cases except desktop,'**
  String get desktopmediaplayernote4;

  /// No description provided for @desktopmediaplayernote5.
  ///
  /// In en, this message translates to:
  /// **'so if you want to use it in desktop you should :'**
  String get desktopmediaplayernote5;

  /// No description provided for @desktopmediaplayernote6.
  ///
  /// In en, this message translates to:
  /// **'1-comment out the  FxDesktopVideoPlayer() located in fx_flutterap_components/components/fx_player'**
  String get desktopmediaplayernote6;

  /// No description provided for @desktopmediaplayernote7.
  ///
  /// In en, this message translates to:
  /// **'2-comment out the  dart_vlc: (version) located in fx_flutterap_components/pubspec.yaml and get packages.'**
  String get desktopmediaplayernote7;

  /// No description provided for @desktopmediaplayernote8.
  ///
  /// In en, this message translates to:
  /// **'3-comment out the'**
  String get desktopmediaplayernote8;

  /// No description provided for @desktopmediaplayernote9.
  ///
  /// In en, this message translates to:
  /// **'4-comment out the'**
  String get desktopmediaplayernote9;

  /// No description provided for @desktopmediaplayernote10.
  ///
  /// In en, this message translates to:
  /// **'5-comment out the'**
  String get desktopmediaplayernote10;

  /// No description provided for @desktopmediaplayernote11.
  ///
  /// In en, this message translates to:
  /// **'6-comment out the'**
  String get desktopmediaplayernote11;

  /// No description provided for @sendnotification.
  ///
  /// In en, this message translates to:
  /// **'Send notification'**
  String get sendnotification;

  /// No description provided for @notificationnote.
  ///
  /// In en, this message translates to:
  /// **'In FcNotification() flutter Notifications for Desktop and mobile platforms is prepared,the local_notifier and flutter_local_notifications packages should be added in pubspec.yaml \'s dependencies Note:Working on web background service will pay off soon. '**
  String get notificationnote;

  /// No description provided for @australia.
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get australia;

  /// No description provided for @canada.
  ///
  /// In en, this message translates to:
  /// **'Canada'**
  String get canada;

  /// No description provided for @india.
  ///
  /// In en, this message translates to:
  /// **'India'**
  String get india;

  /// No description provided for @us.
  ///
  /// In en, this message translates to:
  /// **'US'**
  String get us;

  /// No description provided for @japan.
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get japan;

  /// No description provided for @brazil.
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get brazil;

  /// No description provided for @higoodmorning.
  ///
  /// In en, this message translates to:
  /// **'Hi, Good morning'**
  String get higoodmorning;

  /// No description provided for @howareyou.
  ///
  /// In en, this message translates to:
  /// **'Hello, How are you?'**
  String get howareyou;

  /// No description provided for @adminname.
  ///
  /// In en, this message translates to:
  /// **'Jack'**
  String get adminname;

  /// No description provided for @adminlastname.
  ///
  /// In en, this message translates to:
  /// **'Shephard'**
  String get adminlastname;

  /// No description provided for @addevent.
  ///
  /// In en, this message translates to:
  /// **'Add event'**
  String get addevent;

  /// No description provided for @pleaseentereventname.
  ///
  /// In en, this message translates to:
  /// **'Please enter event name:'**
  String get pleaseentereventname;

  /// No description provided for @pickenddate.
  ///
  /// In en, this message translates to:
  /// **'Pick end date'**
  String get pickenddate;

  /// No description provided for @gotosecondpage.
  ///
  /// In en, this message translates to:
  /// **'Go to second page'**
  String get gotosecondpage;

  /// No description provided for @gotothirdpage.
  ///
  /// In en, this message translates to:
  /// **'Go to third page'**
  String get gotothirdpage;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @disaleditems.
  ///
  /// In en, this message translates to:
  /// **'Disaled items'**
  String get disaleditems;

  /// No description provided for @editevent.
  ///
  /// In en, this message translates to:
  /// **'Edit event'**
  String get editevent;

  /// No description provided for @pleaseediteventname.
  ///
  /// In en, this message translates to:
  /// **'Please edit the name of the event if you wish:'**
  String get pleaseediteventname;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fa', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
/*   switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'fa': return AppLocalizationsFa();
    case 'hi': return AppLocalizationsHi();
  }
 */
  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
