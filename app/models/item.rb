class Item < ApplicationRecord

  CLEARANCE_PRICE_PERCENTAGE  = BigDecimal("0.75")

  belongs_to :style
  belongs_to :clearance_batch, optional: true

  scope :sellable, -> { where(status: 'sellable') }

  def clearance!
    update_attributes!(status: 'clearanced',
                       price_sold: style.wholesale_price * CLEARANCE_PRICE_PERCENTAGE)
  end

end
