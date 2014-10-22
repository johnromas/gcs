class AdjustorsController < ApplicationController
  before_action :set_adjustor, only: [:show, :edit, :update, :destroy]

  # GET /adjustors
  # GET /adjustors.json
  def index
    @adjustors = Adjustor.all
    @adjustor = Adjustor.new
  end

  # GET /adjustors/1
  # GET /adjustors/1.json
  def show
  end

  # GET /adjustors/new
  def new
    @adjustor = Adjustor.new
  end

  # GET /adjustors/1/edit
  def edit
  end

  # POST /adjustors
  # POST /adjustors.json
  def create
    @adjustor = Adjustor.new(adjustor_params)

    respond_to do |format|
      if @adjustor.save
        format.html { redirect_to adjustors_path, notice: 'Adjustor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @adjustor }
      else
        format.html { render action: 'new' }
        format.json { render json: @adjustor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adjustors/1
  # PATCH/PUT /adjustors/1.json
  def update
    respond_to do |format|
      if @adjustor.update(adjustor_params)
        format.html { redirect_to @adjustor, notice: 'Adjustor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @adjustor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adjustors/1
  # DELETE /adjustors/1.json
  def destroy
    @adjustor.destroy
    respond_to do |format|
      format.html { redirect_to adjustors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adjustor
      @adjustor = Adjustor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adjustor_params
      params.require(:adjustor).permit(:insurance_company_id, :first_name, :last_name, :email, :phone, :mobile, :notes)
    end
end
