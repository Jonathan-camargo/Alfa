import http.client
import json
import psycopg2
from operator import length_hint


conn = http.client.HTTPSConnection("receitaws.com.br")

headers = { 'Content-Type': "application/json" }
cnpj_cacador= "/v1/cnpj/82110818000121"
cnpj_curitiba= "/v1/cnpj/82110818000121"
cnpj_guarulhos = "/v1/cnpj/82110818000393"
cnpj_betim = "/v1/cnpj/82110818001608"
cnpj_cachoeirinha = "/v1/cnpj/82110818000806"
cnpj_lagoas = "/v1/cnpj/82110818002760"
cnpj_goiania = "/v1/cnpj/82110818002094"
cnpj_serra = "/v1/cnpj/82110818002507"
cnpj_rj = "/v1/cnpj/82110818002841"


conn.request("GET", cnpj_cacador, headers=headers)


res = conn.getresponse()
data = res.read()
obj = json.loads(data.decode("utf-8"))
cnpj = (obj['cnpj'])
nome = (obj['nome'])
municipio = (obj['municipio'])
uf  = (obj['uf'])
print(obj['cnpj'])

''' Adicionei uma cidade por vez dentro do Banco de Dados pois
    com mais de 3 request, o servidor retornou um erro dizendo que
    havia várias requisições do mesmo host.
'''

try:
    connection = psycopg2.connect(user="postgres",
                                  password="123456",
                                  host="127.0.0.1",
                                  port="5432",
                                  database="postgres")
    cursor = connection.cursor()

    postgres_insert_query = """ INSERT INTO filiais_auto (cnpj,nome,cidade,estado) VALUES (%s,%s,%s,%s)"""
    record_to_insert = (cnpj,nome,municipio,uf)
    cursor.execute(postgres_insert_query, record_to_insert)

    connection.commit()
    count = cursor.rowcount
    print(count, "Record inserted successfully into mobile table")

except (Exception, psycopg2.Error) as error:
    print("Failed to insert record into mobile table", error)

finally:
    # closing database connection.
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")

''' 
conn.request("GET", cnpj_curitiba, headers=headers)
res = conn.getresponse()
data = res.read()


conn.request("GET", cnpj_guarulhos, headers=headers)
res = conn.getresponse()
data = res.read()


conn.request("GET", cnpj_betim, headers=headers)
res = conn.getresponse()
data = res.read()


conn.request("GET", cnpj_cachoeirinha, headers=headers)
res = conn.getresponse()
data = res.read()

conn.request("GET", cnpj_lagoas, headers=headers)
res = conn.getresponse()
data = res.read()

conn.request("GET", cnpj_goiania, headers=headers)
res = conn.getresponse()
data = res.read()


conn.request("GET", cnpj_serra, headers=headers)
res = conn.getresponse()
data = res.read()


conn.request("GET", cnpj_rj, headers=headers)
res = conn.getresponse()
data = res.read()


'''



