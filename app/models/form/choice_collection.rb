class Form::ChoiceCollection < Form::Base
  FORM_COUNT = 3
  attr_accessor :choices

  def initialize(attributes = {})
    super attributes
    self.choices = FORM_COUNT.times.map { Choice.new() } unless self.choices.present?
  end

  # # 上でsuper attributesとしているので必要
  def choices_attributes=(attributes)
    self.choices = attributes.map { |_, v|Choice.new(v) }
  end

  def save
    # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
    Choice.transaction do
      self.choices.map(&:save!)
    end
  end
end
