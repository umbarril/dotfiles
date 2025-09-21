/* find enabled prefs here: */

/* engines I use:
 * https://unduck.link?q=%s */

/* let me add new search engines */
user_pref("browser.urlbar.update2.engineAliasRefresh", true);

/* disable about:config warning */
user_pref("browser.aboutConfig.showWarning", false);

// /* experimental tab groups on firefox */
// user_pref("browser.tabs.groups.enabled", true);

/* disable middle mouse paste */
user_pref("middlemouse.paste", false);

/* disable pocket */
/* https://support.mozilla.org/en-US/kb/save-web-pages-later-pocket-firefox */
/* https://github.com/pyllyukko/user.js/issues/143 */
user_pref("browser.pocket.enabled",				false);
user_pref("extensions.pocket.enabled",			false);

/* vertical tabs */
/* don't work very well on the current state (firefox 133) */
// user_pref("sidebar.revamp",				false);
// user_pref("sidebar.verticalTabs",		false);

/* enable userChrome.css */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

/* pinch zoom with shift scroll */
user_pref("mousewheel.with_shift.action", 5);
/* normal zoom with ctrl scroll */
user_pref("mousewheel.with_control.action", 3);

/* remove "Inspect accessibility Properties" (context menu): */
/* user_pref("devtools.accessibility.enabled", false); */

/* remove Screenshot native extension (button, context menu) */
user_pref("extensions.screenshots.disabled", true);

/* Disable expensive backdrop filter CSS property (performance, recommended for old and slow computers only): */
/* user_pref("layout.css.backdrop-filter.enabled", false) */

/* This will let me use different search engines in private mode */
/* Go to Options> Search> "Choose a different default search engine for Private Windows only" and select the engine of choice */
user_pref("browser.search.separatePrivateDefault", true);
user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
