########################################
# File:languages_controler.rb
# Porpose: Controler of language register.
# GNU AGPLv3
########################################
class LanguagesController < ApplicationController
  #assert language methods
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  # GET /languages
  def index
    @languages = Language.all
  end

  # GET /languages/1
  def show
  end

  # GET /languages/new
  def new
    @language = Language.new
  end

  # GET /languages/1/edit
  def edit
  end

  # POST /languages
  def create
    @language = Language.new(language_params)
    #Create a new language, put notice for user or user redirect user for 
    #register a new language in case language not saved.
    if @language.save
      redirect_to @language, notice: 'Language was successfully created.'
    else
      render :new
    end
  end

  Language.create(name: 'Ruby').valid?

  # PATCH/PUT /languages/1
  def update
    if @language.update(language_params)
      redirect_to @language, notice: 'Language was successfully updated.'
    else
      render :edit
    end
  end

  private
    def destroy
      @language.destroy
      redirect_to languages_url, notice: 'Language was successfully destroyed.'
    end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

    @name = 'language' # Name of the language

    # Only allow a trusted parameter 'white list' through.
    def language_params
      params.require(:language).permit(:name) # define params of language.
    end
end
