class AnswerListsController < ApplicationController
	#Фильтр для загрузки пользователя по user_id
	before_filter :set_user
	#Фильтр для проверки авторизации
	before_filter :signed_in, only:[:show]
	#Фильтр для загрузки ответов по id
	before_filter :set_answer_list, only:[:show]

	def show
		@answers = @answer_list.answers
	end

	private

	def set_user
    	@user = User.find(params[:user_id])
  	end

	def set_answer_list
		@answer_list = AnswerList.find_by_id(params[:id])
	end
end
