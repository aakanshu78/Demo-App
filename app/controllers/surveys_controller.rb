class SurveysController < ApplicationController
  before_action :signed_in_user, only: [:index, :update, :create, :result]
  before_action :correct_user, only: :show
  
  def index
      @survey = current_user.surveys.build
      @survey_items = current_user.questions.paginate(page: params[:page]) if signed_in?
      
  end

  def create
      @survey = current_user.surveys.build
      @new_survey = Survey.create!(survey_param)
      @errors = ActiveModel::Errors.new(self)
=begin
      if @new_survey.save!
          flash[:success] = "New survey created!"
          debugger
          redirect_to '/survey/'
       else
         flash[:error] = "All the elements are required fields!!"
         redirect_to '/survey/'
       end
=end
  end

  def result
    @user_surveys = current_user.surveys
  end

  def update
    instance = Stat.find_by(:user_id, current_user.id)

    @survey = params[:survey]
    ques = Survey.find(@survey[:survey_id])
    ques.option_a_count += 1 if @survey[:option_a]
    ques.option_b_count += 1 if @survey[:option_b]
    ques.option_c_count += 1 if @survey[:option_c]
    ques.option_d_count += 1 if @survey[:option_d]
    ques.answer_count += 1
    ques.save

    unless Stat.find_by(:user_id, current_user.id)
      result = Stat.create!(user_id: current_user.id, survey_id: @survey[:survey_id],
                  answered: true)
    end
    @survey_items = current_user.questions.paginate(page: params[:page])
  end

  private

  def survey_param
    params.require(:survey).permit(:question, :option_a, :option_b, :option_c, :option_d, :user_id)
  end

end
