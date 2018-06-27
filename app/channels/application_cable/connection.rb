module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def guest_user
      puts 'GUEST USER DEFINED'
      guest = GuestUser.new
      guest.id = GuestUser.object_id
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com" 
      guest
    end

    def connect
      puts 'CONNECT====================='
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
    end

    protected

    def find_verified_user
      puts 'FIND VERIFIED USER'
      if verified_user = env['warden'].user
        verified_user
      end
    end
  end
end
