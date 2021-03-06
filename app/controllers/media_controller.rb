class MediaController < ApplicationController
  before_action :set_medium, only: %i[ show edit update destroy ]
  before_action :set_results, only: :home

  def search
    @query = params[:query]
    return if @query.blank?

    if Search.exists? query: @query
      @results = Displayer.response_handler(Medium.multi_search(@query))
    else
      @results = Displayer.response_handler(Tmdb.new(@query).call)
      run_jobs
      @results
    end


    respond_to do |format|
      format.turbo_stream
    end
  end

  def modal
    @dom_id = params[:dom_id]
    @result = params[:result]

    respond_to do |format|
      format.turbo_stream
    end
  end

  def home
  end

  # GET /media or /media.json
  def index
    @media = Medium.all
  end

  # GET /media/1 or /media/1.json
  def show
  end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media or /media.json
  def create
    @medium = Medium.new(medium_params)

    respond_to do |format|
      if @medium.save
        format.html { redirect_to @medium, notice: "Medium was successfully created." }
        format.json { render :show, status: :created, location: @medium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/1 or /media/1.json
  def update
    respond_to do |format|
      if @medium.update(medium_params)
        format.html { redirect_to @medium, notice: "Medium was successfully updated." }
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1 or /media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.html { redirect_to media_url, notice: "Medium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_medium
    @medium = Medium.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def medium_params
    params.require(:medium).permit(:id, :title, :original_title, :name, :original_name, :first_air_date, :profile_path, :release_date, :overview, :poster_path, :popularity, :media_type, :created_at, :updated_at)
  end

  def set_results
    @results = { movies: [], tvs: [], people: [], movie_amount: 0, tv_amount: 0, person_amount: 0, multi_amount: 0 }.as_json
  end

  def run_jobs
    MediaSaverJob.perform_later(@results)
    SearchSaverJob.perform_later(@query)
  end

  def get_images
    images = @results["movies"].concat(@results["tvs"], @results["people"]).filter_map { |x| x["poster_path"] || x["profile_path"] }
  end
end
