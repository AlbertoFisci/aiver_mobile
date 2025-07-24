// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get menu_home => 'Home';

  @override
  String get home_welcome => 'Benvenuto in AiVer';

  @override
  String get home_description =>
      'Utilizza il menu per iniziare a ispezionare, segnalare e migliorare la sicurezza.';

  @override
  String get menu_options => 'Opzioni';

  @override
  String get menu_checklist => 'Checklist AiVer';

  @override
  String get menu_incidenti => 'Incidenti / Near Miss';

  @override
  String get menu_segnalazioni => 'Segnalazioni / Rapporti';

  @override
  String get menu_crea_sito => 'Crea nuovo sito / cantiere';

  @override
  String get drawer_change_profile => 'Cambia profilo';

  @override
  String drawer_user_role(Object role) {
    return 'Ruolo: $role';
  }

  @override
  String get permissionRequest_title => 'Permessi necessari';

  @override
  String get permissionRequest_description =>
      'Per usare tutte le funzionalità di AiVer, concedi i permessi dalle impostazioni del dispositivo.';

  @override
  String get permissionRequest_explanation =>
      'AiVer richiede alcuni permessi per funzionare correttamente.';

  @override
  String get permissionRequest_button_request => 'Concedi permessi';

  @override
  String get permissionRequest_button_loading => 'Controllo in corso...';

  @override
  String get permissionRequest_button_cancel => 'Annulla';

  @override
  String get permissionRequest_button_settings => 'Apri impostazioni';

  @override
  String get select_sector => 'Seleziona Settore';

  @override
  String get select_subsector => 'Seleziona Sottosettore';

  @override
  String get checklist_specials_header =>
      'Per questa checklist sono attivabili le seguenti checklist speciali:';

  @override
  String get select_sector_tooltip =>
      'Seleziona il settore per visualizzare le relative opzioni.';

  @override
  String get select_subsector_tooltip =>
      'Seleziona un sottosettore, visibile solo per il settore Industria.';

  @override
  String get reset_data => 'Azzera Selezioni';

  @override
  String get reset_data_tooltip =>
      'Clicca per ripristinare tutte le selezioni e tornare ai valori predefiniti.';
}
