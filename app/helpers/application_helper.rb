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
    sum_impression
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

  # def impression_comment
  #   if @sum >= 90
  #     if @user.sex == 0
  #       'かわいいが渋滞してる！'
  #     else
  #       'カッコいいが渋滞してる！'
  #     end
  #   elsif @sum >= 80
  #     if @user.sex == 0
  #       'ヤバすぎ！！！'
  #     else
  #       'ドキドキする！！！'
  #     end
  #   elsif @sum >= 70
  #     if @user.sex == 0
  #       '文句なし！！'
  #     else
  #       'イケてる！！'
  #     end
  #   elsif @sum >= 60
  #     if @user.sex == 0
  #       'ストライク！'
  #     else
  #       'タイプ！'
  #     end
  #   elsif @sum >= 50
  #     if @user.sex == 0
  #       'やるな。'
  #     else
  #       'やるわね。'
  #     end
  #   elsif @sum >= 40
  #     if @user.sex == 0
  #       'まぁまぁかな。'
  #     else
  #       'まぁまぁ。'
  #     end
  #   elsif @sum >= 30
  #     if @user.sex == 0
  #       'イマイチかな。'
  #     else
  #       '少し実力不足。'
  #     end
  #   elsif @sum >= 20
  #     if @user.sex == 0
  #       '自分が見えてないと思う。'
  #     else
  #       'まだ自分が見えてない。'
  #     end
  #   elsif @sum >= 10
  #     if @user.sex == 0
  #       'まずは自分磨きをしよう。'
  #     else
  #       'まずは自分磨きね。'
  #     end
  #   elsif @user.sex == 0
  #     '修行編エピソード１的な。'
  #   else
  #     'あきめないで。'
  #   end
  # end

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
