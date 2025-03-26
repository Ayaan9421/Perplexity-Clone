import google.generativeai as genai
from config import Settings

settings = Settings()

class LLMService:
    def __init__(self):
        genai.configure(api_key=settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel("gemini-2.0-flash")


    def generate_response(self, query: str,search_results: list[dict]):
        #source 1: <url>
        #<content>
        content_text = '\n\n'.join([
            f"Source {i+1} {result['url']}:\n{result['content']}"
            for i, result in enumerate(search_results)
        ])

        full_prompt = f"""
        Context from web search: 
        {content_text}

        Query: {query}

        Please provide a comprehensive, detailed, well-citied acurate response using above context.THink and reason deeply. Ensure it answers the query the user is asking. Do not use your knowledege until its absolutely necessary.
        """

        response = self.model.generate_content(full_prompt,stream = True)

        for chunk in response:
            yield chunk.text
    