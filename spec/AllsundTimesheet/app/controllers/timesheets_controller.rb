class TimesheetsController < ApplicationController
  before_action :set_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /timesheets
  def index
    @timesheets = Timesheet.all
  end

  # GET /timesheets/1
  def show
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new
  end

  # GET /timesheets/1/edit
  def edit
  end

  # POST /timesheets
  def create
    @timesheet = Timesheet.new(timesheet_params)

    if @timesheet.save
      redirect_to @timesheet, notice: 'Timesheet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /timesheets/1
  def update
    if @timesheet.update(timesheet_params)
      redirect_to @timesheet, notice: 'Timesheet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /timesheets/1
  def destroy
    @timesheet.destroy
    redirect_to timesheets_url, notice: 'Timesheet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = Timesheet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def timesheet_params
      params.require(:timesheet).permit(:date, :employee_id, :activity_id, :day_id, :workstream_id, :notes)
    end
end
