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