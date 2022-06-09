# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Quiz.create!(name: "Ruby基礎１")
Question.create!(quiz_id: 1,body: "ローカル変数の記述として適切なものはどれ")
Question.create!(quiz_id: 1,body: "予約後に該当するものはどれ？")
Question.create!(quiz_id: 1,body: "基礎指示子を指定することで何進数で解釈させるのか指定することができます。２進数と解釈させる基礎指示子はどれ？")
Choice.create!(question_id: 1,answer: false,body: "test-1")
Choice.create!(question_id: 1,answer: false,body: "test?")
Choice.create!(question_id: 1,answer: true,body: "test_1")
Choice.create!(question_id: 2,answer: false,body: "hash")
Choice.create!(question_id: 2,answer: true,body: "while")
Choice.create!(question_id: 2,answer: false,body: "ruby")
Choice.create!(question_id: 3,answer: true,body: "0b")
Choice.create!(question_id: 3,answer: false,body: "od")
Choice.create!(question_id: 3,answer: false,body: "0x")






