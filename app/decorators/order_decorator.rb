module OrderDecorator
  def t_is_first_order()
    if self.is_first_order
      t("order.first_time")
    else
      t("order.experienced")
    end
  end

  def t_nursery_condition()
    if self.nursery_condition == 0
      t("order.operating")
    elsif self.nursery_condition == 1
      t("order.preparing_new")
    else self.nursery_condition == 2
      t("order.preparing_change")
    end
  end

  def t_is_ship_to_nursery()
    if self.is_ship_to_nursery
      t("order.ship_to_nursery")
    else
      t("order.other_place")
    end
  end

  def t_billing_ship_to()
    if self.billing_ship_to == 0
      t("order.ship_to_nursery")
    elsif self.billing_ship_to == 1
      t("order.ship_to_shipping")
    elsif self.billing_ship_to == 2
      t("order.other_place")
    end
  end

  def t_billing_name_option()
    if self.billing_name_option == 0
      t("order.billing_name_option_item1")
    elsif self.billing_name_option == 1
      t("order.billing_name_option_item2")
    elsif self.billing_name_option == 2
      t("order.billing_name_option_item3")
    end
  end

  def t_shipping_option()
    if self.shipping_option == 0
      t("order.ship_to_shipping")
    elsif self.shipping_option == 1
      t("order.ship_to_billing")
    elsif self.shipping_option == 2
      t("order.ship_to_nursery")
    end
  end
end
