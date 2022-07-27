#!/usr/bin/env python
# coding: utf-8

# In[3]:


import pandas as pd
import seaborn as sns
from sklearn.preprocessing import MinMaxScaler


# In[5]:


df = pd.read_csv('C:/Users/ACER/Documents/CURSOS/Formação Cientista de Dados/dados_totais/m4-a2-exercicio.csv')


# In[6]:


df.info()


# In[7]:


df['Curso'] = df['Diâmetro do Cilindro'] / df['Comprimento do Pistão']


# In[8]:


df['Curso'].fillna(df['Curso'].mean())
df.head()


# In[9]:


df['Preço'] = df['Preço'].fillna(df['Preço'].mean())
df.info()


# In[10]:


sns.kdeplot(df['Preço'], shade=True)


# In[11]:


sns.kdeplot(df['Curso'], shade=True)


# In[12]:


dfa = df[['Número de Portas', 'Preço', 'Curso', 'Marca']].reset_index(drop=True)


# In[13]:


dfa.rename(columns={'Número de Portas': 'Portas'}, inplace=True)


# In[14]:


scaler = MinMaxScaler().fit_transform(dfa[['Preço','Curso']].values)


# In[15]:


scaler_df = pd.DataFrame(scaler, columns=['Preço','Curso'])


# In[16]:


dfa = pd.concat([scaler_df, dfa[['Portas','Marca']]], axis=1)

dfa.head()


# In[17]:


sns.scatterplot(x='Curso', y='Preço', data=dfa)


# In[18]:


dfa = pd.get_dummies(dfa, columns=['Portas','Marca'])
dfa.head()


# In[ ]:




