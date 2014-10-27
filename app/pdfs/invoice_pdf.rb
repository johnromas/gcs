class InvoicePdf < Prawn::Document
	def initialize(claim, billing, view)
    super(top_margin: 70)
    @claim = claim
    @billing = billing
    @view = view
    repeat :all do
      bounding_box [bounds.left, bounds.bottom + 33], width: bounds.width do
        text "Global Claims Solutions LLC", size: 10, align: :center
        text "1000 Washington Ave. P.O. Box 603, Bay City, MI 48707", size: 10, align: :center
        text "Office: 989-213-1144 | Fax: 989-391-9362", size: 10, align: :center
      end
    end
    bounding_box [bounds.left, bounds.top], width: bounds.width, height: bounds.height - 16 do
      logo
      bill_to
      customer_info
      line_items
      summary
      footer
    end
  end
  
  def logo
    image "#{Rails.root}/app/assets/images/gcs_logo.jpg", :position => :left, :width => 300, :scale => 0.5
    move_down 30
  end

  def bill_to
    bounding_box([0, 600], :width => 200, :height => 100) do
      text "Bill To:"
      move_down 10
      text "#{@billing.insurance_company.name}"
      text "#{@billing.insurance_company.address}"
      text "#{@billing.insurance_company.city}, #{@billing.insurance_company.state.abbr} #{@billing.insurance_company.zip}"
      text "#{@claim.adjustor.full_name}"
    end
    bounding_box([350, 700], :width => 200, :height => 100) do
      text "INVOICE", :color => "b13136", :size => 25, :style => :bold
      text "Invoice Number:    #{@billing.invoice_nbr}"
      text "Invoice Date:         #{@billing.invoice_date.strftime("%D")}"
      text "Page:                     1"
      move_down 5
      text "Federal Tax ID:      47-0994291"
    end
  end

  def customer_info
    move_down 100
    table_data = [["Customer", "Claimant", "Payment Terms"],
                  ["#{@claim.insurance_company.name}", "#{@claim.claimant.full_name}", "Due Upon Receipt"]]
    table(table_data, :column_widths => [180, 180, 180], :row_colors => ["FFFFFF", "DDDDDD"]) do
      # cells.borders = []
      cells.padding = 1
      cells.align = :center
      row(0).font_style = :bold
      # cells.font_style = :bold
      # column(1).padding = [0, 0, 0, 30]
    end
  end

  def line_items
    move_down 30
    table_data = [["Qty", "Date", "CPT Code", "Description", "Unit Price", "Total" ]]
    array = []
    @billing.line_items.each do |item|
      array << [item.quantity, item.billing.invoice_date.strftime("%D"), item.cpt_code, item.description, @view.number_to_currency(item.unit_price), @view.number_to_currency(item.total)] unless item.id.nil?
      array 
    end
    table_data += array

    table(table_data, :column_widths => [50, 70, 70, 200, 70, 80], :row_colors => ["FFFFFF", "DDDDDD"]) do
      # cells.borders = []
      # cells.padding = 1
      row(0).font_style = :bold
      # cells.font_style = :bold
      # column(1).padding = [0, 0, 0, 30]
      column(4..5).align = :right

    end
  end

  def summary
    table_data = [["", "", "", "Invoice Total", "", "#{@view.number_to_currency(@billing.total)}" ]]
    

    table(table_data, :column_widths => [50, 70, 70, 200, 70, 80], :row_colors => ["FFFFFF", "DDDDDD"]) do
      # cells.borders = []
      # cells.padding = 1
      row(0).font_style = :bold
      # cells.font_style = :bold
      # column(1).padding = [0, 0, 0, 30]
      column(4..5).align = :right

    end
  end

  # def bill_to
  #   draw_text "#{@billing.insurance_company.name}", :at => [200, 300]

  #                 "#{@billing.insurance_company.address}"
  #                 "#{@billing.insurance_company.city}, #{@billing.insurance_company.state.abbr} #{@billing.insurance_company.zip}"
  #                 "#{@claim.adjustor.full_name}",
  #                 :at => [0, 650],
  #                 :height => 100,
  #                 :width => 100
  # end
  def footer
    # # image "#{Rails.root}/app/assets/images/gcs_banner.jpg", :position => :center, :width => 300, :scale => 0.5, :vposition => :bottom
    # text "Global Claims Solutions LLC", :align => :center, :valign => :bottom
    # text "1000 Washington Ave", align: :center, valign: :bottom
    # move_down 10
    # stroke_horizontal_rule

  end
  
  
end