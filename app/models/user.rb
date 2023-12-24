class User < ApplicationRecord
  enum gender: { female: 0, male: 1, others: 2}
end
