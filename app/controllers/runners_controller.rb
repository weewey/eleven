class RunnersController < ApplicationController
  before_action :set_runner, only: [:show, :edit, :update, :destroy]

  # GET /runners
  def index
    @runners = Runner.all
  end

  # GET /runners/1
  def show
  end

  # GET /runners/new
  def new
    @runner = Runner.new
  end

  # GET /runners/1/edit
  def edit
  end

  # POST /runners
  def create
    @runner = Runner.new(runner_params)

    if @runner.save
      redirect_to @runner, notice: 'Runner was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /runners/1
  def update
    if @runner.update(runner_params)
      redirect_to @runner, notice: 'Runner was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /runners/1
  def destroy
    @runner.destroy
    redirect_to runners_url, notice: 'Runner was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runner
      @runner = Runner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def runner_params
      params.fetch(:runner, {})
    end
end
