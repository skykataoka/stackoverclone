class QuestionsController < ApplicationController
  #ログインしていなければquestionを使用できないようにする(Deviseのauthenticate_user!メソッドを使用)
  # before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def index
    if params['tags'].blank?
      @questions = Question.all
    else
      @questions = Question.tagged_with(params['tags'])
    end
  end

  def new
    @question = Question.new
  end


  def edit
  end

  def create
    # 質問内容を作成
    @question = Question.new(question_params)
    #user_idをカラムに代入する(current_userメソッドを使用する)
    @question.user_id = current_user.id

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: '質問の投稿が完了しました！' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: '質問の編集が完了しました！' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: '質問の削除が完了しました！' }
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
