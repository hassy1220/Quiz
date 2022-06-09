class Choice < ApplicationRecord
  belongs_to:question
#   validate :validate_true_unique

  # choicesのうちtrue
#   def validate_true_unique
#     if question.choices.exists?(answer: true)
#         if answer == true
#             return
#         end
#     end
#     #   errors.add("trueは1つまでです。")
#   end
end
