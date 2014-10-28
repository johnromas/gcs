class InvoicePdf < Prawn::Document
	def initialize(claim, billing, view)
    super(top_margin: 70)
    @claim = claim
    @billing = billing
    @view = view
    ## Footer
    repeat :all do
      bounding_box [bounds.left, bounds.bottom + 75], width: bounds.width do
        text "Please Remit Payment To:", size: 16, align: :center, style: :bold
        text "Global Claims Solutions LLC", size: 14, align: :center
        text "1000 Washington Ave. P.O. Box 603, Bay City, MI 48707", size: 12, align: :center
        text "Office: 989-213-1144 | Fax: 989-391-9362", size: 12, align: :center
        text "Federal ID: 47-0994291", size: 12, align: :center
      end
    end
    ## Everything after footer
    bounding_box [bounds.left, bounds.top], width: bounds.width, height: bounds.height - 16 do
      logo
      bill_to
      # customer_info
      line_items
      summary
    end
  end
  
  def logo
    image "#{Rails.root}/app/assets/images/gcs_logo.jpg", :position => :left, :width => 300, :scale => 0.5
    move_down 30
  end

  def bill_to
    bounding_box([0, 575], :width => 200, :height => 150) do
      text "INVOICE", :color => "b13136", :size => 25, :style => :bold
      move_down 10
      text "Bill To:"
      move_down 10
      text "#{@billing.insurance_company.name}"
      text "#{@billing.insurance_company.address}"
      text "#{@billing.insurance_company.city}, #{@billing.insurance_company.state.abbr} #{@billing.insurance_company.zip}"
      text "#{@claim.adjustor.full_name}"
    end
    bounding_box([310, 540], :width => 400, :height => 200) do
      # text "Invoice Number:    #{@billing.invoice_nbr}"
      # text "Invoice Date:         #{@billing.invoice_date.strftime("%D")}"
      # text "Examinee: #{@claim.claimant.full_name}"
      # text "Claim Number: #{@claim.number}"
      # text "Expert: #{@claim.appointment.doctor.full_name}"
      # text "Terms: Due Upon Receipt"
      # move_down 5
      table_data = [["Invoice Number:", "#{@billing.invoice_nbr}" ], ["Invoice Date:", "#{@billing.invoice_date.strftime("%D")}"], ["Examinee:", "#{@claim.claimant.full_name}"], ["Claim Number:", "#{@claim.number}"], ["Expert:", "#{@claim.appointment.doctor.full_name}"], ["Terms:", "Due Upon Receipt"]]
      table(table_data, :cell_style => { :size => 10}) do
        cells.font_size = 8
        cells.borders = []
        cells.padding = 1
        column(0).font_style = :bold
        # cells.font_style = :bold
        column(1).padding = [0, 0, 0, 10]
        column(1).align = :left

    end

    end
    bounding_box([325, 690], :width => 200, :height => 150) do
      text "Global Claims Solutions LLC", size: 10, align: :right
      text "1000 Washington Ave.", size: 10, align: :right
      text "P.O. Box 603", size: 10, align: :right
      text "Bay City, MI 48707", size: 10, align: :right
      text "Phone: 989-213-1144", size: 10, align: :right
      text "Fax: 989-391-9362", size: 10, align: :right
      text "www.globalclaimssolutionsllc.com", size: 10, align: :right
    end
  end

  # def customer_info
  #   move_down 20
  #   table_data = [["Customer", "Claimant", "Payment Terms"],
  #                 ["#{@claim.insurance_company.name}", "#{@claim.claimant.full_name}", "Due Upon Receipt"]]
  #   table(table_data, :column_widths => [180, 180, 180], :row_colors => ["FFFFFF", "DDDDDD"]) do
  #     # cells.borders = []
  #     cells.padding = 1
  #     cells.align = :center
  #     row(0).font_style = :bold
  #     # cells.font_style = :bold
  #     # column(1).padding = [0, 0, 0, 30]
  #   end
  # end

  def line_items
    move_down 150
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
end