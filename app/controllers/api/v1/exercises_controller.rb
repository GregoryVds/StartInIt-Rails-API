class Api::V1::ExercisesController < ApiController

  def show
    @exercise = Exercise.find(params[:id])
  end

end