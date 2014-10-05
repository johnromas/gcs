class ClaimantsController < ApplicationController
  before_action :set_claimant, only: [:show, :edit, :update, :destroy]

  # GET /claimants
  # GET /claimants.json
  def index
    @claimants = Claimant.all
    @claimant = Claimant.new
  end

  # GET /claimants/1
  # GET /claimants/1.json
  def show
  end

  # GET /claimants/new
  def new
    @claimant = Claimant.new
  end

  # GET /claimants/1/edit
  def edit
  end

  # POST /claimants
  # POST /claimants.json
  def create
    @claimant = Claimant.new(claimant_params)

    respond_to do |format|
      if @claimant.save
        format.html { redirect_to claimants_path, notice: 'Claimant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @claimant }
      else
        format.html { render action: 'new' }
        format.json { render json: @claimant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claimants/1
  # PATCH/PUT /claimants/1.json
  def update
    respond_to do |format|
      if @claimant.update(claimant_params)
        format.html { redirect_to @claimant, notice: 'Claimant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @claimant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claimants/1
  # DELETE /claimants/1.json
  def destroy
    @claimant.destroy
    respond_to do |format|
      format.html { redirect_to claimants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claimant
      @claimant = Claimant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claimant_params
      params.require(:claimant).permit(:first_name, :last_name, :address, :city, :state_id, :zip, :phone, :mobile, :notes, :email, :ssn, :dob, :gender)
    end
end
