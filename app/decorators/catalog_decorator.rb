module CatalogDecorator
  def selections
    items = {}
    items["none"] = t("questionnaire.none")
    items["yahoo"] = t("questionnaire.yahoo")
    items["friends"] = t("questionnaire.friends")
    items["dm"] = t("questionnaire.dm")
    items["magazine"] = t("questionnaire.magazine")
    items
  end
end
