module Tax
  extend ActiveSupport::Concern

  RATE = 0.08

  class_methods do
    def tax_in(val)
      val * (1.0 + RATE)
    end
  end
end
