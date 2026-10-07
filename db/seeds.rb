# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Prefecture.create!(name: "北海道")
Prefecture.create!(name: "青森県")
Prefecture.create!(name: "岩手県")
Prefecture.create!(name: "宮城県")
Prefecture.create!(name: "秋田県")
Prefecture.create!(name: "山形県")
Prefecture.create!(name: "福島県")
Prefecture.create!(name: "茨城県")
Prefecture.create!(name: "栃木県")
Prefecture.create!(name: "群馬県")
Prefecture.create!(name: "埼玉県")
Prefecture.create!(name: "千葉県")
Prefecture.create!(name: "東京都")
Prefecture.create!(name: "神奈川県")
Prefecture.create!(name: "新潟県")
Prefecture.create!(name: "富山県")
Prefecture.create!(name: "石川県")
Prefecture.create!(name: "福井県")
Prefecture.create!(name: "山梨県")
Prefecture.create!(name: "長野県")
Prefecture.create!(name: "岐阜県")
Prefecture.create!(name: "静岡県")
Prefecture.create!(name: "愛知県")
Prefecture.create!(name: "三重県")
Prefecture.create!(name: "滋賀県")
Prefecture.create!(name: "京都府")
Prefecture.create!(name: "大阪府")
Prefecture.create!(name: "兵庫県")
Prefecture.create!(name: "奈良県")
Prefecture.create!(name: "和歌山県")
Prefecture.create!(name: "鳥取県")
Prefecture.create!(name: "島根県")
Prefecture.create!(name: "岡山県")
Prefecture.create!(name: "広島県")
Prefecture.create!(name: "山口県")
Prefecture.create!(name: "徳島県")
Prefecture.create!(name: "香川県")
Prefecture.create!(name: "愛媛県")
Prefecture.create!(name: "高知県")
Prefecture.create!(name: "福岡県")
Prefecture.create!(name: "佐賀県")
Prefecture.create!(name: "長崎県")
Prefecture.create!(name: "熊本県")
Prefecture.create!(name: "大分県")
Prefecture.create!(name: "宮崎県")
Prefecture.create!(name: "鹿児島県")
Prefecture.create!(name: "沖縄県")

User.create!(
  name: "test",
  email: "example@example.com",
  password: "password",
  prefecture_id: "1",
  introduction: "よろしくお願いします。",
  is_active: true
)

[
  "大型遊具",
  "芝生",
  "ボール遊び",
  "トイレ",
  "ドッグラン",
  "売店",
  "キッチンカー",
  "自動販売機"
].each do |equipment_name|
  Equipment.find_or_create_by!(name: equipment_name)
end

[
  "すべり台",
  "ブランコ",
  "ジャングルジム",
  "砂場",
  "シーソー",
  "鉄棒",
  "スプリング遊具",
  "アスレチック",
  "健康遊具"
].each do |playground_name|
  Playground.find_or_create_by!(name: playground_name)
end


User.find_or_create_by!(email: "example@example.com") do |user|
  user.name = "test"
  user.password = "password"
  user.prefecture_id = 1
  user.introduction = "よろしくお願いします。"
  user.is_active = true
end
