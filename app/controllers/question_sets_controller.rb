class QuestionSetsController < ApplicationController

before_action :set_question_set, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @question_sets = QuestionSet.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @question_set = QuestionSet.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @question_set = QuestionSet.new(question_set_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @question_set, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @question_set }
      else
        format.html { render :new }
        format.json { render json: @question_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @question_set.update(question_set_params)
        format.html { redirect_to @question_set, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_set }
      else
        format.html { render :edit }
        format.json { render json: @question_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @question_set.destroy
    respond_to do |format|
      format.html { redirect_to question_sets_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @question_set = QuestionSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_set_params
      params.require(:question_set).permit(question_set_chapter_topics_attributes: [:question_set_id, :chapter_id, :topic_id, :_destroy], :batch_set_id, question_ids: [], user_ids: [])
    end

end