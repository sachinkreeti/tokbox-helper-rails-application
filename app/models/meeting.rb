require 'tok_box_service'

class Meeting < ApplicationRecord
  has_many :tokens, dependent: :destroy

  def self.create_meeting
    Meeting.create!(
      session_id: TokBoxService.session_id,
      name: "Meeting #{(Meeting.count || 0) + 1}"
    )
  end

  def generate_token(number = 1)
    number.times do
      self.tokens.create!(
        name: "#{self.name} token #{(self.tokens.count || 0) +1 }",
        token: TokBoxService.generate_token(session_id),
      )
    end
  end
end
