import os

# 只取檔名
def get_file_name_from_path(full_path):
    return os.path.basename(full_path)
  
# 過濾特定符號，取得前面的檔名
def get_file_name_from_path2(full_path):

	# 取得檔名
	file = os.path.basename(full_path)
	
	result = file
	
	# 篩選檔名
	index = file.find("(")
	
	if index != -1:
		result = file[:index]	

	print(result)  # 輸出 'Princeton'

	return	result
