import { defineOperationApp } from '@directus/extensions-sdk';

var app = defineOperationApp({
  id: "markdown-to-html",
  name: "Markdown To HTML",
  icon: "code",
  description: "This is Markdown To HTML operation!",
  overview: ({ text }) => [
    {
      label: "Text",
      text
    }
  ],
  options: [
    {
      field: "text",
      name: "Text",
      type: "string",
      meta: {
        width: "full",
        interface: "input"
      }
    }
  ]
});

export { app as default };
