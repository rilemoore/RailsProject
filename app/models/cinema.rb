class Cinema < ApplicationRecord
    has_many :theatres, :dependent => :destroy
    has_many :movies, :through => :theatres

    validates :name, presence: true

    accepts_nested_attributes_for :theatres
    accepts_nested_attributes_for :movies
end
