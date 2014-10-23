class CiteLetterPdf < Prawn::Document
	def initialize(claim, message)
    super(top_margin: 70)
    @claim = claim
    @message = message
    logo
    header
    intro
    appointment_info
    body
  end
  
  def logo
    image "#{Rails.root}/app/assets/images/gcs_logo.jpg", :position => :left, :width => 300, :scale => 0.5
    move_down 30
  end
  
  def header
    text "#{Date.today.strftime("%B %d, %Y")}"
    move_down 15
    text "#{@claim.claimant.full_name}"
		text "#{@claim.claimant.address}"
		text "#{@claim.claimant.city}, #{@claim.claimant.state.abbr} #{@claim.claimant.zip}"
		move_down 15
		text "Claim # #{@claim.number}"
  end

  def intro
  	move_down 30
  	text "Dear #{@claim.claimant.full_name},"
  	move_down 15
  	text "An independent medical evaluation has been scheduled for you at the request of #{@claim.adjustor.full_name} from #{@claim.adjustor.insurance_company.name} with:"
  end
  
  def appointment_info
  	move_down 20

  	data = [ ["Doctor:", "#{@claim.appointment.doctor.full_name}"],
					 ["Date:", "#{@claim.appointment.date.strftime("%B %d, %Y")}"],
					 ["Time:", "#{@claim.appointment.time.strftime("%I:%M %p")}"],
					 ["Location:", "#{@claim.appointment.doctor.address}"],
					 ["", "#{@claim.appointment.doctor.city}, #{@claim.appointment.doctor.state.abbr} #{@claim.appointment.doctor.zip}"] ]
		table(data, :position => 50) do
			cells.borders = []
			cells.padding = 1
			cells.font_style = :bold
			column(1).padding = [0, 0, 0, 30]
		end
  end

  def body
  	move_down 20
    if @message.present?
      text @message
      move_down 20
    end
  	text "This evaluation involves a detailed review of your history, medical records, x-rays, and the performance of a physical examiniation. Please bring with you any medical records and any x-ray films pertaining to your injury/illness. You can obtain x-ray films at the facilities where they were performed. (Please bring phone numbers/addresses of any providers you have seen regarding this injury.)"
  	move_down 20
  	data = [ ["1.", "PLEASE CALL THE SOUTHFIELD SCHEDULING OFFICE (248)-355-2220 UPON RECEIPT OF THIS LETTER TO CONFIRM THAT YOU WILL BE ATTENDING THIS APPOINTMENT AND/OR FOR DIRECTIONS."],
					 ["2.", "IF THERE IS A CONFLICT, with the date/or time of your appointment, please contact #{@claim.adjustor.full_name} at #{@claim.adjustor.phone}."] ]
		table(data, :position => 15) do
			cells.borders = []
			cells.padding = 1
			column(0).padding = [0, 5, 0, 0]
		end
		move_down 20
		text "We look forward to seeing you. If you have any questions please do not hesitate to call us."
		move_down 20
		text "Sincerely,"
		text "Global Claims Solutions LLC"
  end
  
end