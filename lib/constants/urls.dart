import 'package:mmg_companion/services/local_storage_service.dart';

String _username = LocalStorage.getPlanUsername()!;
String _password = LocalStorage.getPlanPassword()!;

String urlTodayOrLastSchoolDay =
    "http://$_username:$_password@www.montgelas-gymnasium.de/verps/M_Vertretungsplan_Schueler_heute.htm";
String urlNextSchoolDay =
    "http://$_username:$_password@www.montgelas-gymnasium.de/verps/M_Vertretungsplan_Schueler_naechster_Schultag.htm";
String urlSchoolDayAfterNextSchoolDay =
    "http://$_username:$_password@www.montgelas-gymnasium.de/verps/M_Vertretungsplan_Schueler_uebernaechster_Schultag.htm";
String urlElternportalKrankmeldungen =
    // "https://mmgyvil.eltern-portal.org/meldungen/krankmeldung";
    "https://mmgyvil.eltern-portal.org/";
