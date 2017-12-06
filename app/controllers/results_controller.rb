class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @toptwenty = Result.select(:name, :average).order(average: :DESC).limit(20)
    @top_twenty_passing_schools = []

    @toptwenty.each do|top|
    @top_twenty_passing_schools.push({
      :label => top.name,
      :value => top.average
    })
   end

    @chart = Fusioncharts::Chart.new({
    :height => '600',
    :width => '800',
    :type => 'column2d',
    :renderAt => 'chart-container',
    :dataSource => {
        :chart => {
            :caption => 'Twenty Top Performing Schools From 2014 To 2016',
            :xAxisname => 'Schools Names',
            :yAxisName => 'Pass Rate Average',
            :xAxisnameFontSize => '14',
            :yAxisNameFontSize => '14',
            :captionFontSize => '18',
            :theme => 'ocean',
            :format => '#,##',
            :bgColor => '#f0d2ff',
            :showBorder => '0',
            :borderAlpha => '50',

        },
        :data => @top_twenty_passing_schools
    }
})



    @results = Result.all
    if params[:search]
     @results = Result.search(params[:search]).order("name ASC")
    else
     @results = Result.all.order("name ASC")
    end


    respond_to do |format|
    format.html
    format.json { render json: @results }
    end
  
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @pass = Result.find(params[:id])
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:emis, :centre_no, :name, :wrote_2014, :passed_2014, :wrote_2015, :passed_2015, :wrote_2016, :passed_2016)
    end
end
