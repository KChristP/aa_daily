class Session < ActiveRecord::Base
    belongs_to :user
    attr_reader :ip_address
    geocoded_by :ip_address
    after_validation :geocode

    def ip_address=(address)
      @ip_address = address
    end

end
