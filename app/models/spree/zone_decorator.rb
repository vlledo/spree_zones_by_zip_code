module Spree
  Zone.class_eval do

    def include?(address)
      return false unless address

      members.any? do |zone_member|
        case zone_member.zoneable_type
        when 'Spree::Country'
          zone_member.zoneable_id == address.country_id
        when 'Spree::State'
          zone_member.zoneable_id == address.state_id
        when 'Spree::ZipCode'
          zone_member.zoneable_id == address.zipcode
        else
          false
        end
      end
    end

    def kind
      member = self.members.last
      case member && member.zoneable_type
      when "State"  then "state"
      when "Zone"   then "zone"
      when "Zip Code" then "zip code"
      else
        "country"
      end
    end

    def zip_code_ids
      if kind == 'zip code'
        members.pluck(:zoneable_id)
      else
        []
      end
    end

    def zip_code_ids=(ids)
      set_zone_members(ids, 'Spree::ZipCode')
    end
  end
end