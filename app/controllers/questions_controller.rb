class QuestionsController < ApplicationController

	#Фильтр для загрузки бланка по blank_id
	before_filter :set_blank
	#Фильтр для проверки авторизации
	before_filter :signed_in, only:[:destroy, :edit, :update, :new, :create]
	#Фильтр для загрузки вопроса по id
	before_filter :set_question, only:[:show, :destroy, :edit, :update, :create]

	def show
	end

	def new
		@question = @blank.questions.build
	end

	def create
		@question = @blank.questions.new(question_params)
		@question.save
		redirect_to testing_form_blank_path(@blank)
	end

	def edit
	end

	def update
		@question = @blank.questions.update(question_params)
		@question.save
		redirect_to @blank
	end

	def destroy
		@question.destroy
		redirect_to @blank
	end

	private

	def set_blank
    	@blank = Blank.find(params[:blank_id])
  	end

  	def question_params
		params.require(:question).permit(:name, :description, :answer1, :answer2)
	end

	def set_question
		@question = Question.find_by_id(params[:id])
	end

end
