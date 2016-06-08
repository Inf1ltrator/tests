class BlanksController < ApplicationController

	before_filter :signed_in, only:[:destroy, :edit, :update, :new, :create]
	#Фильтр для загрузки пользователя 
	before_filter :load_user
	#Фильтр для загрузки бланка по id
	before_filter :set_blank, only:[:testing_form, :show, :destroy, :edit, :update, :create]

	def index
	  @blanks = Blank.all
	end

	def show
	  @questions = @blank.questions
	end

	def new
      @blank = Blank.new
	end

	def create
	  @blank = Blank.new(blank_params)
	  @blank.save
	  redirect_to @blank
	end

	def edit
	end

	def update
	  @blank = Blank.update(blank_params)
	  @blank.save
	  redirect_to @blank
	end 

	def destroy
	  @blank.destroy
	  redirect_to @user
	end

	def testing_form
	  @questions = @blank.questions
	end

	def testing_complite

		@answers[] = params[:answers]

		if @answers != nil
			@answers.each do |ans|
			end
		end

		redirect_to @user

	end

	private

	def blank_params
		params.require(:blank).permit(:name,:description)
	end

	def set_blank
		@blank = Blank.find_by_id(params[:id])
	end

end
