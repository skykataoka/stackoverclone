module ApplicationHelper

  # 現在ログインしているユーザと閲覧しているユーザが等しいかどうか判定する
  def identification(user)
    if current_user.id == user.id
    end
  end

end
