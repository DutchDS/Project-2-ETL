select w.wine_name "Wine", wt.wine_type "Type", ws.winery_name "Winery", c.country_name "Country", 
	p.province_name "Province",  r.region_name "Region", p.avg_f "Average Temperature", w.price "Price", w.rating "Rating"

from wines w 
	inner join countries c on w.country_id = c.country_id
	inner join provinces p on w.province_id = p.province_id
	inner join regions r on w.region_id = r.region_id
	inner join wineries ws on w.winery_id = ws. winery_id
	inner join wine_types wt on w.wine_type_id = wt.wine_type_id
	
where c.country_name = 'United States'
	

