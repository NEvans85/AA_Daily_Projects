# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Alison')
User.create(username: 'Nick')
User.create(username: 'John')
User.create(username: 'Logan')
User.create(username: 'Alvin')

Poll.create(author_id: 1, title: 'time')
Poll.create(author_id: 2, title: 'who was that?')

Question.create(poll_id: 1, text: 'what time is it?')
Question.create(poll_id: 1, text: 'what time zone are you in?')
Question.create(poll_id: 1, text: 'is the sun down?')
Question.create(poll_id: 2, text: 'do you know that person?')
Question.create(poll_id: 2, text: 'can you introduce me?')

AnswerChoice.create(question_id: 1, text: '6 oclock')
AnswerChoice.create(question_id: 1, text: '8 oclock')
AnswerChoice.create(question_id: 3, text: 'yes')
AnswerChoice.create(question_id: 3, text: 'no')
AnswerChoice.create(question_id: 5, text: 'no')

Response.create(user_id: 4, answer_choice_id: 1)
Response.create(user_id: 4, answer_choice_id: 5)
Response.create(user_id: 5, answer_choice_id: 1)
Response.create(user_id: 4, answer_choice_id: 3)
Response.create(user_id: 2, answer_choice_id: 4)
