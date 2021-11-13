class User < ApplicationRecord
    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    validates :name, presence: true
    validates :password, presence: true, on: :create
    # validates :happiness, presence: true
    # validates :nausea, presence: true
    # validates :height, presence: true
    # validates :tickets, presence: true

    def mood
        if !nausea.nil? && !happiness.nil?
            if nausea > happiness
                "sad"
            else
                "happy"
            end
        end
    end
end
