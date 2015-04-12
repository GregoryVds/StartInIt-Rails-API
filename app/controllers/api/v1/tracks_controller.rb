class Api::V1::TracksController < ApiController

  def index
    @tracks = Track.includes(:achievements).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
    @track = Track.includes(exercises: [:achievements, :exercisable]).find(params[:id])
  end

end