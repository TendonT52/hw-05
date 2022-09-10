class MainController < ApplicationController
  def index
    @nums = (1..10).to_a
  end

  def test
    @n = params[:num].to_i
  end

  def result
    @n = params[:num].to_i
    success = true

    for i in 1..@n
      s = Subject.new
      s.name = params["subject" + i.to_s]
      s.score = params["score" + i.to_s]
      if not s.valid?
        success = false
        params["error" + i.to_s] = s.errors.full_messages.join(", ")
      else
        params["error" + i.to_s] = "OK แล้ว"
      end
    end

    if not success
      puts params
      url = "/main/test?#{params.to_enum.to_h.to_query}"
      redirect_to url
      return
    end

    for i in 1..@n
      found = Subject.where(name: params["subject" + i.to_s])
      if found == []
        s = Subject.new
        s.name = params["subject" + i.to_s]
        s.score = params["score" + i.to_s]
        s.save
        params["status" + i.to_s] = "add"
      else
        found.update_all(score: params["score" + i.to_s])
        params["status" + i.to_s] = "update"
      end
    end

  end

  def error
  end
end
