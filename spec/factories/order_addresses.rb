FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    province_id { '27' }
    city { '京都市' }
    address_line { '1-1' }
    building { '京都ハイツ' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
