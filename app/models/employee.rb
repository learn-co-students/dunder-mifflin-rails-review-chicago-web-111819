class Employee < ApplicationRecord
    belongs_to :dog

    validates :alias, :title, uniqueness: {case_sensitive: false}
end
