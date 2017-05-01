class Questionnaire < ActiveRecord::Base
  belongs_to :order

  validate :answerd?

  def answerd?
    res = false
    item1_answerd = false
    7.times do |time|
      if self.send("item1_check#{time+1}")
        item1_answerd = true
        break
      end
    end

    item2_answerd = false
    if self.send("item2_radio") > 0
      item2_answerd = true
    end

    item3_answerd = false
    if self.send("item3_radio") > 0
      item3_answerd = true
    end

    item4_answerd = false
    10.times do |time|
      if self.send("item4_check#{time+1}")
        item4_answerd = true
        break
      end
    end

    item5_answerd = false
    10.times do |time|
      if self.send("item5_check#{time+1}")
        item5_answerd = true
        break
      end
    end

    item6_answerd = false
    if self.send("item6_radio") > 0
      item6_answerd = true
    end

    unless item1_answerd
      errors.add(:item1, I18n.t("questionnaire.not_answer"))
    end

    unless item2_answerd
      errors.add(:item2, I18n.t("questionnaire.not_answer"))
    end

    unless item3_answerd
      errors.add(:item3, I18n.t("questionnaire.not_answer"))
    end

    unless item4_answerd
      errors.add(:item4, I18n.t("questionnaire.not_answer"))
    end

    unless item5_answerd
      errors.add(:item5, I18n.t("questionnaire.not_answer"))
    end

    unless item6_answerd
      errors.add(:item6, I18n.t("questionnaire.not_answer"))
    end

  end
end
