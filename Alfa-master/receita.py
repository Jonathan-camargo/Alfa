import http.client
from operator import length_hint
import string

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

print(data.decode("utf-8"))

conn.request("GET", cnpj_curitiba, headers=headers)


res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))