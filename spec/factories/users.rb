FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.unique.name }
    email                 { Faker::Internet.unique.email }
    # パスワードは半角英数字混合を保証
    password              { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) + '1a' }
    password_confirmation { password }
    last_name             { '山田' }     # 全角漢字（固定）
    first_name            { '太郎' }     # 全角漢字（固定）
    last_name_kana        { 'ヤマダ' }   # 全角カタカナ（固定）
    first_name_kana       { 'タロウ' }   # 全角カタカナ（固定）
    birthday              { Date.new(1990, 1, 1) } # 誕生日は固定
  end
end
