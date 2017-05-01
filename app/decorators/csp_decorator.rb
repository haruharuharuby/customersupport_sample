module CspDecorator
  def summaries
    [
      { display: nursery.name, path:"#" },
      { display: grade_i18n, path:"#" },
      { display: term, path:"#" },
      { display: number, path:"#" }
    ]
  end

  def term
    b = period_begin.strftime "%Y/%m/%d" if period_begin
    e = period_end.strftime "%Y/%m/%d" if period_end

    if b and e then b + "-" + e else '-' end
  end
end
