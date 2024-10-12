/**
 * Prompt: Recommended Gemini API or Claude
 * 
 * Content Generator With HTML
 * @returns 
 */
module.exports = async function ({ $trigger }) {
  // title, keywords, content from post
  const { title, keywords, content, prompt, html_code } = $trigger;

  let promptStr = `Article topic: ${title}\n\n`;
  if (keywords && keywords.trim() !== '') promptStr += `Article SEO keywords: ${keywords}\n\n`;
  promptStr += "```html\n";
  promptStr += html_code;
  promptStr += "\n```\n\n";

  promptStr += `${prompt}\n\n`;
  promptStr += `Article content structure (do not add an opening title): \n\n`;
  promptStr += `introduction Without Paragraph heading ... \n\n`;
  promptStr += `## Paragraph heading 1\n\n`;
  promptStr += `Paragraph...\n\n`;
  promptStr += `## Paragraph heading 2\n\n`;
  promptStr += `Paragraph...\n\n`;
  promptStr += `More sections ...\n\n`;
  promptStr += `## conclusion ...\n\n`;
  promptStr += `## Resource (if has resource) ...\n\n`;
  promptStr += `- [title](url)\n\n`;
  promptStr += `Only return the article content, do not return content unrelated to the article. The article paragraphs should have clear hierarchy, and key sentences should be appropriately bolded.`;

  return promptStr
}
