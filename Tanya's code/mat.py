from xlrd import open_workbook
import pandas as pd
wb = open_workbook('Firms to combine topics.xlsx')
adj_list = {}
for s in wb.sheets():
    values = []
    for row in range(s.nrows):
        
        for col in range(1,s.ncols):
            value  = (s.cell(row,col).value)
            try : value = str(int(value))
            except : pass
            if col == 1:
                firm = value
              
            else:
                diseases = value.split(';')
                for d in diseases:
                    if d in adj_list:
                        if firm not in adj_list[d]:   
                            adj_list.setdefault(d, set()).add(firm)
                    else:
                        adj_list.setdefault(d, set()).add(firm)
                
adj_list.pop('TOPICS', None)
adj_list = {k: [v.strip() for v in vs] for k, vs in adj_list.items()}
edges2 = []
for it in adj_list.values():
    for it2 in range(len(it)):
        for it3 in range(it2,len(it)):
            edges2.append((it[it2], it[it3]))
df2 = pd.DataFrame(edges2)
print (len(df2))
adj_matrix2 = pd.crosstab(df2[0], df2[1])
print(len(adj_matrix2))
adj_matrix2.to_csv('firm_by_firm.csv')
