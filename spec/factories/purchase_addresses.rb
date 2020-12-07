FactoryBot.define do
  factory :purchase_address do
    token          { 'tok_abcdefghijk00000000000000000' }
    post_number    { '123-4567' }
    from_area_id   { 2 }
    municipalities { 'くまもと市' }
    address_number { '1-1' }
    building_name  { 'くまもとハイツ' }
    phone_number   { '09012345678' }
    user_id        { 1 }
    item_id        { 1 }
  end
end
