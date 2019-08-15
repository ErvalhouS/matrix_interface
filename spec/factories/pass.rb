# This will guess the Pass class
FactoryBot.define do
  factory :pass do
    username { "Agent Smith #{rand(9000)}" }
    phrase { Pass.generate_phrase_ciphertext("Agent Smith #{rand(9000)}").inspect }
  end
end
