module ApplicationHelper

  # 現在ログインしているユーザと閲覧しているユーザが等しいかどうか判定する
  def identification(user)
    if current_user.id == user.id
    end
  end

  # インスタンス変数渡しのメソッド
  def instance_get
    @answer = Question.new
  end

end
