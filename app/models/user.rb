class User < ApplicationRecord
  has_many :tasklist
  #validates :Taskname, presence: true

end
