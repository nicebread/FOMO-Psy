library(exams)
library(rio)

exams2particify("quizzes/Skill1.Rmd", dir = "quizzes/Particify_export", 
  name = "skill1_quiz", abstention=TRUE)

# post-processing: clean the `correctOptions`column in the csv file for survey items
csv <- import("quizzes/Particify_export/skill1_quiz-1.csv")
csv$correctOptions <- ""
export(csv, "quizzes/Particify_export/skill1_quiz-1.csv")

