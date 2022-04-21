SELECT		
	metai.title,
	metai.year,
	CASE
		WHEN metai.title == ('A ' || metai.title_sort) THEN NULL
		WHEN metai.title == ('The ' || metai.title_sort) THEN NULL
		WHEN metai.title_sort == metai.title THEN NULL
		ELSE metai.title_sort
	END AS title_sort,
	imdb_ids.imdb_id,
	mp.file	
FROM		
	library_sections ls	
	INNER JOIN media_items mi ON	
		ls.id = mi.library_section_id
	INNER JOIN metadata_items metai ON	
		mi.metadata_item_id = metai.id
	INNER JOIN media_parts mp ON	
		mi.id = mp.media_item_id
	LEFT OUTER JOIN (
		SELECT
			metai.id AS metadata_item_id,
			substr(tg.tag, 8) AS imdb_id
		FROM
			metadata_items metai
			INNER JOIN taggings tgs ON
				metai.id = tgs.metadata_item_id
			INNER JOIN tags tg ON
				tg.id = tgs.tag_id AND
				tg.tag_type = 314 AND -- External DB ID
				substr(tg.tag, 1, 7) == 'imdb://' -- IMDB
		) imdb_ids ON
			metai.id = imdb_ids.metadata_item_id
			
WHERE		
	ls.name = 'Movies'
ORDER BY
	COALESCE(metai.title_sort, metai.title) ASC