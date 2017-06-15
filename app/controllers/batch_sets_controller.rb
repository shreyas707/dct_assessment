class BatchSetsController < ApplicationController
  before_action :set_batch_set, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource

  # GET /batch_sets
  # GET /batch_sets.json
  def index
    @batch = Batch.find(params[:batch_id])
    if current_user.try(:is_admin?)
      @batch_sets = BatchSet.all
    elsif current_user.try(:is_user?)
      @batch_sets = BatchSet.where('batch_id = ?', @batch)
    end
  end

  # GET /batch_sets/1
  # GET /batch_sets/1.json
  def show
    @batch = Batch.find(params[:batch_id])
    @answer = Answer.new
    @comment = Comment.new
    @batch_set_answers = Answer.where('batch_set_id = ?', @batch_set.id)
  end

  # GET /batch_sets/new
  def new
    @batch_set = BatchSet.new
    # @batch_set_chapter_topic = BatchSetChapterTopic.new
    @batch = Batch.find(params[:batch_id])
    @due_date_list = DueDateList.new
    @question_set = QuestionSet.new
    @question_set_chapter_topic = QuestionSetChapterTopic.new
    @batch_users = User.where(student_id: @batch.students.pluck(:id)).order('name ASC')

  end

  # GET /batch_sets/1/edit
  def edit
    @batch = Batch.find(params[:batch_id])
    @answer = Answer.new
    @batch_set_questions = BatchSetQuestion.where('batch_set_id = ?', @batch_set.id)
    @batch_users = User.where(student_id: @batch.students.pluck(:id)).order('name ASC')

    @questions = {"all_questions" => {}, "asked_questions" => {}, "yet_to_be_asked_questions" => {}}
    @question_sets = @batch_set.question_sets
    @question_set_chapter_topics = QuestionSetChapterTopic.where(question_set_id: @question_sets.pluck(:id))
    @question_sets.each do |question_set|
      @questions["all_questions"][question_set.id] = []
      @questions["asked_questions"][question_set.id] = []
      @questions["yet_to_be_asked_questions"][question_set.id] = []
      @question_set_chapter_topics.where(question_set_id: question_set.id).each do |qsct|
        # binding.pry
        Question.where(kind: @batch_set.kind, chapter_id: qsct.chapter_id, topic_id: qsct.topic_id).each do |question|
          # binding.pry
          @questions["all_questions"][question_set.id] += [question]
          if question_set.question_ids.include?(question.id)
            @questions["asked_questions"][question_set.id].push(question) 
            # binding.pry
          else
            @questions["yet_to_be_asked_questions"][question_set.id].push(question)
          end
        end
      end
    end

    @users = []
    @batch_students = BatchStudent.where(batch_id: @batch)
    @batch_students.each do |batch_student|
      @users.push(batch_student.student)
    end

    # questions = {"all_questions" => {}, "asked_questions" => {}, "yet_to_be_asked_questions" => {}}
    # question_set_chapter_topics = []

    # batch_set = BatchSet.last
    # question_sets = batch_set.question_sets
    # question_set_chapter_topics = QuestionSetChapterTopic.where(question_set_id: question_sets.pluck(:id))


    # question_sets.each do |question_set|
    #   questions["all_questions"][question_set.id] = []
    #   questions["asked_questions"][question_set.id] = []
    #   questions["yet_to_be_asked_questions"][question_set.id] = []
    #   question_set_chapter_topics.where(question_set_id: question_set.id).each do |qsct|
    #     Question.where(kind: batch_set.kind, chapter_id: qsct.chapter_id, topic_id: qsct.topic_id).each do |question|
    #       questions["all_questions"][question_set.id] += question
    #       if question_set.question_ids.include?(question.id)
    #         questions["asked_questions"][question_set.id] += question
    #       else
    #         questions["yet_to_be_asked_questions"][question_set.id] += question
    #       end
    #     end
    #   end
    # end

  end

  # POST /batch_sets
  # POST /batch_sets.json
  def create
    @batch_set = BatchSet.new(batch_set_params)
    @batch = Batch.find(params[:batch_id])
    respond_to do |format|
      if @batch_set.save
        # @batch_set.create_due_date_list(params[:due_date_list_attributes])
        format.html { redirect_to edit_batch_batch_set_path(@batch, @batch_set), notice: 'Batch set was successfully created.' }
        format.json { render :show, status: :created, location: @batch_set }
      else
        format.html { render :new }
        format.json { render json: @batch_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_sets/1
  # PATCH/PUT /batch_sets/1.json
  def update
    @batch = Batch.find(params[:batch_id])
    respond_to do |format|
      if @batch_set.update(batch_set_params)
        if current_user.try(:is_admin?)
          format.html { redirect_to batch_batch_set_path(@batch, @batch_set), notice: 'Batch set was successfully updated.' }
        else
          format.html { redirect_to batch_batch_set_path(@batch, @batch_set), notice: 'Answers have been submitted.' }       
        end
        format.json { render :show, status: :ok, location: @batch_set }
      else
        format.html { render :edit }
        format.json { render json: @batch_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_sets/1
  # DELETE /batch_sets/1.json
  def destroy
    @batch = Batch.find(params[:batch_id])
    @batch_set.destroy
    respond_to do |format|
      format.html { redirect_to @batch, notice: 'Batch set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_chapters
    @topic = Topic.find(params[:topic_id])
    @chapters = @topic.chapters
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_set
      @batch_set = BatchSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_set_params
      params.require(:batch_set).permit(:title, :kind, :set_date, :batch_id, batch_set_chapter_topics_attributes: [:id, :batch_id, :chapter_id, :topic_id, :_destroy], answers_attributes:[:id, :question_id, :batch_set_id, :user_id, :statement], due_date_lists_attributes: [:id, :batch_set_id, :due_date_time, :_destroy, user_ids: []], question_sets_attributes: [:id, :batch_set_id, :_destroy, user_ids: [], question_ids: [], question_set_chapter_topics_attributes: [:id, :question_set_id, :chapter_id, :topic_id, :_destroy]], question_ids: [])
    end
end