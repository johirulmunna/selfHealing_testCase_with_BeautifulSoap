from bs4 import BeautifulSoup
import requests

def find_new_button_ids(url):
    # Fetch the webpage content
    response = requests.get(url)
    
    if response.status_code == 200:
        # Parse the HTML content
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Find all buttons and their IDs
        buttons = soup.find_all('button')
        button_ids = [button.get('id') for button in buttons if button.get('id')]
        
        return button_ids
            
    else:
        print("Failed to fetch the webpage. Status code:", response.status_code)
        return None
