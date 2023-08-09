import 'package:mmg_companion/constants/plan_constants.dart';

// Convert a List to a Plan

List<List<String>> convertListToPlan(List<String> inputList) {
  List<List<String>> chunks = [];

  // Chopping the big inputList into smaller lists of size chunkSize.
  // These smaller lists end up becoming the columns of the plan.

  for (var i = 0; i < inputList.length; i += chunkSize) {
    chunks.add(
      inputList.sublist(
        i,
        i + chunkSize > inputList.length ? inputList.length : i + chunkSize,
      ),
    );
  }

  // Whenever a field is empty it gets replaced by the name of the field
  // so the user knows that.

  // This can only be done here because every plan runs through this function
  // when saved in local storage.

  if (chunks.isNotEmpty) {
    for (int i = 0; i < chunks.length; i++) {
      List<String> list = chunks[i];
      for (int k = 0; k < list.length; k++) {
        if (list[k].isEmpty) {
          list[k] = "[${columnNames[k]}]";
        }
      }
    }
  }

  // Here the lists/columns get sorted alphabetically

  // chunks.sort((a, b) {
  //   return a[0].compareTo(b[0]) == 0
  //       ? int.parse(a[1]).compareTo(int.parse(b[1]))
  //       : a[0].compareTo(b[0]);
  // });

  // But maybe sorting the columns according to the hour would be smarter.
  // This choice could be left to the user.

  chunks.sort((a, b) {
    return a[1].compareTo(b[1]) == 0
        ? a[0].compareTo(b[0])
        : int.parse(a[1]).compareTo(int.parse(b[1]));
  });

  return chunks;
}

// Convert a Plan to a List

List<String> convertPlanToList(List<List<String>> inputPlan) {
  List<String> outputList = [];

  for (List<String> row in inputPlan) {
    for (var value in row) {
      outputList.add(value);
    }
  }
  return outputList;
}
