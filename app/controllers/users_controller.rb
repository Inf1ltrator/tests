class UsersController < ApplicationController


	#Фильтр для проверки авторизации
	before_filter :signed_in
	#Фильтр для загрузки юзера по id
	before_filter :set_user, only:[:show]

	def show
		@answer_lists = @user.answer_lists
	end

	def index
		@users = User.all
	end
	
	private

	def set_user
		@user = User.find_by_id(params[:id])
	end

end
