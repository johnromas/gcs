module ClaimsHelper
	def referral_label(array)
		content_tag :div, class: "col-xs-2" do 
			array.map do |label|
					concat(content_tag :p, content_tag(:strong,  label), class: "strong text-right")
			end
		end
	end

	def referral_value(array, size)
		content_tag :div, class: "col-xs-#{size}" do
			array.map do |value|
				concat(content_tag :p, value, class: "text-left")
			end
		end
	end
end