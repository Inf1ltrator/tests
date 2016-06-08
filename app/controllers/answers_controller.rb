class AnswersController < ApplicationController
	#Фильтр для загрузки пользователя по user_id
	before_filter :set_user
	#Фильтр для проверки авторизации
	before_filter :signed_in, only:[:destroy, :edit, :update, :new, :create]
	#Фильтр для загрузки вопроса по id
	before_filter :set_answer, only:[:show, :destroy, :edit, :update, :create]

	def show
	end

	def new
		@answer = @user.answers.build
	end

	def create
		@answer = @user.answers.new(answers_params)
		@task.save
		redirect_to @system
	end

	def edit
	end

	def update
		@answer = @user.answers.update(answer_params)
		@answer.save
		redirect_to @user
	end

	def destroy
		@answer.destroy
		redirect_to @user
	end

	private

	def set_user
    	@user = User.find(params[:user_id])
  	end

  	def qestion_params
		params.require(:answer).permit(:name, :description, :score)
	end

	def set_answer
		@answer = Answer.find_by_id(params[:id])
	end
end
