ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Users" do
          ul do
            User.recent(40).map do |user|
              li link_to(user.email.capitalize, admin_user_path(user)) + " - Registered " + user.created_at.to_formatted_s(:short)
            end
          end
        end
      end

      column do
        panel "Recent Tracks" do
          ul do
            Track.recent(20).map do |track|
              li link_to(track.name, admin_track_path(track)) + " - " + pluralize(track.exercises.count, 'exercise')
            end
          end
        end

        panel "Recent Exercises" do
          ul do
            Exercise.recent(20).map do |exo|
              li link_to(exo.title, admin_exercise_path(exo)) + " - " + exo.track.name + " - " + exo.exercise_type.titleize
            end
          end
        end
      end
    end
  end
end