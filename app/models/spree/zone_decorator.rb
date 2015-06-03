module Spree
  Zone.class_eval do

    def self.match(address)
      return unless address and matches = self.includes(:zone_members).
        order('spree_zones.zone_members_count', 'spree_zones.created_at').
        where("(spree_zone_members.zoneable_type = 'Spree::Country' AND spree_zone_members.zoneable_id = ?) OR (spree_zone_members.zoneable_type = 'Spree::State' AND spree_zone_members.zoneable_id = ?) OR (spree_zone_members.zoneable_type = 'Spree::ZipCode' AND spree_zone_members.zoneable_id = ?)", address.country_id, address.state_id, address.zipcode).
        references(:zones)

      ['state', 'country', 'zip_code'].each do |zone_kind|
        if match = matches.detect { |zone| zone_kind == zone.kind }
          return match
        end
      end
      matches.first
    end

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

    def contains?(target)
      return false if kind == 'state' && target.kind == 'country'
      return false if kind == 'country' && target.kind == 'zip_code'
      return false if kind == 'state' && target.kind == 'zip_code'
      return false if kind == 'zip_code' && target.kind == 'state'
      return false if kind == 'zip_code' && target.kind == 'country'
      return false if zone_members.empty? || target.zone_members.empty?

      if kind == target.kind
        return false if (target.zoneables.collect(&:id) - zoneables.collect(&:id)).present?
      else
        return false if (target.zoneables.collect(&:country).collect(&:id) - zoneables.collect(&:id)).present?
      end
      true
    end

    def zip_code_ids
      if kind == 'zip_code'
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