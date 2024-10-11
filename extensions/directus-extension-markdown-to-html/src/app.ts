import { defineOperationApp } from '@directus/extensions-sdk';

export default defineOperationApp({
	id: 'markdownToHtml',
	name: 'Markdown To HTML',
	icon: 'box',
	description: 'This is Markdown To HTML operation!',
	overview: ({ text }) => [
		{
			label: 'Text',
			text: text,
		},
	],
	options: [
		{
			field: 'text',
			name: 'Text',
			type: 'string',
			meta: {
				width: 'full',
				interface: 'input',
			},
		},
	],
});
