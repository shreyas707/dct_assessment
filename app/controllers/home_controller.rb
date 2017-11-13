class HomeController < ApplicationController

  def index
  end

  # def input
  #   @response = {}
  #   @content = params[:content]
  #   @name = params[:name]
  #   @ex = params[:extension]
  #   @input = InputFile.new(@name,@content,@ex)
  #   @input.createFile
  #   @input.execute
  #   @response["response"] = @input.respond
  #   respond_to do |format|
  #     format.json { render json: @response}
  #   end
  # end

  def check_cache
    @response = {}
    @uid = params[:uid]
    @aid = params[:aid]
    @lang = params[:language]
    @bid = params[:bid]
    @obj = Check.new(@uid, @aid, @lang, @bid)
    @response["response"] = @obj.has_cache
    respond_to do |format|
      format.json { render json: @response}
    end
  end

end