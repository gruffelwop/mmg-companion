import 'package:flutter/material.dart';

class TODOS extends StatelessWidget {
  const TODOS({super.key});

  // Updating existing features

  // Push Notifications
  // TODO: Implement Push Notifications Settings
  // TODO: Option to disable push notifications

  // UX
  // TODO: Replace all instances of GestureDetector() with an actual button!!
  // TODO: input fields should span over multiple lines (courses and classes inputs)
  // TODO: Animations!
  // TODO: Date doesn't update on refresh (today's date, plan view)

  // Making code more maintainable
  // TODO: Implement the Custom Form Widget
  // TODO: Use ListView.builder() to completely automate the start page settings!
  // TODO: Use my custom (stateless) widgets in LoginView(); especially for the TextFormFields!!!

  // Absences View
  // TODO: Implement absenzen view that can be disabled in settings (extra section heading titled ‚absences‘)

  // Statistics View
  // TODO: Login into the 'Elternportal'
  // TODO: actual graph with all days of the week and a 'days before a 'Klausur'' column
  // TODO: unterneath this 'Säulendiagram' place a ListView of all days where you weren't there

  // Profile View
  // TODO: Implement Profile Page
  // TODO: could add profiles, so you can quickly switch between your friends’ plan and yours.

  // Experimental features
  // TODO: I could show a GIF that changes on every reload in the ListView that is shown when the condition is true aka when the ListView would otherwise be empty. (custom_refresh_indicator_widget)
  // TODO: Implement a color picker (experimental)
  // TODO: (Swappable column views when swiped to the right. So you can swipe on a Column view and that replaces it with maybe the column view from the day after tomorrow. This would be saved.) [very difficult to do, because the SchoolDayAfterNextSchoolDay View is the only view I can work with, but it’s already frequently used. Give it a try nonetheless] [really??]

  // Performance
  // TODO: Don't make API calls directly in the main() function;
  // TODO: Call the API in the HomeView Widget instead (using a shiver effect)
  // TODO: Save the html files in dedicated local storage objects
  // TODO: save the plan’s data to the local storage using multiple threads

  // Auto update
  // TODO: automatically update the plan views every 2 minutes or so when between 07:30 and 08:00
  // TODO: app should automatically update on midnight (Dates & Vertretungen)

  // Error handling
  // TODO: Error Handeling in case of password being wrong (when the password changes for example)

  // Ideas
  // TODO: If possible, get screen size and depending on height, show different amounts of bottom margin so that it doesn't cut into the listviews themselves (mainly plan view, but will effect other views as well)
  // TODO: We could use the kind of padding that snap chat uses in its camera view. It has like rounded corner padding just under the phones top bar. MIGHT look good.
  // TODO: Could use the credentials for the 'Elternportal' for registering them in the backend

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
