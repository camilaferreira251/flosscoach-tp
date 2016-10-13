########################################
# File:languages_controler.rb
# Porpose: Controler of language register.
# GNU AGPLv3
########################################
class LanguagesController < ApplicationController
  #assert language methods
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  # index action to all languages
  def index
    @languages = Language.all
  end

  # action that does nothing
  def show
  end

  # action that set new language
  def new
    # set a new language to be used on view
    @language = Language.new
    assert(@language.kind_of?(Language))
  end

  # acton that does nothing
  def edit
  end

  # post that create language
  def create
    @language = Language.new(language_params)
    assert(@language.kind_of?(Language))
    #Create a new language, put notice for user or user redirect user for 
    #register a new language in case language not saved.
    if @language.save
      redirect_to @language, notice: 'Language was successfully created.'
    else
      render :new
    end
  end

  Language.create(name: 'Ruby').valid?

  # patch action that update
  def update
    if @language.update(language_params)
      redirect_to @language, notice: 'Language was successfully updated.'
    else
      render :edit
    end
  end

  # destroy action of languages
  def destroy
    @language.destroy
    redirect_to languages_url, notice: 'Language was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

        # Only allow a trusted parameter 'white list' through.
    def language_params
      @name = 'language' # Name of the language
      params.require(:language).permit(:name) # define params of language.
    end
end
