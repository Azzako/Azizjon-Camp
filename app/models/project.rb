class Project < ApplicationRecord
    belongs_to :user
    has_many :attacks, dependent: :destroy
end
