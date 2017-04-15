module MapsHelper
	def display_lat_long map=nil
		return '' if map.blank?
		lat_long_str =""
		lat_long_str.concat("(#{[map.try(:lat1).try(:to_s), map.try(:long1).try(:to_s)].join(", ")})")
		lat_long_str.concat("(#{[map.try(:lat2).try(:to_s), map.try(:long2).try(:to_s)].join(", ")})")
		lat_long_str.split(')(').join(') (')
	end
end
