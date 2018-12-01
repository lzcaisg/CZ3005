# For Data Pre-Processing
# CAI Lingzhi, U1622184H, 8/Nov/2018
# Suppose the file "Olympics.csv" exists in the directory

import csv

# Read in .csv
with open("Olympics.csv","r") as f:
    reader = csv.reader(f,delimiter=',')
    result=list(reader)

result[0][0]=result[0][0].replace(u'\ufeff','') # Replace special EXCEL node if any

# "Label" is used to generate the .pl FACTs
Label=["rank","name","nation","sport","start_year","end_year","season","gender","gold_no", "silver_no","bronze_no","total_no"]
Data=[]
for i in range(12):
    Data.append([tmp[i] for tmp in result[1:]])
    Data[i].insert(0, Label[i])

for j in range(12):
    for i in range(len(Data[j])):
        Data[j][i]=Data[j][i].lower()
        Data[j][i]=Data[j][i].replace(" ","_")
        Data[j][i]=Data[j][i].replace("-","_")
# Replace space and "-" that cannot be reconized by the Prolog

Result = [] # Generate the Prolog Command
for j in range(12):
    if j==1: continue # skip the name: because we don't need the (name, name) relation
    for i,tmpname in enumerate(Data[1][1:]):
        command=Data[j][0]+"("+tmpname+', '+Data[j][i+1]+")."
        Result.append(command)

# Save to .pl
with open("lab2-ass1-athlete.pl","w") as f:
    for item in Result:
        f.write("%s\n" % item)