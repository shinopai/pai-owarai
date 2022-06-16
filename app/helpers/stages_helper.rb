module StagesHelper
  def put_wday(day)
    wdays = %w[日 月 火 水 木 金 土 日]
    '(' + wdays[day] + ')'
  end

  def number_to_currency(price)
    "#{price.to_formatted_s(:delimited)}円"
  end
end
