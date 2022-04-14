SELECT		
	metai.title,	
	mp.file	
FROM		
	library_sections ls	
	INNER JOIN media_items mi ON	
		ls.id = mi.library_section_id
	INNER JOIN metadata_items metai ON	
		mi.metadata_item_id = metai.id
	INNER JOIN media_parts mp ON	
		mi.id = mp.media_item_id
WHERE		
	ls.name = 'Movies'	