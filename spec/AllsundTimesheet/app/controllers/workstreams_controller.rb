class WorkstreamsController < ApplicationController
  before_action :set_workstream, only: [:show, :edit, :update, :destroy]

  # GET /workstreams
  def index
    @workstreams = Workstream.all
  end

  # GET /workstreams/1
  def show
  end

  # GET /workstreams/new
  def new
    @workstream = Workstream.new
  end

  # GET /workstreams/1/edit
  def edit
  end

  # POST /workstreams
  def create
    @workstream = Workstream.new(workstream_params)

    if @workstream.save
      redirect_to @workstream, notice: 'Workstream was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workstreams/1
  def update
    if @workstream.update(workstream_params)
      redirect_to @workstream, notice: 'Workstream was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workstreams/1
  def destroy
    @workstream.destroy
    redirect_to workstreams_url, notice: 'Workstream was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workstream
      @workstream = Workstream.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workstream_params
      params.require(:workstream).permit(:name, :notes)
    end
end
