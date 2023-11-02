*** Settings ***
Library    CustomLibrary.py

*** Test Cases ***
Get FileName Test
    ${full_path} =    Set Variable    /path/to/your/file.txt
    ${file_name} =    Get File Name From Path    ${full_path}
    Log    ${file_name}  # This will output 'file.txt'
