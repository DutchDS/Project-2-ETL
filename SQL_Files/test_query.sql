select w.wine_name, wt.wine_type, ws.winery_name, c.country_name, p.province_name, r.region_name, c.temperature, c.latitude, c.longitude 

from wines w 
	inner join countries c on w.country_id = c.country_id
	inner join provinces p on w.province_id = p.province_id
	inner join regions r on w.region_id = r.region_id
	inner join wineries ws on w.winery_id = ws. winery_id
	inner join wine_types wt on w.wine_type_id = wt.wine_type_id
	
where c.country_name = 'United States'
	