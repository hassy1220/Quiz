class Form::ChoiceCollection < Form::Base
  FORM_COUNT = 3
  attr_accessor :choices

# 　newアクションのnewでは()内は空。createアクションのnewでchoice_collection_paramsの値が引数で入る
  def initialize(attributes = {},final_answer = 0)
    super attributes
    self.choices = FORM_COUNT.times.map { Choice.new() } unless self.choices.present?
    unless final_answer == nil
      self.choices[final_answer.to_i - 1].answer = true unless final_answer == 0
    end
  end

  # # 上でsuper attributesとしているので必要
  def choices_attributes=(attributes)
    self.choices = attributes.map { |_, v|Choice.new(v) }
  end

  def save
  # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
    Choice.transaction do

      if self.choices.pluck(:answer).count(true) != 1
        return false
      end
      if self.choices.map(&:save!)
      else
      end

    end
      return true
    rescue
      # validates :description, presence: :trueに引っ掛かったら、resucue節でロールバックさせる
      return false
  end
end
