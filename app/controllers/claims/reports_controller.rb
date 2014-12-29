class Claims::ReportsController < ApplicationController
  before_action :set_claim
  before_action :set_report, only: [:show, :edit, :update, :destroy, :mercury_update]

  # GET /reports
  # GET /reports.json
  def index
    @reports = @claim.reports
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report_sections = @report.report_sections
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@claim, @report, view_context)
        send_data pdf.render, filename: "Report.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /reports/new
  def new
    @report = @claim.reports.build
    # 3.times { @report.report_sections.build }
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = @claim.reports.build(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to claim_report_path(@claim, @report, format: :pdf), notice: 'Report was successfully created.' }
        format.json { render action: 'show', status: :created, location: @report }
      else
        format.html { render action: 'new' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to claim_report_path(@claim, @report, format: :pdf), notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to claim_path(@claim) }
      format.json { head :no_content }
    end
  end

  def mercury_update
    report = @report
    report.content = params[:content][:report_content][:value]
    report.save!
    render text: ""
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = @claim.reports.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:date, :intro, :outro, :photo, report_sections_attributes: [:id, :title, :content, :_destroy])
    end

    def set_claim
      @claim = Claim.find(params[:claim_id])
    end
end
