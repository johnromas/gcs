module ApplicationHelper
	def line_item_url_helper(line_item)
    billing = line_item.billing
    claim = billing.claim
    [claim, billing, line_item]
  end
end
