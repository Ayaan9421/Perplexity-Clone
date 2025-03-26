from dotenv import load_dotenv
from pydantic_settings import BaseSettings  # Use this for Pydantic v2

load_dotenv()

class Settings(BaseSettings):
    TAVILY_API_KEY: str = ""
    GEMINI_API_KEY: str = ""

