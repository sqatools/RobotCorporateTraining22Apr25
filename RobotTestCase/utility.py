import json
import openpyxl


class utility:
    def __init__(self, filepath):
        self.filepath = filepath

    def read_json_data(self):
        with open(self.filepath, "r") as file:
            data = file.read()
            json_data = json.loads(data)
            return json_data

    def read_excel_data(self, filepath, sheet_name, cell_name):
        wb = openpyxl.load_workbook(filepath)
        sheet = wb[sheet_name]
        cell = sheet[cell_name]
        return cell.value

if __name__ == '__main__':
    obj = utility("c:\\json_content.json")
    result = obj.read_excel_data("test_data.xlsx", "Sheet1", "A1")
    print(result)

