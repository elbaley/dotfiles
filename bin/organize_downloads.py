import os
import shutil
import time
from datetime import datetime, timedelta

# Folder paths
downloads_folder = os.path.expanduser('~/Downloads')
archive_folder = os.path.join(downloads_folder, 'Archives')
media_folder = os.path.join(downloads_folder, 'Media')
documents_folder = os.path.join(downloads_folder, 'Documents')
others_folder = os.path.join(downloads_folder, 'Others')

# File categories
ARCHIVE_EXTENSIONS = ['.zip', '.rar', '.dmg']
MEDIA_EXTENSIONS = ['.mp4', '.mkv', '.png', '.jpeg', '.jpg', '.gif', '.svg']
DOCUMENT_EXTENSIONS = ['.pdf', '.docx', '.xlsx', '.md']

for folder in [archive_folder, media_folder, documents_folder, others_folder]:
    os.makedirs(folder, exist_ok=True)

def is_file_older_than_3_days(file_path):
    file_time = os.path.getmtime(file_path)
    file_date = datetime.fromtimestamp(file_time)
    return file_date < datetime.now() - timedelta(days=3)

def categorize_file(file_name):
    ext = os.path.splitext(file_name)[1].lower()
    
    if ext in ARCHIVE_EXTENSIONS:
        return archive_folder
    elif ext in MEDIA_EXTENSIONS:
        return media_folder
    elif ext in DOCUMENT_EXTENSIONS:
        return documents_folder
    else:
        return others_folder

def move_old_files():
    for file_name in os.listdir(downloads_folder):
        file_path = os.path.join(downloads_folder, file_name)
        
        if os.path.isfile(file_path) and is_file_older_than_3_days(file_path):
            destination_folder = categorize_file(file_name)
            destination_path = os.path.join(destination_folder, file_name)
            
            shutil.move(file_path, destination_path)
            print(f'Moved {file_name} to {destination_folder}')

if __name__ == "__main__":
    move_old_files()

