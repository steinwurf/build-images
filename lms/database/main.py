import pyodbc
server="db"
username="sa"
password="yourStrong(!)Password"
cnxn = pyodbc.connect("DRIVER={ODBC Driver 17 for SQL Server};SERVER="+ server+ ";UID="+ username+ ";PWD="+ password, autocommit=True)

# Create cursor and then a database name githubcopilot
cursor = cnxn.cursor()
cursor.execute("CREATE DATABASE githubcopilot")