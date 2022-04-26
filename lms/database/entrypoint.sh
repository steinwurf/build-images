
#start SQL Server, start the script to create the DB and import the data, start the app
# /opt/mssql/bin/sqlservr & /usr/src/app/import-data.sh

#run the setup script to create the DB and the schema in the DB
#do this in a loop because the timing for when the SQL instance is ready is indeterminate
# pytest tests

for i in {1..5};
do
    python main.py
done


# sleep 5
# for i in {1..10};
# do
#     pytest tests --db mssql
#     if [ $? -eq 0 ]
#     then
#         echo "tests completed"
#         break
#     else
#         echo "not ready yet..."
#         sleep 1
#     fi
# done
