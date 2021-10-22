import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: FutureBuilder<Task>(
              future: getSampleTask(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data != null) {
                  final task = snapshot.data!;
                  return SurveyKit(
                    onResult: (SurveyResult result) {
                      print(result.finishReason);
                    },
                    task: task,
                    themeData: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.cyan,
                      ).copyWith(
                        onPrimary: Colors.white,
                      ),
                      primaryColor: Colors.cyan,
                      backgroundColor: Colors.white,
                      appBarTheme: const AppBarTheme(
                        color: Colors.white,
                        iconTheme: IconThemeData(
                          color: Colors.cyan,
                        ),
                        textTheme: TextTheme(
                          button: TextStyle(
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                      iconTheme: const IconThemeData(
                        color: Colors.cyan,
                      ),
                      outlinedButtonTheme: OutlinedButtonThemeData(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(150.0, 60.0),
                          ),
                          side: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return const BorderSide(
                                  color: Colors.grey,
                                );
                              }
                              return const BorderSide(
                                color: Colors.cyan,
                              );
                            },
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          textStyle: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return Theme.of(context).textTheme.button?.copyWith(
                                      color: Colors.grey,
                                    );
                              }
                              return Theme.of(context).textTheme.button?.copyWith(
                                    color: Colors.cyan,
                                  );
                            },
                          ),
                        ),
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            Theme.of(context).textTheme.button?.copyWith(
                                  color: Colors.cyan,
                                ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<Task> getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the \n Survey App',
          text: 'Thank you for heelping me with the survey.\n I would ned a little more info about yourself',
          buttonText: 'Let\'s go!',
        ),
        QuestionStep(
          title: 'Whats your name?',
          answerFormat: const TextAnswerFormat(
            maxLines: 1,
            hint: 'Please enter your Name',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'How old are you?',
          answerFormat: const IntegerAnswerFormat(
            defaultValue: 25,
            hint: 'Please enter your age (Optional)',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Student?',
          text: 'Are you a student?',
          answerFormat: const BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'Choose your emotion',
          answerFormat: const SingleChoiceAnswerFormat(textChoices: [
            TextChoice(text: 'Happy', value: 'Happy'),
            TextChoice(text: 'Stressed', value: 'Stressed'),
            TextChoice(text: 'Sad', value: 'Sad'),
            TextChoice(text: 'Relaxed', value: 'Relaxed'),
          ]),
        ),
        QuestionStep(
          title: 'How are you feeling today?',
          answerFormat: const SingleChoiceAnswerFormat(textChoices: [
            TextChoice(text: 'Happy', value: 'Happy'),
            TextChoice(text: 'Stressed', value: 'Stressed'),
            TextChoice(text: 'Sad', value: 'Sad'),
            TextChoice(text: 'Relaxed', value: 'Relaxed'),
          ]),
        ),
        QuestionStep(
          stepIdentifier: StepIdentifier(id: 'Happy'),
          title: 'Happy?',
          answerFormat: const SingleChoiceAnswerFormat(textChoices: [
            TextChoice(text: 'Happy', value: 'Happy'),
            TextChoice(text: 'Excited', value: 'Excited'),
            TextChoice(text: 'Energetic', value: 'Energetic'),
          ]),
        ),
        QuestionStep(
          stepIdentifier: StepIdentifier(id: 'Sad'),
          title: 'Sad?',
          answerFormat: const SingleChoiceAnswerFormat(textChoices: [
            TextChoice(text: 'Sad', value: 'Sad'),
            TextChoice(text: 'Calm', value: 'Calm'),
            TextChoice(text: 'Depressed', value: 'Depressed'),
            TextChoice(text: 'Bored', value: 'Bored'),
            TextChoice(text: 'Gloomy', value: 'Gloomy'),
            TextChoice(text: 'Miserable', value: 'Miserable'),
          ]),
        ),
        QuestionStep(
          stepIdentifier: StepIdentifier(id: 'Stressed'),
          title: 'Stressed?',
          answerFormat: const SingleChoiceAnswerFormat(textChoices: [
            TextChoice(text: 'Stress', value: 'Stress'),
            TextChoice(text: 'Frustrated', value: 'Frustrated'),
            TextChoice(text: 'Anger', value: 'Anger'),
            TextChoice(text: 'Afraid', value: 'Afraid'),
          ]),
        ),
        QuestionStep(
          stepIdentifier: StepIdentifier(id: 'Relaxed'),
          title: 'Relaxed?',
          answerFormat: const SingleChoiceAnswerFormat(textChoices: [
            TextChoice(text: 'Calm', value: 'Calm'),
            TextChoice(text: 'Relaxed', value: 'Relaxed'),
            TextChoice(text: 'Satisfied', value: 'Satisfied'),
            TextChoice(text: 'Tired', value: 'Tired'),
            TextChoice(text: 'Sleepy', value: 'Sleepy'),
          ]),
        ),
        QuestionStep(
          title: 'When did you go to sleep?',
          answerFormat: const TimeAnswerFormat(
            defaultValue: TimeOfDay(
              hour: 22,
              minute: 0,
            ),
          ),
        ),
        QuestionStep(
          title: 'When did you wake up?',
          answerFormat: const TimeAnswerFormat(
            defaultValue: TimeOfDay(
              hour: 6,
              minute: 0,
            ),
          ),
        ),
        QuestionStep(
          title: 'How active were you today?',
          answerFormat: const ScaleAnswerFormat(
            step: 1,
            minimumValue: -2,
            maximumValue: 2,
            defaultValue: 0,
            minimumValueDescription: '-2',
            maximumValueDescription: '2',
          ),
        ),
        QuestionStep(
          title: 'How will you rate your happiness?',
          answerFormat: const ScaleAnswerFormat(
            step: 1,
            minimumValue: -2,
            maximumValue: 2,
            defaultValue: 0,
            minimumValueDescription: '-2',
            maximumValueDescription: '2',
          ),
        ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text: 'Thank You for taking the survey!',
          title: 'Done!',
          buttonText: 'Submit survey',
        ),
      ],
    );

    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[5].stepIdentifier,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Happy":
              return task.steps[6].stepIdentifier;
            case "Stressed":
              return task.steps[8].stepIdentifier;
            case "Sad":
              return task.steps[7].stepIdentifier;
            case "Relaxed":
              return task.steps[9].stepIdentifier;
            default:
              return null;
          }
        },
      ),
    );

    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[6].stepIdentifier,
      navigationRule: DirectNavigationRule(task.steps[10].stepIdentifier),
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[7].stepIdentifier,
      navigationRule: DirectNavigationRule(task.steps[10].stepIdentifier),
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[8].stepIdentifier,
      navigationRule: DirectNavigationRule(task.steps[10].stepIdentifier),
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[9].stepIdentifier,
      navigationRule: DirectNavigationRule(task.steps[10].stepIdentifier),
    );
    return Future.value(task);
  }
}