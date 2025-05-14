/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 61
///
/// Built on 2025-05-14 at 18:46 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get appName => 'Apphub';
	late final _StringsTabBarEn tabBar = _StringsTabBarEn._(_root);
	late final _StringsPageNamesEn pageNames = _StringsPageNamesEn._(_root);
	late final _StringsTerminalEn terminal = _StringsTerminalEn._(_root);
	late final _StringsSearchEn search = _StringsSearchEn._(_root);
	late final _StringsInstalledPageEn installedPage = _StringsInstalledPageEn._(_root);
	late final _StringsHomePageEn homePage = _StringsHomePageEn._(_root);
	late final _StringsAppPageEn appPage = _StringsAppPageEn._(_root);
	String get settings => 'Settings';
	String get about => 'About';
	late final _StringsAboutMenuEn aboutMenu = _StringsAboutMenuEn._(_root);
	String get system => 'System';
	String get user => 'User';
	String get installLocation => 'Install Location';
	String get installLocationMessage => 'Where a app is installed to';
}

// Path: tabBar
class _StringsTabBarEn {
	_StringsTabBarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get installed => 'Installed';
}

// Path: pageNames
class _StringsPageNamesEn {
	_StringsPageNamesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get installedApps => 'Installed Apps';
	String get trending => 'Trending Apps';
	String get recentlyUpdated => 'Recently Updated Apps';
	String get popular => 'Popular Apps';
	String get recentlyAdded => 'New Apps';
	String developer({required Object developer}) => 'Apps by ${developer}';
}

// Path: terminal
class _StringsTerminalEn {
	_StringsTerminalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get cancel => 'Cancel';
	String get stop => 'Stop';
	String get stopCommand => 'Stop Command';
	String get stopCommandMessage => 'Are you sure you want to stop this command?';
}

// Path: search
class _StringsSearchEn {
	_StringsSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search => 'Search';
	String get searchPlaceholder => 'Search for apps';
	String searchResult({required Object query}) => 'Results for "${query}"';
}

// Path: installedPage
class _StringsInstalledPageEn {
	_StringsInstalledPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get updatesTitle => 'Updates';
	String get updateAllButton => 'Update All';
	String get appsTitle => 'Apps';
	String get runtimesTitle => 'Runtimes';
	String get loadingError => 'Error loading installed apps';
	String get checkingForUpdates => 'Checking for updates...';
}

// Path: homePage
class _StringsHomePageEn {
	_StringsHomePageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get gnomeCircle => 'GNOME Circle';
	String get appOfTheDay => 'App of the Day';
	String get more => 'More';
}

// Path: appPage
class _StringsAppPageEn {
	_StringsAppPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get seeMore => 'See More';
	String otherAppsByDeveloper({required Object developer}) => 'Other Apps by ${developer}';
	String get communityBuilt => 'Community Built';
	String get proprietary => 'Proprietary';
	String freeLicenseMessage({required Object license}) => 'This app is developed in the open by an international community, and released under the ${license}.';
	String get proprietaryMessage => 'This app is not developed in the open, so only its developers know how it works. It may be insecure in ways that are hard to detect, and it may change without oversight.';
	String get installSize => 'Install Size';
	String get downloadSize => 'Download Size';
	String get availableArchitectures => 'Available Architectures';
	late final _StringsAppPageLinksEn links = _StringsAppPageLinksEn._(_root);
	String byDeveloper({required Object developer}) => 'by ${developer}';
	String get developerNameFallback => 'Unknown';
	String get openApp => 'Open';
	String get installApp => 'Install';
	late final _StringsAppPageUninstallDialogEn uninstallDialog = _StringsAppPageUninstallDialogEn._(_root);
}

// Path: aboutMenu
class _StringsAboutMenuEn {
	_StringsAboutMenuEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get developers => 'Developers';
	String get designers => 'Designers';
	String get translators => 'Translators';
	String get github => 'GitHub';
}

// Path: appPage.links
class _StringsAppPageLinksEn {
	_StringsAppPageLinksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get homePage => 'Home Page';
	String get donate => 'Donate';
	String get help => 'Help';
	String get faq => 'FAQ';
	String get contact => 'Contact';
	String get sourceCode => 'Source Code';
	String get translate => 'Translate';
	String get bugTracker => 'Bug Tracker';
}

// Path: appPage.uninstallDialog
class _StringsAppPageUninstallDialogEn {
	_StringsAppPageUninstallDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Uninstall App';
	String message({required Object appName}) => 'Are you sure you want to uninstall ${appName}?';
	String get confirm => 'Uninstall';
	String get cancel => 'Cancel';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Apphub';
			case 'tabBar.home': return 'Home';
			case 'tabBar.installed': return 'Installed';
			case 'pageNames.home': return 'Home';
			case 'pageNames.installedApps': return 'Installed Apps';
			case 'pageNames.trending': return 'Trending Apps';
			case 'pageNames.recentlyUpdated': return 'Recently Updated Apps';
			case 'pageNames.popular': return 'Popular Apps';
			case 'pageNames.recentlyAdded': return 'New Apps';
			case 'pageNames.developer': return ({required Object developer}) => 'Apps by ${developer}';
			case 'terminal.cancel': return 'Cancel';
			case 'terminal.stop': return 'Stop';
			case 'terminal.stopCommand': return 'Stop Command';
			case 'terminal.stopCommandMessage': return 'Are you sure you want to stop this command?';
			case 'search.search': return 'Search';
			case 'search.searchPlaceholder': return 'Search for apps';
			case 'search.searchResult': return ({required Object query}) => 'Results for "${query}"';
			case 'installedPage.updatesTitle': return 'Updates';
			case 'installedPage.updateAllButton': return 'Update All';
			case 'installedPage.appsTitle': return 'Apps';
			case 'installedPage.runtimesTitle': return 'Runtimes';
			case 'installedPage.loadingError': return 'Error loading installed apps';
			case 'installedPage.checkingForUpdates': return 'Checking for updates...';
			case 'homePage.gnomeCircle': return 'GNOME Circle';
			case 'homePage.appOfTheDay': return 'App of the Day';
			case 'homePage.more': return 'More';
			case 'appPage.seeMore': return 'See More';
			case 'appPage.otherAppsByDeveloper': return ({required Object developer}) => 'Other Apps by ${developer}';
			case 'appPage.communityBuilt': return 'Community Built';
			case 'appPage.proprietary': return 'Proprietary';
			case 'appPage.freeLicenseMessage': return ({required Object license}) => 'This app is developed in the open by an international community, and released under the ${license}.';
			case 'appPage.proprietaryMessage': return 'This app is not developed in the open, so only its developers know how it works. It may be insecure in ways that are hard to detect, and it may change without oversight.';
			case 'appPage.installSize': return 'Install Size';
			case 'appPage.downloadSize': return 'Download Size';
			case 'appPage.availableArchitectures': return 'Available Architectures';
			case 'appPage.links.homePage': return 'Home Page';
			case 'appPage.links.donate': return 'Donate';
			case 'appPage.links.help': return 'Help';
			case 'appPage.links.faq': return 'FAQ';
			case 'appPage.links.contact': return 'Contact';
			case 'appPage.links.sourceCode': return 'Source Code';
			case 'appPage.links.translate': return 'Translate';
			case 'appPage.links.bugTracker': return 'Bug Tracker';
			case 'appPage.byDeveloper': return ({required Object developer}) => 'by ${developer}';
			case 'appPage.developerNameFallback': return 'Unknown';
			case 'appPage.openApp': return 'Open';
			case 'appPage.installApp': return 'Install';
			case 'appPage.uninstallDialog.title': return 'Uninstall App';
			case 'appPage.uninstallDialog.message': return ({required Object appName}) => 'Are you sure you want to uninstall ${appName}?';
			case 'appPage.uninstallDialog.confirm': return 'Uninstall';
			case 'appPage.uninstallDialog.cancel': return 'Cancel';
			case 'settings': return 'Settings';
			case 'about': return 'About';
			case 'aboutMenu.developers': return 'Developers';
			case 'aboutMenu.designers': return 'Designers';
			case 'aboutMenu.translators': return 'Translators';
			case 'aboutMenu.github': return 'GitHub';
			case 'system': return 'System';
			case 'user': return 'User';
			case 'installLocation': return 'Install Location';
			case 'installLocationMessage': return 'Where a app is installed to';
			default: return null;
		}
	}
}
