/* find enabled prefs here: */

/* engines I use:
 * https://unduck.link?q=%s */

/* let me add new search engines */
user_pref("browser.urlbar.update2.engineAliasRefresh", true);

/* disable about:config warning */
user_pref("browser.aboutConfig.showWarning", false);

/* experimental tab groups on firefox */
user_pref("browser.tabs.groups.enabled", true);

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
