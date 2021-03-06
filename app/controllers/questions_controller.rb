class QuestionsController < ApplicationController
  #ログインしていなければquestionを使用できないようにする(Deviseのauthenticate_user!メソッドを使用)
  # before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  # GET /questions
  # GET /questions.json
  def index
    if params['tags'].blank?
      @questions = Question.all
    else
      @questions = Question.tagged_with(params['tags'])
    end
  end

  # GET /questions/1
  # GET /questions/1.json

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    # 質問内容を作成
    @question = Question.new(question_params)
    #user_idをカラムに代入する(current_userメソッドを使用する)
    @question.user_id = current_user.id

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # 回答の入力フォームと一覧を表示するためにインスタンスを2つ生成
  def show
    @answer = @question.answers.build
    @answers = @question.answers
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :content, :tag_list)
    end
end
