class TagsController < ApplicationController
  def index
    # 質問に紐づくタグの一覧を取得
    @tags = Question.all_tags
  end
end
