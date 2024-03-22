# como ler arquivos excel
# modulo openpyxl
# install pip install openpyxl

import openpyxl
from openpyxl.worksheet.worksheet import Worksheet
# auxiliar nos tipos
xfile: openpyxl.workbook.workbook.Workbook
sheet: Worksheet

# abrir documento excel
filename = 'arquivo.excel'
xfile = openpyxl.load_workbook(filename, read_only=True)

# abrir um workbook
'''Pode utilizar tambem
sheet = xfile.worksheets['planilha 1'] 
'''
sheet = xfile.worksheets[0] 

# ler celula
linha = 1
coluna = 1
value = sheet.cell(linha, coluna).value

