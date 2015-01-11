class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
    @doctor = Doctor.new
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @appointments = @doctor.appointments
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @doctor }
      else
        format.html { render action: 'new' }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    begin
      @doctor.destroy
      flash[:success] = "Doctor successfully deleted." 
    rescue ActiveRecord::DeleteRestrictionError => e
      @doctor.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to doctors_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:first_name, :last_name, :address, :city, :state_id, :zip, :phone, :mobile, :notes, :fax, :email, :credentials, :active_practice, :board_certified, :ime_charge, :no_show_fee, :deposition_fee, :deposition_cancel_fee, :record_review_fee, :tax_id, :license_number, :approx_turn_around, :dictation_service_interest, :poc_first_name, :poc_last_name, :poc_phone, :poc_email)
    end
end
