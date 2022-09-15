#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt


# In[3]:


load_wine = pd.read_csv("C://Users/ACER/Documents/CURSOS/Formação Cientista de Dados/dados_totais/winequality-red.csv")


# In[5]:


wine = load_wine


# In[7]:


load_wine.keys()


# In[9]:


load_wine.head


# In[10]:


def outlier_iqr(data, col):
    q1 = load_wine[col].quantile(0.25)
    q3 = load_wine[col].quantile(0.75)
    
    iqr = q3 - q1
    
    out_inf = q1 - (1.5 * iqr)
    out_sup = q3 + (1.5 * iqr)
    
    num_out_inf = load_wine[load_wine[col]<out_inf].shape[0]
    num_out_sup = load_wine[load_wine[col]>out_sup].shape[0]
    
    return num_out_inf, num_out_sup


# In[12]:


load_wine.head


# In[15]:


for i in load_wine.columns:
    outl_inf, outl_sup = outlier_iqr(load_wine, i)
    print('Variável:', i)
    print('# outliers inferior:', outl_inf)
    print('# outliers superior:', outl_sup)
    print('='*70)


# In[ ]:




