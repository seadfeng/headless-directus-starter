import { defineOperationApi } from '@directus/extensions-sdk';
import { marked } from 'marked';

type Options = {
	text: string;
};

export default defineOperationApi<Options>({
	id: 'markdownToHtml',
	handler: async ({ text }) => {
		const html = await marked(text);
		return { text: html };
	},
});
