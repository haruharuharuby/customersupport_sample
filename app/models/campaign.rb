class Campaign < ActiveRecord::Base

  has_many :orders
  has_many :questionnaires
  accepts_nested_attributes_for :questionnaires

  has_many :answers

  validate :paticipatable?

  def answer(params)
    params['questionnaires_attributes'].each do |qk, qv|

      checked_items = qv['selection_items_attributes'].select do |k, v|
        v['selected'] == '1' || ((v['element'] == 'text_field' || v['element'] == 'text_area') && v['selected'].present?)
      end

      checked_items.each do |sk, sv|
        a  = Answer.new
        a.campaign_id = self.id
        a.questionnaire_id = qv['id'].to_i
        a.selection_item_id = sv['id'].to_i
        a.free_format_text = sv['selected']
        a.save
      end

    end
  end

  def paticipatable?
    self.questionnaires.each do |q|
      unless q.answered?
        errors.add(:questionnaires, I18n.t("questionnaire.not_answer", q:I18n.t("questionnaire.item_#{q.id}")))
      end
    end
  end


  def integer?(str)
    begin
      str.to_i
      true
    rescue
      false
    end
  end
end
