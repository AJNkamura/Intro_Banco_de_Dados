import os
os.environ["GOOGLE_API_KEY"] = "-"

from sqlalchemy import create_engine
from langchain_community.utilities import SQLDatabase
from langchain_google_genai.chat_models import ChatGoogleGenerativeAI
from langchain_community.agent_toolkits import create_sql_agent
import streamlit as st #para a interface

# Conecta ao banco de dados
usuario = "-" 
senha = "-"
host = "-"
banco = "-"
engine = create_engine(f"mysql+pymysql://{usuario}:{senha}@{host}/{banco}")
db = SQLDatabase(engine)

#teste conexao com o bd
print('>>>>>>>>>>>>>> Conexão com o BD OK <<<<<<<<<<<<<<<<<<<<<')


#llm = ChatGoogleGenerativeAI(model="models/gemini-2.0-flash-live-001", temperature=0) -> problema com o modelo
llm = ChatGoogleGenerativeAI(model="gemini-1.5-flash-latest", temperature=0)
agent_executor = create_sql_agent(llm=llm, db=db, agent_type="openai-tools", verbose=True) # verbose+True -> permite ver o processo de "Pensamento"

#Testar o código sem a interface
#resposta = agent_executor.invoke({"input": "Qual a soma dos salários dos professores de música??"})
#print(resposta['output'])


#------------------- INTERFACE----------------------------#
st.title("Pergunte algo sobre o banco de dados University")

# Campo de entrada de texto
query_usuario = st.text_input("Digite sua pergunta:", "")

# Quando o usuário clica no botão
if st.button("Consultar"):
    if query_usuario.strip() == "":
        st.warning("Por favor, digite uma pergunta.")
    else:
        with st.spinner("Consultando o banco de dados..."):
            try:
                resposta = agent_executor.invoke({"input": query_usuario})
                st.success("Resposta:")
                st.write(resposta['output'])
            except Exception as e:
                st.error(f"Erro: {str(e)}")
