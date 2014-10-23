class Claims::BillingsController < ApplicationController
  before_action :set_claim
  before_action :set_billing, only: [:show, :edit, :update, :destroy]

  # GET /billings
  # GET /billings.json
  def index
    @billings = @claim.billings
  end

  # GET /billings/1
  # GET /billings/1.json
  def show
    @line_items = @billing.line_items
    @line_item = @billing.line_items.build
  end

  # GET /billings/new
  def new
    @billing = @claim.billings.build
  end

  # GET /billings/1/edit
  def edit
  end

  # POST /billings
  # POST /billings.json
  def create
    @billing = @claim.billings.build(billing_params)

    respond_to do |format|
      if @billing.save
        format.html { redirect_to [@claim, @billing], notice: 'Billing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @billing }
      else
        format.html { render action: 'new' }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billings/1
  # PATCH/PUT /billings/1.json
  def update
    respond_to do |format|
      if @billing.update(billing_params)
        format.html { redirect_to [@claim, @billing], notice: 'Billing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billings/1
  # DELETE /billings/1.json
  def destroy
    @billing.destroy
    respond_to do |format|
      format.html { redirect_to billings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = @claim.billings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_params
      params.require(:billing).permit(:claim_id, :invoice_nbr, :invoice_date, :insurance_company_id, :attorney_id, :claimant_id, :subtotal, :total, :paid)
    end

    def set_claim
      @claim = Claim.find(params[:claim_id])
    end
end
