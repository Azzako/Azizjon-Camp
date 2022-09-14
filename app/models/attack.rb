class Attack < ApplicationRecord
    belongs_to :project
    has_one_attached :upload
end
