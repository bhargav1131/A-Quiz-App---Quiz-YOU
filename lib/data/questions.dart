import 'package:quiz_app/models/quest_mod.dart';

const questions = [
  Quest(
      'What are the main building blocks of Flutter UIs?',

      // the first answer will be the corect answer of each and every questions to keep a tarck of the correct answer, but we will shuffle them before displaying
      [
        'Widgets',
        'Components',
        'Blocks',
        'Functions',
      ]),

  Quest(
    'How are Flutter UIs built?', 
      [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
      ]
    ),


  Quest(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      [
        'Statelesswidget',
        'StatefulWidget',
        'Both are equally good',
        'None of the above',
      ]
    )
];
