require "opentok"

class TokBoxService
  API_KEY=""
  API_SECRET=""

  def self.opentok
    @opentok ||= OpenTok::OpenTok.new API_KEY, API_SECRET
  end

  def self.session
    @session ||= opentok.create_session
  end

  def self.session_id
    session.session_id
  end

  def self.generate_token(session_id_value)
    opentok.generate_token(
      session_id_value,
      role: :moderator,
      expire_time: Time.now.to_i+(7 * 24 * 60 * 60),
      data: "token no - #{Token.count}",
      initial_layout_class_list: ['focus', 'inactive']
    )
  end
end
