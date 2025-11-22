# Projeto de Automação de Testes — Robot Framework + Python

Bem-vindo ao projeto **Projeto OrangeHRM**, uma automação completa utilizando **Robot Framework**, **Python** e **SeleniumLibrary**.  
Este README foi criado para orientar desde a instalação até a execução total dos testes.

---

# 📌 1. Instalação do Python

O Python é necessário para rodar o Robot Framework e todas as bibliotecas do projeto.

---

## 🔹 1.1 Instalar Python no **Windows**

### **Passo 1 — Baixar o Python**
Acesse:  
https://www.python.org/downloads/

### **Passo 2 — Instalar**
Durante a instalação:
✅ **Marque a opção “Add Python to PATH”**  
Depois clique em *Install Now*.

### **Passo 3 — Verificar se está instalado**
Abra o terminal (CMD ou PowerShell):

```
python --version
pip --version
```

---

## 🔹 1.2 Instalar Python no **macOS**

### **Passo 1 — Baixar o Python**
Acesse:  
https://www.python.org/downloads/macos/

### **Passo 2 — Instalar**
Siga o instalador normalmente.

### **Passo 3 — Verificar instalação**

```
python3 --version
pip3 --version
```

Se necessário, criar link simbólico:

```
brew install python
```

---

## 🔹 1.3 Instalar Python no **Linux**

### **Debian/Ubuntu**
```
sudo apt update
sudo apt install python3 python3-pip
```

### **Verificar instalação**
```
python3 --version
pip3 --version
```

---

# 📌 2. Instalar Robot Framework e dependências

## 🔹 2.1 Instalar Robot Framework
```
pip install robotframework
```

## 🔹 2.2 Instalar SeleniumLibrary
```
pip install robotframework-seleniumlibrary
```

## 🔹 2.3 Instalar todas as dependências do projeto
```
pip install -r requirements.txt
```

### Para que serve o `requirements.txt`?
Ele contém **todas as bibliotecas necessárias** para rodar o projeto.  
O comando acima instala todas automaticamente.

---

# 📌 3. Estrutura do Projeto

Baseado no seu ZIP **Projeto OrangeHRM**, a estrutura é:

```
Projeto OrangeHRM/
│── tests/
│    └── web/
│── resources/
│── locators/
│── keywords/
│── custom_keywords.py
│── requirements.txt
│── README.md
```

### Explicação breve das pastas
| Pasta | Função |
|-------|--------|
| tests/web | Onde ficam os testes automatizados |
| resources | Recursos compartilhados entre testes |
| locators | Localizadores de elementos da página |
| keywords | Keywords criadas com sintaxe Robot |
| custom_keywords.py | Keywords feitas em Python |
| requirements.txt | Lista de dependências |

---

# 📌 4. Como executar os testes

## 🔹 4.1 Executar todos os testes da pasta `tests/web`
```
robot tests/web
```

## 🔹 4.2 Executar apenas um arquivo específico
```
robot tests/web/login.robot
```

## 🔹 4.3 Executar apenas um cenário
```
robot --test "Nome do Cenário" tests/web/login.robot
```

Ou utilizando tags:
```
robot --include smoke tests/web
```

---

# 📌 5. Executar testes usando variáveis
```
robot -v BROWSER:chrome tests/web
robot -v BROWSER:edge tests/web
```

---

# 📌 6. Executar em modo HEADLESS
```
robot -v HEADLESS:True tests/web
```

---

# 📌 7. Relatórios

Após a execução, os relatórios estarão na raiz do projeto:

- log.html  
- report.html  
- output.xml  

---

# 📌 8. Rodar o projeto do zero

### 1. Clonar repositório
```
git clone <url-do-repositorio>
```

### 2. Criar ambiente virtual
```
python -m venv venv
```

### 3. Ativar venv
Windows:
```
venv\Scripts\activate
```
Mac/Linux:
```
source venv/bin/activate
```

### 4. Instalar dependências
```
pip install -r requirements.txt
```

### 5. Executar testes
```
robot tests/web
```

---

# 📌 9. Informações adicionais

### Atualizar drivers
```
pip install webdriver-manager
```

### Possíveis erros
| Erro | Solução |
|------|---------|
| WebDriverException | Atualize drivers |
| ModuleNotFoundError | Rode `pip install -r requirements.txt` |
| robot: command not found | Reabra o terminal |

---

# 🎉 Projeto pronto para uso!
