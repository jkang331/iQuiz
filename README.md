# iQuiz
INFO 498 - Project 8
iQuiz: A Multiple-Choice Q-and-A application

### Project Description
* users can choose from a collection of quizzes
* each quiz has a number (1-to-many) of questions
* each question is a multiple-choice answer
* users progress through each question one at a time
* app will track their answers
* app could upload their scores
* quizzes are updated from a server

### Table of Contents
[Part 1](#part-1) • [Part 2](#part-2) • [Part 3](#part-3)

------


## Part 1
#### Basic Interaction
* we need a TableView for the quizzes
* each element will lead the user to a list of questions
* so we start with the TableView filled with subjects
  * use Mathematics, Marvel Super Heroes, and Science
  * for now, use an in-memory array
  * make sure to build this as a UITableViewSource

#### TableView Cells
* icon on the left (any image works)
* subject: title (30 characters)
* description: short sentence

#### ToolBar across the top
* put a button on the Toolbar, title it "Settings"
* "Settings" should (for now) pop a UIAlertController
  * have it read "Settings go here" / "OK"

#### Grading: 5 Points
* TableView appears with nonempty cells = 1pt
* TableView has the right number of cells = 1pt
* TableCells have the right data = 1pt
* TableCells display icons and subtext = 1pt
* Settings alert = 1pt

Due in 1 week (May 5th, 2016)

------

## Part 2
#### The Quizzes
* when the user selects a quiz, take them to the first"question" scene [DONE]
* when the user selects an answer in the "question" scene,take them to the "answer" scene [DONE]
* when the user pushes "next" from the "answer" scene... [DONE]
  * ... if there are more questions, take them to the next"question" scene [DONE]
  * ... if there are no questions left, take them to the "finished"scene [DONE]
* when the users pushes the "back" button, they go back to the main list of topics [DONE]

#### "Question" Scene
* UI elements required
  * question text [DONE]
* four answer possibilities (only one of which can be selected) [TODO: DOUBLE CHECK]
  * a "submit" button to indicate they are ready to go on [DONE]
* layout is totally up to you [DONE]

#### "Answer" Scene
* UI elements required
  * question text [DONE]
  * the correct answer text [DONE]
  * some indicator whether they got it right or wrong [DONE]
  * a "next" button to indicate they are ready to go on [DONE]
* layout is totally up to you [DONE]

#### "Finished" Scene
* UI elements required
  * some kind of descriptive text ("Perfect!" "Almost!" etc) [DONE]
  * the user's score on the quiz (x of y correct) [DONE]
  * a "next" button to indicate they are ready to go on [DONE]
* layout is totally up to you [DONE]

#### Grading: 5 points
* question scene acts as intended: 1 pt
* answer scene acts as intended: 1 pt
* finished scene acts as intended: 1 pt
* segues to each scene: 1 pt
* "back" button goes to the beginning: 1 pt

Extra credit:
* use "swipe gestures" alongside of buttons
  * swipe right to go to next scene: 1 pt
  * swipe left to abandon quiz and return to list: 1 pt

DUE: 1 week (May 12, 2016)

------

## Part 3
#### Network and Storage
* all quizzes/questions should come from online [DONE]
* store the quizzes/questions to local storage [DONE]
* if offline, use locally-stored data [TODO: DOUBLE CHECK]
* initial URL to use: http://tednewardsandbox.site44.com/questions.json [DONE]
* Settings should be a popover
  * include a URL field to use instead of the above [TODO: DOUBLE CHECK]
  * include a "check now" button to retrieve [TODO: DOUBLE CHECK]

#### Grading: 5 points
* download JSON from site: 1 pt 
* store JSON to local storage: 1 pt 
* use local storage offline: 2 pt
* refresh on Settings "check now": 1 pt

Extra credit:
* implement "pull to refresh": 1 pt
* central score storage:
   * upload scores to central storage: 1 pt
  * add new toolbar button and popover for scores: 1 pt
  * change icon in quiz list to reflect score: 1 pt

DUE: 1 week (May 12, 2016)


