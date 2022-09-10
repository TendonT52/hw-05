class ScoreController < ApplicationController
  def list
    @recode = Subject.all
    @m = Subject.where(score: Subject.maximum(:score)).first
  end

  def edit
  end

  def update
    success = true
    s = Subject.new
    s.name = params["name"]
    s.score = params["score"]
    if not s.valid?
      success = false
      params["error"] = s.errors.full_messages.join(", ")
    else
      params["error"] = "OK แล้ว"
    end

    if not success
      puts params
      url = "/score/edit?#{params.to_enum.to_h.to_query}"
      redirect_to url
      return
    end

    found = Subject.where(id: params["id"])
    found.update_all(name: params["name"] ,score: params["score"])

    redirect_to "/score/list"
  end

  def delete
    Subject.delete(params["id"])
    redirect_to "/score/list"
  end
end
