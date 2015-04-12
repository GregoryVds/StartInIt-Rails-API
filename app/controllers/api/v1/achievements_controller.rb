class Api::V1::AchievementsController < ApiController
    
  def create
    achievement = Achievement.find_or_create_by({user: current_user, achievable_id: params[:achievement][:exercise_id], achievable_type: 'Exercise'})
    respond_with(achievement, location: nil)
  end

end