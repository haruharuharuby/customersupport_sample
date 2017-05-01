class AdmMailer < ApplicationMailer
  # NOTIFY_ADDRESSES = ["ito@tinms.net","takagi@admcom.co.jp"]
  NOTIFY_ADDRESSES = ["ito@tinms.net"]

  def order_complete(to, order)
    @order = order
    # mail(to: [to, 'adm@admcom.co.jp'], subject: I18n.t("order.subject", name:order.nursery_name))
    mail(to: [to, 'ito@tinms.net'], subject: I18n.t("order.subject", name:order.nursery_name))
  end

end
