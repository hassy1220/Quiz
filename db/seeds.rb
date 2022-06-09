# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline
Quiz.create!(name: "Ruby基礎１")
Question.create!(quiz_id: 1,body: "ローカル変数の記述として適切なものはどれ")
Question.create!(quiz_id: 1,body: "予約後に該当するものはどれ？")
Question.create!(quiz_id: 1,body: "基礎指示子を指定することで何進数で解釈させるのか指定することができます。２進数と解釈させる基礎指示子はどれ？")
Question.create!(quiz_id: 1,body: "以下メソッドの実行結果として正しいものはどれ")
Question.find(4).image.attach(io: File.open("#{Rails.root}/db/fixtures/question_10.png"), filename:"question_1.png")
Question.create!(quiz_id: 1,body: "以下メソッドの実行結果として正しいものはどれ")
Question.find(5).image.attach(io: File.open("#{Rails.root}/db/fixtures/question_3.png"), filename:"question_3.png")
Question.create!(quiz_id: 1,body: "以下メソッドの実行結果として正しいものはどれ")
Question.find(6).image.attach(io: File.open("#{Rails.root}/db/fixtures/question_5.png"), filename:"question_5.png")
Question.create!(quiz_id: 1,body: "以下メソッドの実行結果として正しいものはどれ")
Question.find(7).image.attach(io: File.open("#{Rails.root}/db/fixtures/question_6.png"), filename:"question_6.png")
Question.create!(quiz_id: 1,body: "以下メソッドの実行結果として正しいものはどれ")
Question.find(8).image.attach(io: File.open("#{Rails.root}/db/fixtures/question_7.png"), filename:"question_7.png")
Question.create!(quiz_id: 1,body: "以下メソッドの実行結果として正しいものはどれ")
Question.find(9).image.attach(io: File.open("#{Rails.root}/db/fixtures/question_8.png"), filename:"question_8.png")
Question.create!(quiz_id: 1,body: "以下メソッドの実行結果として正しいものはどれ")
Question.find(10).image.attach(io: File.open("#{Rails.root}/db/fixtures/question_9.png"), filename:"question_9.png")
Question.create!(quiz_id: 1,body: "以下メソッドの実行結果として正しいものはどれ")
Question.find(11).image.attach(io: File.open("#{Rails.root}/db/fixtures/question_11.png"), filename:"question_11.png")

Choice.create!(question_id: 1,answer: false,body: "test-1")
Choice.create!(question_id: 1,answer: false,body: "test?")
Choice.create!(question_id: 1,answer: true,body: "test_1")
Choice.create!(question_id: 2,answer: false,body: "hash")
Choice.create!(question_id: 2,answer: true,body: "while")
Choice.create!(question_id: 2,answer: false,body: "ruby")
Choice.create!(question_id: 3,answer: true,body: "0b")
Choice.create!(question_id: 3,answer: false,body: "od")
Choice.create!(question_id: 3,answer: false,body: "0x")

Choice.create!(question_id: 4,answer: true,body: "2")
Choice.create!(question_id: 4,answer: false,body: "1")
Choice.create!(question_id: 4,answer: false,body: "1 and 2")
Choice.create!(question_id: 5,answer: false,body: "a is {a}")
Choice.create!(question_id: 5,answer: true,body: "a is 1")
Choice.create!(question_id: 5,answer: false,body: "NameError")
Choice.create!(question_id: 6,answer: true,body: "12")
Choice.create!(question_id: 6,answer: false,body: "12ab3")
Choice.create!(question_id: 6,answer: false,body: "ab")

Choice.create!(question_id: 7,answer: true,body: "2")
Choice.create!(question_id: 7,answer: false,body: "1")
Choice.create!(question_id: 7,answer: false,body: "1 && 2")
Choice.create!(question_id: 8,answer: true,body: "3")
Choice.create!(question_id: 8,answer: false,body: "0")
Choice.create!(question_id: 8,answer: false,body: "nill")
Choice.create!(question_id: 9,answer: true,body: "abcd")
Choice.create!(question_id: 9,answer: false,body: "ab""+""cd")
Choice.create!(question_id: 9,answer: false,body: "ab")

Choice.create!(question_id: 10,answer: false,body: "1.9")
Choice.create!(question_id: 10,answer: true,body: "1")
Choice.create!(question_id: 10,answer: false,body: "19")
Choice.create!(question_id: 11,answer: true,body: "nill")
Choice.create!(question_id: 11,answer: false,body: "3")
Choice.create!(question_id: 11,answer: false,body: "NameError")





