# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 都道府県データ
[
  "北海道",
  "青森県",
  "岩手県",
  "宮城県",
  "秋田県",
  "山形県",
  "福島県",
  "茨城県",
  "栃木県",
  "群馬県",
  "埼玉県",
  "千葉県",
  "東京都",
  "神奈川県",
  "新潟県",
  "富山県",
  "石川県",
  "福井県",
  "山梨県",
  "長野県",
  "岐阜県",
  "静岡県",
  "愛知県",
  "三重県",
  "滋賀県",
  "京都府",
  "大阪府",
  "兵庫県",
  "奈良県",
  "和歌山県",
  "鳥取県",
  "島根県",
  "岡山県",
  "広島県",
  "山口県",
  "徳島県",
  "香川県",
  "愛媛県",
  "高知県",
  "福岡県",
  "佐賀県",
  "長崎県",
  "熊本県",
  "大分県",
  "宮崎県",
  "鹿児島県",
  "沖縄県"
].each do |prefecture_name|
  Prefecture.find_or_create_by!(name:prefecture_name)
end


#公園設備データ
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

#公園遊具データ
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

#ユーザーデモデータ
User.find_or_create_by!(email: "example@example.com") do |user|
  user.name = "test"
  user.password = "password"
  user.prefecture_id = 1
  user.introduction = "よろしくお願いします。"
  user.is_active = true
end

User.find_or_create_by!(email: "example2@example.com") do |user|
  user.name = "test2"
  user.password = "password"
  user.prefecture_id = 2
  user.introduction = "よろしくお願いします。"
  user.is_active = true
end

#管理者データ
Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
end

#公園デモデータ
park = Park.find_or_create_by!(name: "京都市中央公園") do |p|
  p.user = User.first
  p.prefecture = Prefecture.find_by!(name: "京都府")

  p.introduction = <<~TEXT
    アクセスがよく、周辺に飲食店も充実しています。
    遊具の種類も豊富で未就学児から小学生まで楽しめる公園です。
  TEXT

  p.address = "京都市中京区テスト町1-2-3"
end

park.equipment_ids = Equipment.where(
  name: ["大型遊具",
          "芝生",
          "ボール遊び",
          "トイレ",
          "ドッグラン",
          "売店",
          "キッチンカー",
          "自動販売機"
        ]
).pluck(:id)

park.playground_ids = Playground.where(
  name: ["すべり台",
          "ブランコ",
          "ジャングルジム",
          "砂場",
          "シーソー",
          "鉄棒",
          "スプリング遊具",
          "アスレチック",
          "健康遊具"
        ]
).pluck(:id)