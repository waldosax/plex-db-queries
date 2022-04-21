SELECT
	metai.title,	
	tg.tag,
	mp.file	
FROM
	library_sections ls	
	INNER JOIN media_items mi ON	
		ls.id = mi.library_section_id
	INNER JOIN metadata_items metai ON	
		mi.metadata_item_id = metai.id
	INNER JOIN media_parts mp ON	
		mi.id = mp.media_item_id
	INNER JOIN taggings tgs ON
		metai.id = tgs.metadata_item_id
	INNER JOIN tags tg ON
		tgs.tag_id = tg.id AND
		tg.tag_type = 2	-- Collection
WHERE
	ls.name = 'Movies'
ORDER BY
	metai.title ASC,
	tg.tag ASC
