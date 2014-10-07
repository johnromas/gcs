class ClaimsController < ApplicationController
  before_action :set_claim, only: [:show, :edit, :update, :destroy]
  before_action :check_params, only: [:create, :update]
  # GET /claims
  # GET /claims.json
  def index
    @claims = Claim.all
    @claim = Claim.new
    @claim.build_appointment
    @claim.build_claimant
    respond_to do |format|
      format.html
      format.xml { render xml: @claims }
      format.json { render json: @claims }
    end
    # @appointment = @claim.appointments.build(appointment_params)
  end

  # GET /claims/1
  # GET /claims/1.json
  def show
    @claimant = @claim.claimant
    @appointment = @claim.appointment
    @doctor = @appointment.doctor if @appointment.present?
    @adjustor = @claim.adjustor
    @insurance_company = @claim.insurance_company
  end

  # GET /claims/new
  def new
    @claim = Claim.new
    @claim.build_appointment
    @claim.build_claimant
  end

  # GET /claims/1/edit
  def edit
  end

  # POST /claims
  # POST /claims.json
  def create
    @claim = Claim.new(claim_params)

    binding.pry
    respond_to do |format|
      if @claim.save
        format.html { redirect_to claims_path, notice: 'Claim was successfully created.' }
        format.json { render action: 'show', status: :created, location: @claim }
      else
        format.html { render action: 'new' }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claims/1
  # PATCH/PUT /claims/1.json
  def update
    respond_to do |format|
      if @claim.update(claim_params)
        format.html { redirect_to @claim, notice: 'Claim was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claims/1
  # DELETE /claims/1.json
  def destroy
    @claim.destroy
    respond_to do |format|
      format.html { redirect_to claims_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim
      @claim = Claim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claim_params
      params.require(:claim).permit(:number, :claimant_id, :insurance_company_id, :adjustor_id, :doctor_id, :attorney_id, :service, :insured, :case, :date_of_injury, appointment_attributes: [:id, :date, :time, :doctor_id], claimant_attributes: [:id, :first_name, :last_name, :address, :city, :state_id, :zip, :phone, :mobile, :email, :ssn, :dob, :gender, :notes])
    end

    #Remove unnecessary attributes when creating/updating claimant info
    def check_params
      if !params[:claim][:claimant_id].blank?
        params[:claim].delete(:claimant_attributes)
      else
        params[:claim].delete(:claimant_id)
      end
    end
end
