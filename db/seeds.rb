# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# begin
#   AdminUser.create!(email: "admin@support-adm.com", password:"admin00++")
# rescue => e
#   puts e
# end

begin
  csp1 = Csp.create!(number: "OPL-10000", password:"test", period_begin: "2016-01-01", period_end: "2017-12-31", grade:1)
  csp2 = Csp.create!(number: "OPL-20000", password:"test", period_begin: "2016-01-01", period_end: "2017-12-31", grade:1)
rescue => e
  puts e
end

begin
  nursery1 = Nursery.create!(name:"アドム保育園1(テスト)", kana:"あどむほいくえん1", postal_code:"100-0000", address1:"愛知県津島市1", address2:"1", phone:"1000000000", email: "test@admcom.co.jp", responder:"加藤真由美", dm_number: "00000", csp_id: csp1.id, status: 1)
  nursery2 = Nursery.create!(name:"アドム保育園2(テスト)", kana:"あどむほいくえん2", postal_code:"200-0000", address1:"愛知県津島市2", address2:"2", phone:"2000000000", email: "test@admcom.co.jp", responder:"加藤真由美", dm_number: "10000", csp_id: csp2.id, status: 1)
rescue => e
  puts e
end

begin
  billing1 = Billing.create(nursery_id: nursery1.id, billing_type:0)
rescue => e
  puts e
end

begin
  CspBillingRelation.create(csp_id: csp1.id, billing_id: billing1.id)
  CspBillingRelation.create(csp_id: csp2.id, billing_id: billing1.id)
rescue => e
  puts e
end

c = Campaign.create name: "わんぱくランチアンケートキャンペーン", term_begin: "2016/01/01", term_end:"2018/01/01", description:"わんぱくランチを割引価格で購入するには、下のアンケートにお答えください。", product_id:1, discount: 198000
Questionnaire.create(name: "question1")

# questions = {
#   where_do_you_know: {question_type: 1, selection_index: "0,1,2,3,4,5,6,7"},
#   what_do_you_use_other_software: {question_type: 2, selection_index: "8,9,10"},
#   do_you_check_other_software: {question_type: 2,  selection_index: "11,12,13"},
#   why_do_you_select: {question_type: 1,  selection_index: "14,15,16,17,18,19,20,21,22,6,7"},
#   which_do_you_interested_in: {question_type: 1,  selection_index: "23,24,25,26,27,28,29,30,31,32"},
#   do_you_know_mail_magazine: {question_type: 2,  selection_index: "33,34,35"},
#   tell_me_your_expectation: {question_type: 0,  selection_index: "36"}
# }

# # 0:text, 1:check, 2:radio
#
# selection_items = [
#   {name:"dm", element:"check_box"},
#   {name:"hp", element:"check_box"},
#   {name:"invite_from_friends", element:"check_box"},
#   {name:"advertize_on_magazine", element:"check_box"},
#   {name:"advertize_on_fax",　element:"check_box"},
#   {name:"already_use_other_groups", element: "check_box"},
#   {name:"more", element:"check_box"},
#   {name:"more_text", element:"text_field"},
#
#   {name:"already_use", element:"radio_button"},
#   {name:"already_use_text", element:"text_field"},
#   {name:"not_use", element:"radio_button"},
#
#   {name:"yes_use_other_software", element:"radio_button"},
#   {name:"yes_what_software_do_you_use", element:"text_field"},
#   {name:"not_use_other_software", element:"radio_button"},
#
#   {name:"price", element:"check_box"},
#   {name:"feature", element:"check_box"},
#   {name:"easy_to_use", element:"check_box"},
#   {name:"dedicated_knowledges", element:"check_box"},
#   {name:"support", element:"check_box"},
#   {name:"catalogs", element:"check_box"},
#   {name:"achievement", element:"check_box"},
#   {name:"popularity", element:"check_box"},
#   {name:"guarantee", element:"check_box"},
#
#   {name:"monthly_menu", element:"check_box"},
#   {name:"menu_report", element:"check_box"},
#   {name:"wanpakkun", element:"check_box"},
#   {name:"recipe", element:"check_box"},
#   {name:"user_report", element:"check_box"},
#   {name:"mail_magazine", element:"check_box"},
#   {name:"blog", element:"check_box"},
#   {name:"video", element:"check_box"},
#   {name:"meeting", element:"check_box"},
#   {name:"selling", element:"check_box"},
#
#   {name:"mm_registered", element:"radio_button"},
#   {name:"mm_not_registered", element:"radio_button"},
#   {name:"mm_not_know", element:"radio_button"},
#
#   {name:"expected", element:"text_area"}
# ]

# question_records = []
# questions.each do |name, selections|
#   record = Questionnaire.create name: name, question_type: selections[:question_type], campaign_id: c.id
#   question_records << record
# end
#
# selection_item_records = []
# selection_items.each do |item|
#   record = SelectionItem.create name: item[:name], element: item[:element]
#   selection_item_records << record
# end
#
# question_records.each do |r|
#   values = questions[r.name.to_sym][:selection_index].split(",")
#   puts values
#   values.each do |s|
#     QuestionnaireSelectionItemRelation.create questionnaire_id: r.id, selection_item_id: selection_item_records[s.to_i].id
#   end
# end

# Coupon.create code: "BbNum2", expired: "2018/03/18", product_id: 1, reduce_price: 72000, campaign_id: 1
Product.create name: 'わんぱくランチ', price: 270000, support_begin: "2016-01-01", support_end: "2017-01-01", version: "5.0.0.0"
Product.create name: 'カスタマーサポートプログラム(CSP)', price: 36900, support_begin: "2016-01-01", support_end: "2017-01-01", version: "5.0.0.0"
