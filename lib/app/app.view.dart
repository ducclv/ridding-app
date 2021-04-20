import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:intl/intl.dart';
import 'package:riding_app/config/application.dart';
import 'package:riding_app/config/locale.dart';
import 'package:riding_app/utils/api.dart';
import 'package:riding_app/utils/custom_toast.dart';

class AppWidget extends StatefulWidget {
  AppWidget() {
    Application.api = API();
    Application.toast = Toastify();
    Application.sharePreference.putString('locale', "vi_vn");
    Intl.defaultLocale = Application.sharePreference.getString('locale');
  }

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return I18n(
      initialLocale: AppLocale.locales[Application.sharePreference.getString('locale')],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // FormBuilderLocalizations.delegate,
        ],
        supportedLocales: AppLocale.locales.values.toList(),
        locale: AppLocale.locales[Application.sharePreference.getString('locale')],
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.white,
          accentColor: Color(0xFF00B4FF),
          fontFamily: "Quicksand",
        ),
        debugShowCheckedModeBanner: false,
      ).modular(),
    );
  }
}
