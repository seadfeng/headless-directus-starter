CREATE UNIQUE INDEX idx_posts_categories_unique 
ON public.posts_categories (posts_id, categories_id);

CREATE UNIQUE INDEX idx_posts_tags_unique 
ON public.posts_tags (posts_id, tags_id);

CREATE UNIQUE INDEX idx_related_posts_unique 
ON public.related (posts_id, related_posts_id);
