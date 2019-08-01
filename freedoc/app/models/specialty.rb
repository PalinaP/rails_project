class Specialty < ApplicationRecord
	has_many :join_table_specialty_doctors, dependent: :destroy
end
