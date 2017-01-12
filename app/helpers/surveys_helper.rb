module SurveysHelper

    def answered(id)
        Stat.find_by(user_id: current_user.id, survey_id: id).blank?
    end
end
