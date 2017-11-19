json.array! @sections.each do |section|
	json.id section.id
	json.title section.title
	json.content section.content
	json.chapter_id section.chapter_id
end