class Api::V1::TracksController < ApiController

  def index
    @tracks = Track.paginate(page: params[:page], per_page: params[:per_page])
  end

end