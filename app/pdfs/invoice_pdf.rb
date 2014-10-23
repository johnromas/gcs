class InvoicePdf < Prawn::Document
	def initialize(claim, billing)
    super(top_margin: 70)
    @claim = claim
    @billing = billing
    logo
    text "Hello"
  end
  
  def logo
    image "#{Rails.root}/app/assets/images/gcs_logo.jpg", :position => :left, :width => 300, :scale => 0.5
    move_down 30
  end
  
  
end