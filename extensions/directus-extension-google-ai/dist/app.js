import { defineOperationApp } from '@directus/extensions-sdk';

var app = defineOperationApp({
  id: "google-ai",
  name: "Google AI",
  icon: "robot",
  description: "This is Google AI operation!",
  overview: ({ aiModel, prompt }) => [
    {
      label: "Model",
      text: aiModel
    },
    {
      label: "Prompt",
      text: prompt
    }
  ],
  options: [
    {
      field: "aiModel",
      name: "Model",
      type: "string",
      meta: {
        width: "full",
        interface: "select-dropdown",
        options: {
          choices: [
            { text: "Gemini 1.5 Flash", value: "gemini-1.5-flash" },
            { text: "Gemini 1.5 Flash 002", value: "gemini-1.5-flash-002" },
            { text: "Gemini 1.5 Flash-8B", value: "gemini-1.5-flash-8b" },
            { text: "Gemini 1.5 Pro", value: "gemini-1.5-pro" },
            { text: "Gemini Pro", value: "gemini-pro" },
            { text: "Gemini Pro 002", value: "gemini-pro-002" }
          ]
        }
      }
    },
    {
      field: "prompt",
      name: "Prompt",
      type: "text",
      meta: {
        width: "full",
        interface: "input-multiline"
      }
    }
  ]
});

export { app as default };
