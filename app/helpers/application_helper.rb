module ApplicationHelper
  def set_sex(user)
    user.sex == 0 ? '女性' : '男性'
  end

  def set_generation(user)
    ary = %w[10代 20代 30代 40代 50代 60代以上]
    ary[user.generation]
  end

  def sum_impression
    @sum = @evaluations.sum { |hash| hash[:evaluation_point] }
    @sum == 0 ? 'まだ評価はありません' : @sum * 10 / @evaluations.count
  end

  def impression_each_generation(num)
    @evaluations = Evaluation.where(evaluatee_id: @user.id).includes(:user).where(users: { generation: num })
    @sum = @evaluations.sum { |hash| hash[:evaluation_point] } * 10 / @evaluations.count
    if @sum == 100 
      '❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️' 
    elsif @sum >= 90 
      '❤️❤️❤️❤️❤️❤️❤️❤️❤️'
    elsif @sum >= 80 
      '❤️❤️❤️❤️❤️❤️❤️❤️' 
    elsif @sum >= 70 
      '❤️❤️❤️❤️❤️❤️❤️'
    elsif @sum >= 60 
      '❤️❤️❤️❤️❤️❤️'
    elsif @sum >= 50 
      '❤️❤️❤️❤️❤️'
    elsif @sum >= 40 
      '❤️❤️❤️❤️'
    elsif @sum >= 30 
      '❤️❤️❤️'
    elsif @sum >= 20 
      '❤️❤️'
    elsif @sum >= 10 
      '❤️'
    elsif @sum > 0 
      '💔'
    else
      'まだ評価はありません'
    end  
  end

  def impression_total
    @evaluations = Evaluation.where(evaluatee_id: @user.id).includes(:user)
    sum_impression
  end

  def impression_comment(sex)
    if impression_total != 'まだ評価はありません'
      num = impression_total / 10
      num = num.floor
      ary = [
        ['修行編エピソード１的な。','まずは自分磨きをしよう。', '自分が見えてないと思う。', 'イマイチかな。', 'まぁまぁかな。', 'やるな。', 'ストライク！', '文句なし！！', 'ヤバすぎ！！！', 'かわいいが渋滞してる！'],
        ['あきめないで。', 'まずは自分磨きね。', 'まだ自分が見えてない。', '少し実力不足。', 'やるわね。', 'タイプ！', 'ストライク！', 'イケてる！！', 'ドキドキする！！！', 'カッコいいが渋滞してる！']
      ]
      ary[sex][num]
    else
      ''
    end
  end

  def user_demo_image
    if current_user.sex == 0
      'figure' + rand(1..6).to_s + '.jpg'
    else
      'figure' + rand(7..12).to_s + '.jpg'
    end
  end

  def mypage_demo_image
    if current_user.sex == 0
      'figure' + rand(7..12).to_s + '.jpg'
    else
      'figure' + rand(1..6).to_s + '.jpg'
    end
  end
end
