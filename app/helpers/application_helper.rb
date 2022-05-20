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

  # def impression_comment(sex)
  #   ary = [
  #     ['かわいいが渋滞してる！','ヤバすぎ！！！','文句なし！！','ストライク！','やるな。','まぁまぁかな。','イマイチかな。','自分が見えてないと思う。','まずは自分磨きをしよう。','修行編エピソード１的な。'],
  #     ['カッコいいが渋滞してる！','ドキドキする！！！','イケてる！！','ストライク！','タイプ！','やるわね。','少し実力不足。','まだ自分が見えてない。','まずは自分磨きね。','あきめないで。']
  #   ]
  #   case @sum
  #   when @sum>= 90 then
  #     ary[@user.sex][0]
  #   when @sum>= 80 then
  #     ary[@user.sex][1]
  #   when @sum>= 70 then
  #     ary[@user.sex][2]
  #   when @sum>= 60 then
  #     ary[@user.sex][3]
  #   when @sum>= 50 then
  #     ary[@user.sex][4]
  #   when @sum>= 40 then
  #     ary[@user.sex][5]
  #   when @sum>= 30 then
  #     ary[@user.sex][6]
  #   when @sum>= 20 then
  #     ary[@user.sex][7]
  #   when @sum>= 10 then
  #     ary[:@ser.sex][8]
  #   when @sum>= 0 then
  #     ary[@user.sex][9]
  #   end
  # end

  def impression_comment
    if @sum >= 90
      if @user.sex == 0
        'かわいいが渋滞してる！'
      else
        'カッコいいが渋滞してる！'
      end
    elsif @sum >= 80
      if @user.sex == 0
        'ヤバすぎ！！！'
      else
        'ドキドキする！！！'
      end
    elsif @sum >= 70
      if @user.sex == 0
        '文句なし！！'
      else
        'イケてる！！'
      end
    elsif @sum >= 60
      if @user.sex == 0
        'ストライク！'
      else
        'タイプ！'
      end
    elsif @sum >= 50
      if @user.sex == 0
        'やるな。'
      else
        'やるわね。'
      end
    elsif @sum >= 40
      if @user.sex == 0
        'まぁまぁかな。'
      else
        'まぁまぁ。'
      end
    elsif @sum >= 30
      if @user.sex == 0
        'イマイチかな。'
      else
        '少し実力不足。'
      end
    elsif @sum >= 20
      if @user.sex == 0
        '自分が見えてないと思う。'
      else
        'まだ自分が見えてない。'
      end
    elsif @sum >= 10
      if @user.sex == 0
        'まずは自分磨きをしよう。'
      else
        'まずは自分磨きね。'
      end
    elsif @user.sex == 0
      '修行編エピソード１的な。'
    else
      'あきめないで。'
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
