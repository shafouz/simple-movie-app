class MediaController < ApplicationController
  before_action :set_medium, only: %i[ show edit update destroy ]
  before_action :set_results, only: :index

  def search
    # params[:media_type] = movies, tv or person
    # params[:query] = query
    if !(Search.exists? params[:query])
      Search.create(query: params[:query])
      @results = Tmdb.new(params[:query]).call
      MediaSaverJob.perform_now(@results)
      @results
    else
      @results = Medium.multi_search(params[:query])
    end
    respond_to do |format|
      format.turbo_stream
    end
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
    params.fetch(:medium, {})
  end

  def set_results
    @results = { movies: [], tvs: [], people: [], movie_amount: 0, tv_amount: 0, person_amount: 0, multi_amount: 0 }
  end
end
