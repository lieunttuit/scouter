module ApplicationHelper
  def set_sex(user)
    if user.sex == 0
      "女性"
    else
      "男性"
    end
  end

  def set_generation(user)
    if user.generation == 0
      "10代★"
    elsif user.generation == 1
      "20代★★"
    elsif user.generation == 2
      "30代★★★"
    elsif user.generation == 3
      "40代★★★★"
    elsif user.generation == 4
      "50代★★★★★"
    else
      "60代以上★★★★★★"
    end
  end

  def user_demo_image
    if current_user.sex == 0
      "figure" + rand(1..6).to_s + ".jpg"
    else
      "figure" + rand(7..12).to_s + ".jpg"
    end
  end

  def mypage_demo_image
    if current_user.sex == 0
      "figure" + rand(7..12).to_s + ".jpg"
    else
      "figure" + rand(1..6).to_s + ".jpg"
    end
  end
end
