$pythonCode = @"
import google.generativeai as genai
import sys

sys.stdout = open(sys.stdout.fileno(), mode='w', encoding='utf-8', buffering=1)

genai.configure(api_key="AIzaSyBeLK8UdsSi_syOAIldFPWbnT4mSzETpSM")
model = genai.GenerativeModel("gemini-1.5-flash")
response = model.generate_content("Hi")
print(response.text)
"@


$result = python -c "$pythonCode"

Write-Host = $result
