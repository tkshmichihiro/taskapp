class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates :title,
  presence: { message: "Please imput the project title" },
  length: {minimum: 2, message: "Please imput at least 2 charactor" }
end
