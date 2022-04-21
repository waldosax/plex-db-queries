SELECT		
	metashow.title AS name,	
	metaseason.[index] AS season,	
	metai.[index] AS episode,	
	metai.title,	
	mp.file	
FROM		
	library_sections ls	
	INNER JOIN media_items mi ON	
		ls.id = mi.library_section_id
	INNER JOIN metadata_items metai ON	
		mi.metadata_item_id = metai.id
	INNER JOIN metadata_items metaseason ON	
		metai.parent_id = metaseason.id AND
		metaseason.metadata_type = 3 -- season
	INNER JOIN metadata_items metashow ON	
		metaseason.parent_id = metashow.id AND
		metashow.metadata_type = 2 -- show
	INNER JOIN media_parts mp ON	
		mi.id = mp.media_item_id
WHERE		
	ls.name = 'TV Shows'	