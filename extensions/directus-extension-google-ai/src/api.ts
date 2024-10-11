import { defineOperationApi } from '@directus/extensions-sdk';
import { GoogleGenerativeAI } from '@google/generative-ai';

type Options = {
	aiModel: string;
	prompt: string;
};

export default defineOperationApi<Options>({
	id: 'googleAi',
	handler: async ({ aiModel, prompt }) => {
		try {
			if (!prompt) {
				throw new Error("prompt is null");
			}
			if (!process.env.GOOGLE_AI_API_KEY) {
				throw new Error("GOOGLE_AI_API_KEY is not set in the environment variables.");
			}

			const genAI = new GoogleGenerativeAI(process.env.GOOGLE_AI_API_KEY);
			const model = genAI.getGenerativeModel({ model: aiModel });

			const result = await model.generateContent([prompt]);
			const responseText = result.response.text();
			return {
				success: true,
				data: responseText
			};
		} catch (error) {
			console.error("Error in Google AI operation:", error);

			return {
				success: false,
				error: error instanceof Error ? error.message : "An unknown error occurred"
			};
		}
	},
});
