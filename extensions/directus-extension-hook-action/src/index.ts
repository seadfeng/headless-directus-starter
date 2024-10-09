import { defineHook } from '@directus/extensions-sdk';
import { SaveEvent } from './types';

export default defineHook(({ filter, action }, { database }) => {

  filter('items.create', async (input, context) => {
    let newinput = input as Record<string, any>;
    const { collection } = context;
    switch (collection) {
      case "tags":
        if (newinput.name && typeof newinput.name === "string") newinput.name = newinput.name.toLowerCase()
        break;
      default:
        break;
    }
    return input;
  })
  action('items.create', async (input) => {
    const newinput = input as SaveEvent;
    switch (newinput.collection) {
      case "posts_tags":
        const tagId = newinput.payload.tags_id.id;
        const tagName = newinput.payload.tags_id.name;
        try {
          if (tagId) {
            console.log("tagId increment")
            await database.transaction(async (trx) => {
              await trx('tags')
                .where({ id: tagId })
                .increment('posts_count', 1);
            });
          } else {
            console.log("tagName increment")
            await database.transaction(async (trx) => {
              await trx('tags')
                .where({ name: tagName.toLowerCase() })
                .increment('posts_count', 1);
            });
          }

        } catch (error) {
          console.error('Error updating posts_count:', error);
          throw new Error('Failed to update posts_count');
        }
        break;
      default:
        console.log("items.create collection", newinput.collection);
    }
  });

  filter('items.delete', async (input, context) => {
    const id = (input as string[])[0];
    const { collection } = context;
    switch (collection) {
      case "posts_tags":
        try {
          const posts_tags = await database.from("posts_tags").where({ id });
          if (posts_tags.length === 0) return;

          await database.transaction(async (trx) => {
            await trx('tags')
              .where({ id: posts_tags[0].tags_id })
              .decrement('posts_count', 1);
          });
        } catch (error) {
          console.error('Error updating posts_count:', error);
          throw new Error('Failed to update posts_count');
        }
        break;
      default:
        console.log("items.delete collection", collection);
    }
    return input;
  });
});
