# require 'capybara/rails'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'

# RSpecにCapybaraのDSLを設定
RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.register_driver :selenium do |app|
  # http://code.google.com/p/chromedriver/downloads/list
  # sudo mv ~/Downloads/chromedriver /usr/bin/
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

# Capybaraにseleniumを使うように設定
Capybara.default_driver = :selenium
Capybara.app_host = 'https://support-adm.com/'
# Capybara.app_host = 'http://localhost:3000/'


describe "Order" do

  before do
    visit '/orders/new'
  end

  it "display page" do
    expect(page).to have_content("アンケートキャンペーン専用注文ページ")
  end


  it "is NG by presence" do

    # click_link "Sign in"
    # テキストフィールドに入力し、ボタンをクリック(id, name, value属性などを指定できる)
    # fill_in 'order[applicant_nursery_attributes][organization_attributes][name]', with: '注文テスト１'
    page.check "privacy-aggreement-check"
    click_button "confirm_button"

    sleep(3)
    expect(page).to have_content("法人名を入力してください")
    sleep(1)
  end


  it "is second order just full information" do

    page.fill_in "order[org_nursery_name]", with: "社会福祉法人喜育園"
    page.fill_in "order[org_nursery_kana]", with: "てすといとう福祉会"
    page.fill_in "order[nursery_name]", with: "てすといとう保育園"
    page.fill_in "order[nursery_kana]", with: "てすといとうほいくえん"
    page.fill_in "order[nursery_postal]", with: "650-0003"
    sleep(2)
    page.fill_in "order[nursery_addr2]", with: "4-12-3"
    page.fill_in "order[nursery_phone]", with: "0120333333"
    page.fill_in "order[nursery_fax]", with: "0120333334"
    page.fill_in "order[nursery_email]", with: "cocktail.house@gmail.com"
    page.fill_in "order[nursery_responder_name]", with: "伊東知治"
    page.fill_in "order[nursery_responder_kana]", with: "いとうともはる"

    page.select "同法人の別施設で利用中", from: "order_is_first_order"
    page.fill_in "order[same_org_other_nursery_name]", with: "過去使用園いとう保育園"
    page.fill_in "order[same_org_other_nursery_phone]", with: "0968383795"
    sleep(1)
    page.select "別の場所に送る", from: "order_is_ship_to_nursery"
    page.fill_in "order[shipping_name]", with: "てすといとう保育園事務所"
    page.fill_in "order[shipping_kana]", with: "てすといとうほいくえんじむしょ"
    page.fill_in "order[shipping_postal]", with: "650-0011"
    sleep(2)
    page.fill_in "order[shipping_addr2]", with: "4-12-3"
    page.fill_in "order[shipping_phone]", with: "0120333333"
    page.fill_in "order[shipping_responder_name]", with: "伊東知治"
    page.fill_in "order[shipping_responder_kana]", with: "いとうともはる"

    page.select "別の場所に送る", from: "order_billing_ship_to"
    page.fill_in "order[billing_shipping_name]", with: "てすといとう保育園経理部"
    page.fill_in "order[billing_shipping_kana]", with: "てすといとうほいくえんじむしょけいりぶ"
    page.fill_in "order[billing_shipping_postal]", with: "650-0015"
    sleep(2)
    page.fill_in "order[billing_shipping_addr2]", with: "4-12-3"
    page.fill_in "order[billing_shipping_phone]", with: "0120333334"
    page.fill_in "order[billing_responder_name]", with: "伊東知治"
    page.fill_in "order[billing_responder_kana]", with: "いとうともはる"

    page.fill_in "order[contact_name]", with: "てすといとう保育園"
    page.fill_in "order[contact_kana]", with: "伊東知治"
    page.fill_in "order[contact_phone]", with: "0120444444"
    page.fill_in "order[contact_email]", with: "cocktail.house@gmail.com"

    page.check "privacy-aggreement-check"
    sleep(2)
    click_button "確認画面へ"

    sleep(2)
    expect(current_path).to match /orders/

    page.check "privacy-aggreement-check"
    click_button "アンケートへ進む"

    sleep(2)

    page.check "questionnaire_item1_check6"
    page.check "questionnaire_item1_check7"
    page.fill_in "questionnaire_item1_text", with: "テスト"
    page.choose "questionnaire_item2_radio_2"
    page.choose "questionnaire_item3_radio_2"
    page.check "questionnaire_item4_check9"
    page.check "questionnaire_item4_check10"
    page.check "questionnaire_item5_check10"
    page.choose "questionnaire_item6_radio_3"
    click_button "送信する"

    sleep(2)
  end

  it "send to nursery" do

    page.fill_in "order[org_nursery_name]", with: "社会福祉法人喜育園"
    page.fill_in "order[org_nursery_kana]", with: "てすといとう福祉会"
    page.fill_in "order[nursery_name]", with: "てすといとう保育園"
    page.fill_in "order[nursery_kana]", with: "てすといとうほいくえん"
    page.fill_in "order[nursery_postal]", with: "650-0003"
    sleep(2)
    page.fill_in "order[nursery_addr2]", with: "4-12-3"
    page.fill_in "order[nursery_phone]", with: "0120333333"
    page.fill_in "order[nursery_fax]", with: "0120333334"
    page.fill_in "order[nursery_email]", with: "cocktail.house@gmail.com"
    page.fill_in "order[nursery_responder_name]", with: "伊東知治"
    page.fill_in "order[nursery_responder_kana]", with: "いとうともはる"

    page.select "同法人の別施設で利用中", from: "order_is_first_order"
    page.fill_in "order[same_org_other_nursery_name]", with: "過去使用園いとう保育園"
    page.fill_in "order[same_org_other_nursery_phone]", with: "0968383795"

    page.select "別の場所に送る", from: "order_billing_ship_to"
    page.fill_in "order[billing_shipping_name]", with: "てすといとう保育園経理部"
    page.fill_in "order[billing_shipping_kana]", with: "てすといとうほいくえんじむしょけいりぶ"
    page.fill_in "order[billing_shipping_postal]", with: "650-0015"
    sleep(2)
    page.fill_in "order[billing_shipping_addr2]", with: "4-12-3"
    page.fill_in "order[billing_shipping_phone]", with: "0120333334"
    page.fill_in "order[billing_responder_name]", with: "伊東知治"
    page.fill_in "order[billing_responder_kana]", with: "いとうともはる"

    page.fill_in "order[contact_name]", with: "てすといとう保育園"
    page.fill_in "order[contact_kana]", with: "伊東知治"
    page.fill_in "order[contact_phone]", with: "0120444444"
    page.fill_in "order[contact_email]", with: "cocktail.house@gmail.com"

    page.check "privacy-aggreement-check"
    sleep(2)
    click_button "確認画面へ"

    sleep(2)
    expect(current_path).to match /orders/

    page.check "privacy-aggreement-check"
    click_button "アンケートへ進む"

    sleep(2)

    page.check "questionnaire_item1_check1"
    page.choose id: "questionnaire_item2_radio_1"
    page.choose "questionnaire_item3_radio_1"
    page.check "questionnaire_item4_check1"
    page.check "questionnaire_item5_check1"
    page.choose "questionnaire_item6_radio_1"
    click_button "送信する"

    sleep(2)
  end

  it "same to nursery and billing_ship" do

    page.fill_in "order[org_nursery_name]", with: "社会福祉法人喜育園"
    page.fill_in "order[org_nursery_kana]", with: "てすといとう福祉会"
    page.fill_in "order[nursery_name]", with: "てすといとう保育園"
    page.fill_in "order[nursery_kana]", with: "てすといとうほいくえん"
    page.fill_in "order[nursery_postal]", with: "650-0003"
    sleep(2)
    page.fill_in "order[nursery_addr2]", with: "4-12-3"
    page.fill_in "order[nursery_phone]", with: "0120333333"
    page.fill_in "order[nursery_fax]", with: "0120333334"
    page.fill_in "order[nursery_email]", with: "cocktail.house@gmail.com"
    page.fill_in "order[nursery_responder_name]", with: "伊東知治"
    page.fill_in "order[nursery_responder_kana]", with: "いとうともはる"

    page.select "同法人の別施設で利用中", from: "order_is_first_order"
    page.fill_in "order[same_org_other_nursery_name]", with: "過去使用園いとう保育園"
    page.fill_in "order[same_org_other_nursery_phone]", with: "0968383795"

    page.select "別の場所に送る", from: "order_billing_ship_to"
    page.fill_in "order[billing_shipping_name]", with: "てすといとう保育園経理部"
    page.fill_in "order[billing_shipping_kana]", with: "てすといとうほいくえんじむしょけいりぶ"
    page.fill_in "order[billing_shipping_postal]", with: "650-0003"
    sleep(2)
    page.fill_in "order[billing_shipping_addr2]", with: "4-12-4"
    page.fill_in "order[billing_shipping_phone]", with: "0120333333"
    page.fill_in "order[billing_responder_name]", with: "伊東知治"
    page.fill_in "order[billing_responder_kana]", with: "いとうともはる"

    page.fill_in "order[contact_name]", with: "てすといとう保育園"
    page.fill_in "order[contact_kana]", with: "伊東知治"
    page.fill_in "order[contact_phone]", with: "0120444444"
    page.fill_in "order[contact_email]", with: "cocktail.house@gmail.com"

    page.check "privacy-aggreement-check"
    sleep(2)
    click_button "確認画面へ"

    sleep(2)
    expect(current_path).to match /orders/

    page.check "privacy-aggreement-check"
    click_button "アンケートへ進む"

    sleep(2)

    page.check "questionnaire_item1_check1"
    page.choose id: "questionnaire_item2_radio_1"
    page.choose "questionnaire_item3_radio_1"
    page.check "questionnaire_item4_check1"
    page.check "questionnaire_item5_check1"
    page.choose "questionnaire_item6_radio_1"
    click_button "送信する"

    sleep(2)
  end

  it "is second order just full information" do

    page.fill_in "order[org_nursery_name]", with: "社会福祉法人喜育園"
    page.fill_in "order[org_nursery_kana]", with: "てすといとう福祉会"
    page.fill_in "order[nursery_name]", with: "てすといとう保育園"
    page.fill_in "order[nursery_kana]", with: "てすといとうほいくえん"
    page.fill_in "order[nursery_postal]", with: "111-0011"
    sleep(2)
    page.fill_in "order[nursery_addr2]", with: "4-12-3"
    page.fill_in "order[nursery_phone]", with: "0120333560"
    page.fill_in "order[nursery_fax]", with: "0120333334"
    page.fill_in "order[nursery_email]", with: "cocktail.house@gmail.com"
    page.fill_in "order[nursery_responder_name]", with: "伊東知治1"
    page.fill_in "order[nursery_responder_kana]", with: "いとうともはる1"

    page.select "同法人の別施設で利用中", from: "order_is_first_order"
    page.fill_in "order[same_org_other_nursery_name]", with: "過去使用園いとう保育園"
    page.fill_in "order[same_org_other_nursery_phone]", with: "0968383756"
    sleep(1)
    page.select "別の場所に送る", from: "order_is_ship_to_nursery"
    page.fill_in "order[shipping_name]", with: "てすといとう保育園事務所"
    page.fill_in "order[shipping_kana]", with: "てすといとうほいくえんじむしょ"
    page.fill_in "order[shipping_postal]", with: "650-0011"
    sleep(2)
    page.fill_in "order[shipping_addr2]", with: "4-12-3"
    page.fill_in "order[shipping_phone]", with: "0120333333"
    page.fill_in "order[shipping_responder_name]", with: "伊東知治"
    page.fill_in "order[shipping_responder_kana]", with: "いとうともはる"

    page.select "別の場所に送る", from: "order_billing_ship_to"
    page.fill_in "order[billing_shipping_name]", with: "てすといとう保育園経理部"
    page.fill_in "order[billing_shipping_kana]", with: "てすといとうほいくえんじむしょけいりぶ"
    page.fill_in "order[billing_shipping_postal]", with: "650-0015"
    sleep(2)
    page.fill_in "order[billing_shipping_addr2]", with: "4-12-3"
    page.fill_in "order[billing_shipping_phone]", with: "0120333334"
    page.fill_in "order[billing_responder_name]", with: "伊東知治"
    page.fill_in "order[billing_responder_kana]", with: "いとうともはる"

    page.select "使用園の法人名プラス施設名", from: "order_billing_name_option"
    sleep(1)
    page.select "運営母体変更前", from: "order_nursery_condition"
    page.fill_in "order[nursery_will_change_at]", with: "2017-05-05"
    page.select "商品送付先に送る", from: "order_shipping_option"


    page.fill_in "order[contact_name]", with: "てすといとう保育園"
    page.fill_in "order[contact_kana]", with: "伊東知治"
    page.fill_in "order[contact_phone]", with: "0120444444"
    page.fill_in "order[contact_email]", with: "cocktail.house@gmail.com"

    page.check "privacy-aggreement-check"
    sleep(2)
    click_button "確認画面へ"

    sleep(2)
    expect(current_path).to match /orders/

    page.check "privacy-aggreement-check"
    click_button "アンケートへ進む"

    sleep(2)

    page.check "questionnaire_item1_check1"
    page.choose id: "questionnaire_item2_radio_1"
    page.choose "questionnaire_item3_radio_1"
    page.check "questionnaire_item4_check1"
    page.check "questionnaire_item5_check1"
    page.choose "questionnaire_item6_radio_1"
    click_button "送信する"

    sleep(2)
  end

  it "is second order just org test" do

    page.fill_in "order[org_nursery_name]", with: "葉隠勇進 株式会社"
    page.fill_in "order[org_nursery_kana]", with: "てすといとう福祉会"
    page.fill_in "order[nursery_name]", with: "はがくれテスト伊東"
    page.fill_in "order[nursery_kana]", with: "てすといとうほいくえん"
    page.fill_in "order[nursery_postal]", with: "496-0001"
    sleep(2)
    page.fill_in "order[nursery_addr2]", with: "4-12-3"
    page.fill_in "order[nursery_phone]", with: "0789654123"
    page.fill_in "order[nursery_fax]", with: "0789654123"
    page.fill_in "order[nursery_email]", with: "cocktail.house@gmail.com"
    page.fill_in "order[nursery_responder_name]", with: "伊東知治1"
    page.fill_in "order[nursery_responder_kana]", with: "いとうともはる1"

    page.select "同法人の別施設で利用中", from: "order_is_first_order"
    page.fill_in "order[same_org_other_nursery_name]", with: "たんぽぽ保育園"
    page.fill_in "order[same_org_other_nursery_phone]", with: "0359266676"
    sleep(1)
    page.select "別の場所に送る", from: "order_is_ship_to_nursery"
    page.fill_in "order[shipping_name]", with: "てすといとう保育園事務所"
    page.fill_in "order[shipping_kana]", with: "てすといとうほいくえんじむしょ"
    page.fill_in "order[shipping_postal]", with: "650-0011"
    sleep(2)
    page.fill_in "order[shipping_addr2]", with: "4-12-3"
    page.fill_in "order[shipping_phone]", with: "0120333333"
    page.fill_in "order[shipping_responder_name]", with: "伊東知治"
    page.fill_in "order[shipping_responder_kana]", with: "いとうともはる"

    page.select "別の場所に送る", from: "order_billing_ship_to"
    page.fill_in "order[billing_shipping_name]", with: "てすといとう保育園経理部"
    page.fill_in "order[billing_shipping_kana]", with: "てすといとうほいくえんじむしょけいりぶ"
    page.fill_in "order[billing_shipping_postal]", with: "650-0015"
    sleep(2)
    page.fill_in "order[billing_shipping_addr2]", with: "4-12-3"
    page.fill_in "order[billing_shipping_phone]", with: "0120333334"
    page.fill_in "order[billing_responder_name]", with: "伊東知治"
    page.fill_in "order[billing_responder_kana]", with: "いとうともはる"

    page.select "使用園の法人名プラス施設名", from: "order_billing_name_option"
    sleep(1)
    page.select "運営母体変更前", from: "order_nursery_condition"
    page.fill_in "order[nursery_will_change_at]", with: "2017-05-05"
    page.select "商品送付先に送る", from: "order_shipping_option"


    page.fill_in "order[contact_name]", with: "てすといとう保育園"
    page.fill_in "order[contact_kana]", with: "伊東知治"
    page.fill_in "order[contact_phone]", with: "0120444444"
    page.fill_in "order[contact_email]", with: "cocktail.house@gmail.com"

    page.check "privacy-aggreement-check"
    sleep(2)
    click_button "確認画面へ"

    sleep(2)
    expect(current_path).to match /orders/

    page.check "privacy-aggreement-check"
    click_button "アンケートへ進む"

    sleep(2)

    page.check "questionnaire_item1_check1"
    page.choose id: "questionnaire_item2_radio_1"
    page.choose "questionnaire_item3_radio_1"
    page.check "questionnaire_item4_check1"
    page.check "questionnaire_item5_check1"
    page.choose "questionnaire_item6_radio_1"
    click_button "送信する"

    sleep(2)
  end

  it "is second order just org test" do

    page.fill_in "order[org_nursery_name]", with: "株式会社　葉隠勇進株式会社"
    page.fill_in "order[org_nursery_kana]", with: "てすといとう福祉会"
    page.fill_in "order[nursery_name]", with: "はがくれテスト伊東"
    page.fill_in "order[nursery_kana]", with: "てすといとうほいくえん"
    page.fill_in "order[nursery_postal]", with: "496-0001"
    sleep(2)
    page.fill_in "order[nursery_addr2]", with: "4-12-3"
    page.fill_in "order[nursery_phone]", with: "0789654123"
    page.fill_in "order[nursery_fax]", with: "0789654123"
    page.fill_in "order[nursery_email]", with: "cocktail.house@gmail.com"
    page.fill_in "order[nursery_responder_name]", with: "伊東知治1"
    page.fill_in "order[nursery_responder_kana]", with: "いとうともはる1"

    page.select "同法人の別施設で利用中", from: "order_is_first_order"
    page.fill_in "order[same_org_other_nursery_name]", with: "たんぽぽ保育園"
    page.fill_in "order[same_org_other_nursery_phone]", with: "0359266676"
    sleep(1)
    page.select "別の場所に送る", from: "order_is_ship_to_nursery"
    page.fill_in "order[shipping_name]", with: "てすといとう保育園事務所"
    page.fill_in "order[shipping_kana]", with: "てすといとうほいくえんじむしょ"
    page.fill_in "order[shipping_postal]", with: "650-0011"
    sleep(2)
    page.fill_in "order[shipping_addr2]", with: "4-12-3"
    page.fill_in "order[shipping_phone]", with: "0120333333"
    page.fill_in "order[shipping_responder_name]", with: "伊東知治"
    page.fill_in "order[shipping_responder_kana]", with: "いとうともはる"

    page.select "使用園の法人名プラス施設名", from: "order_billing_name_option"
    sleep(1)
    page.select "運営母体変更前", from: "order_nursery_condition"
    page.fill_in "order[nursery_will_change_at]", with: "2017-05-05"
    page.select "商品送付先に送る", from: "order_shipping_option"


    page.fill_in "order[contact_name]", with: "てすといとう保育園"
    page.fill_in "order[contact_kana]", with: "伊東知治"
    page.fill_in "order[contact_phone]", with: "0120444444"
    page.fill_in "order[contact_email]", with: "cocktail.house@gmail.com"

    page.check "privacy-aggreement-check"
    sleep(2)
    click_button "確認画面へ"

    sleep(2)
    expect(current_path).to match /orders/

    page.check "privacy-aggreement-check"
    click_button "アンケートへ進む"

    sleep(2)

    page.check "questionnaire_item1_check1"
    page.choose id: "questionnaire_item2_radio_1"
    page.choose "questionnaire_item3_radio_1"
    page.check "questionnaire_item4_check1"
    page.check "questionnaire_item5_check1"
    page.choose "questionnaire_item6_radio_1"
    click_button "送信する"

    sleep(2)
  end


  it "is NG so not input nursery. although monthly shipping to nursery." do

    page.fill_in "order[org_nursery_name]", with: "月間送付物使用園福祉会"
    page.fill_in "order[org_nursery_kana]", with: "げっかんそうふぶつしようへんふくしかい"
    page.fill_in "order[nursery_name]", with: "月間送付物使用園"
    page.fill_in "order[nursery_kana]", with: "げっかんそうふぶつしようえんほいくえん"

    page.select "同法人の別施設で利用中", from: "order_is_first_order"
    page.fill_in "order[same_org_other_nursery_name]", with: "たんぽぽ保育園"
    page.fill_in "order[same_org_other_nursery_phone]", with: "0359266676"
    sleep(1)
    page.select "別の場所に送る", from: "order_is_ship_to_nursery"
    page.fill_in "order[shipping_name]", with: "てすといとう保育園事務所"
    page.fill_in "order[shipping_kana]", with: "てすといとうほいくえんじむしょ"
    page.fill_in "order[shipping_postal]", with: "650-0011"
    sleep(2)
    page.fill_in "order[shipping_addr2]", with: "4-12-3"
    page.fill_in "order[shipping_phone]", with: "0120333333"
    page.fill_in "order[shipping_responder_name]", with: "伊東知治"
    page.fill_in "order[shipping_responder_kana]", with: "いとうともはる"

    page.select "使用園の法人名プラス施設名", from: "order_billing_name_option"
    sleep(1)
    page.select "運営母体変更前", from: "order_nursery_condition"
    page.fill_in "order[nursery_will_change_at]", with: "2017-05-05"
    page.select "請求書送付先に送る", from: "order_shipping_option"


    page.fill_in "order[contact_name]", with: "てすといとう保育園"
    page.fill_in "order[contact_kana]", with: "伊東知治"
    page.fill_in "order[contact_phone]", with: "0120444444"
    page.fill_in "order[contact_email]", with: "cocktail.house@gmail.com"

    page.check "privacy-aggreement-check"
    sleep(2)
    click_button "確認画面へ"

    expect(page).to have_content("郵便番号を入力してください")
  end


  it "is NG so not input nursery. although monthly shipping to nursery." do

    page.fill_in "order[org_nursery_name]", with: "月間送付物使用園福祉会"
    page.fill_in "order[org_nursery_kana]", with: "げっかんそうふぶつしようへんふくしかい"
    page.fill_in "order[nursery_name]", with: "月間送付物使用園"
    page.fill_in "order[nursery_kana]", with: "げっかんそうふぶつしようえんほいくえん"
    page.fill_in "order[nursery_postal]", with: "496-0001"
    sleep(2)
    page.fill_in "order[nursery_addr2]", with: "4-12-3"
    page.fill_in "order[nursery_phone]", with: "0789654123"
    page.fill_in "order[nursery_fax]", with: "0789654123"
    page.fill_in "order[nursery_email]", with: "cocktail.house@gmail.com"

    page.select "同法人の別施設で利用中", from: "order_is_first_order"
    page.fill_in "order[same_org_other_nursery_name]", with: "たんぽぽ保育園"
    page.fill_in "order[same_org_other_nursery_phone]", with: "0359266676"
    sleep(1)
    page.select "別の場所に送る", from: "order_is_ship_to_nursery"
    page.fill_in "order[shipping_name]", with: "てすといとう保育園事務所"
    page.fill_in "order[shipping_kana]", with: "てすといとうほいくえんじむしょ"
    page.fill_in "order[shipping_postal]", with: "650-0011"
    sleep(2)
    page.fill_in "order[shipping_addr2]", with: "4-12-3"
    page.fill_in "order[shipping_phone]", with: "0120333333"
    page.fill_in "order[shipping_responder_name]", with: "伊東知治"
    page.fill_in "order[shipping_responder_kana]", with: "いとうともはる"

    page.select "使用園の法人名プラス施設名", from: "order_billing_name_option"
    sleep(1)
    page.select "運営母体変更前", from: "order_nursery_condition"
    page.fill_in "order[nursery_will_change_at]", with: "2017-05-05"
    page.select "請求書送付先に送る", from: "order_shipping_option"


    page.fill_in "order[contact_name]", with: "てすといとう保育園"
    page.fill_in "order[contact_kana]", with: "伊東知治"
    page.fill_in "order[contact_phone]", with: "0120444444"
    page.fill_in "order[contact_email]", with: "cocktail.house@gmail.com"

    page.check "privacy-aggreement-check"
    sleep(2)
    click_button "確認画面へ"

    sleep(2)
    expect(current_path).to match /orders/

    page.check "privacy-aggreement-check"
    click_button "アンケートへ進む"

    sleep(2)

    page.check "questionnaire_item1_check1"
    page.choose id: "questionnaire_item2_radio_1"
    page.choose "questionnaire_item3_radio_1"
    page.check "questionnaire_item4_check1"
    page.check "questionnaire_item5_check1"
    page.choose "questionnaire_item6_radio_1"
    click_button "送信する"

    sleep(2)
  end

  it "is second order all postal and phone is same" do

    page.fill_in "order[org_nursery_name]", with: "社会福祉法人喜育園"
    page.fill_in "order[org_nursery_kana]", with: "てすといとう福祉会"
    page.fill_in "order[nursery_name]", with: "てすといとう保育園"
    page.fill_in "order[nursery_kana]", with: "てすといとうほいくえん"
    page.fill_in "order[nursery_postal]", with: "650-0003"
    sleep(2)
    page.fill_in "order[nursery_addr2]", with: "4-12-3"
    page.fill_in "order[nursery_phone]", with: "0120333334"
    page.fill_in "order[nursery_fax]", with: "0120333334"
    page.fill_in "order[nursery_email]", with: "cocktail.house@gmail.com"
    page.fill_in "order[nursery_responder_name]", with: "伊東知治1"
    page.fill_in "order[nursery_responder_kana]", with: "いとうともはる1"

    page.select "同法人の別施設で利用中", from: "order_is_first_order"
    page.fill_in "order[same_org_other_nursery_name]", with: "過去使用園いとう保育園"
    page.fill_in "order[same_org_other_nursery_phone]", with: "0968383756"
    sleep(1)
    page.select "別の場所に送る", from: "order_is_ship_to_nursery"
    page.fill_in "order[shipping_name]", with: "てすといとう保育園事務所"
    page.fill_in "order[shipping_kana]", with: "てすといとうほいくえんじむしょ"
    page.fill_in "order[shipping_postal]", with: "650-0003"
    sleep(2)
    page.fill_in "order[shipping_addr2]", with: "4-12-3"
    page.fill_in "order[shipping_phone]", with: "0120333334"
    page.fill_in "order[shipping_responder_name]", with: "伊東知治"
    page.fill_in "order[shipping_responder_kana]", with: "いとうともはる"

    page.select "別の場所に送る", from: "order_billing_ship_to"
    page.fill_in "order[billing_shipping_name]", with: "てすといとう保育園経理部"
    page.fill_in "order[billing_shipping_kana]", with: "てすといとうほいくえんじむしょけいりぶ"
    page.fill_in "order[billing_shipping_postal]", with: "650-0003"
    sleep(2)
    page.fill_in "order[billing_shipping_addr2]", with: "4-12-3"
    page.fill_in "order[billing_shipping_phone]", with: "0120333334"
    page.fill_in "order[billing_responder_name]", with: "伊東知治"
    page.fill_in "order[billing_responder_kana]", with: "いとうともはる"

    page.select "使用園の法人名プラス施設名", from: "order_billing_name_option"
    sleep(1)
    page.select "運営母体変更前", from: "order_nursery_condition"
    page.fill_in "order[nursery_will_change_at]", with: "2017-05-05"
    page.select "商品送付先に送る", from: "order_shipping_option"


    page.fill_in "order[contact_name]", with: "てすといとう保育園"
    page.fill_in "order[contact_kana]", with: "伊東知治"
    page.fill_in "order[contact_phone]", with: "0120444444"
    page.fill_in "order[contact_email]", with: "cocktail.house@gmail.com"

    page.check "privacy-aggreement-check"
    sleep(2)
    click_button "確認画面へ"

    sleep(2)
    expect(current_path).to match /orders/

    page.check "privacy-aggreement-check"
    click_button "アンケートへ進む"

    sleep(2)

    page.check "questionnaire_item1_check1"
    page.choose id: "questionnaire_item2_radio_1"
    page.choose "questionnaire_item3_radio_1"
    page.check "questionnaire_item4_check1"
    page.check "questionnaire_item5_check1"
    page.choose "questionnaire_item6_radio_1"
    click_button "送信する"

    sleep(2)
  end

end
