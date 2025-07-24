/// Definisce le costanti stringa per le rotte principali dell'app AiVer.
/// Utilizzabile per evitare hardcoding di path nelle schermate e nel router.
class AppRoutes {
  // 🏠 Home page principale
  static const String home = '/';

  // ⚙️ Pagina delle opzioni e impostazioni generali
  static const String options = '/opzioni';

  // 📋 Visualizzazione checklist complete
  static const String checklist = '/checklist';

  // ❗ Gestione e inserimento incidenti e near miss
  static const String incidenti = '/incidenti';

  // 📢 Segnalazioni e rapporti generici
  static const String segnalazioni = '/segnalazioni';

  // 🏗️ Wizard per creazione nuovo sito/cantiere (sessione)
  static const String wizardSessione = '/wizard_sito';

// 📦 (In futuro) route per riepilogo sessione, ispezione, profili, ecc.
// static const String sessionDetail = '/sessione/:id';
// static const String ispezione = '/ispezione/:id';
}
