class BlogsChannel < ApplicationCable::Channel
  def subscribed
    puts 'SUBSCRIBED ----------------------------'
    stream_from "blogs_#{params['blog_id']}_channel"
  end

  def unsubscribed
    puts 'UNSUBSCRIBED ----------------------------'
  end

  def send_comment(data)
    puts 'SEND COMMENT ----------------------------'
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end
end

