class ReportPdf < Prawn::Document
  include ActionView::Helpers::SanitizeHelper
	def initialize(claim, report, view)
    super(top_margin: 70)
    @claim = claim
    @report = report
    @sections = @report.report_sections
    @view = view
    # Footer
    repeat :all do
      bounding_box [bounds.left, bounds.bottom + 22], width: bounds.width do
        self.line_width = 3
        stroke do
          horizontal_line 115, 425
        end
        move_down 5
        text "29877 Telegraph Rd, Suite 250, Southfield, MI 48034", size: 10, align: :center, style: :bold
      end
    end
    # Everything after footer
    bounding_box [bounds.left, bounds.top + 15], width: bounds.width, height: bounds.height - 16 do
      logo
      bill_to
      header
      report_text
    end
  end
  
  def logo
    image "#{Rails.root}/app/assets/images/gcs_logo.jpg", :position => :left, :width => 300, :scale => 0.5
    move_down 30
  end

  def header
    if @report.photo.present?
      image open("#{@report.photo}"), :position => :right, :at => [360, 550], :width => 140, :scale => 0.5
    else
      image "#{Rails.root}/app/assets/images/1.jpg", :position => :right, :at => [360, 550], :width => 140, :scale => 0.5
    end
    text Date.today.strftime("%B %d, %Y")
    move_down 10
    text "#{@claim.insurance_company.name}"
    text "#{@claim.insurance_company.address}"
    text "#{@claim.insurance_company.city}, #{@claim.insurance_company.state.abbr} #{@claim.insurance_company.zip}"
    move_down 10
    text "Attention: #{@claim.adjustor.full_name}"
    text "DOB: #{@claim.claimant.dob.strftime("%m/%d/%y")}"
    text "Claim #: #{@claim.number}"
    move_down 20
    text "RE: #{@claim.claimant.full_name}"
    move_down 30
  end

  def report_text
    text "Dear #{@claim.adjustor.full_name},"
    move_down 20
    text "#{@report.intro}", leading: 12
    move_down 20
    @sections.each do |section|
      text "#{section.title}", size: 14, style: :bold
      text "#{section.content}", leading: 12
      move_down 20
    end
    text "#{@report.outro}", leading: 12
  end

  def bill_to
    bounding_box([325, 690], :width => 200, :height => 150) do
      text "Global Claims Solutions LLC", size: 10, align: :right
      text "29877 Telegraph Rd", size: 10, align: :right
      text "Suite 250", size: 10, align: :right
      text "Southfield, MI 48034", size: 10, align: :right
      text "Phone: 248-355-2220", size: 10, align: :right
      text "Fax: 989-391-9362", size: 10, align: :right
    end
  end
end