# iQuiz : Part 1
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

### Part 1: Basic Interaction
* we need a TableView for the quizzes
* each element will lead the user to a list of questions
* so we start with the TableView filled with subjects
  * use Mathematics, Marvel Super Heroes, and Science
  * for now, use an in-memory array
  * make sure to build this as a UITableViewSource

### Part 1: TableView Cells
* icon on the left (any image works)
* subject: title (30 characters)
* description: short sentence

### Part 1: ToolBar across the top
* put a button on the Toolbar, title it "Settings"
* "Settings" should (for now) pop a UIAlertController
  * have it read "Settings go here" / "OK"

### Grading: 5 Points
* TableView appears with nonempty cells = 1pt
* TableView has the right number of cells = 1pt
* TableCells have the right data = 1pt
* TableCells display icons and subtext = 1pt
* Settings alert = 1pt

Due in 1 week (May 5th, 2016)

