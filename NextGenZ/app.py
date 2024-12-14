from flask import Flask, render_template, g
import pymysql
import os  # Para trabalhar com variáveis de ambiente

app = Flask(__name__)

# Configuração do banco de dados usando variáveis de ambiente
DB_CONFIG = {
    "host": os.getenv("DB_HOST", "localhost"),    
    "user": os.getenv("DB_USER", "root"),          
    "password": os.getenv("DB_PASSWORD", ""),      
    "database": os.getenv("DB_NAME", "library")     
}

def get_db():
    """Cria e retorna uma conexão com o banco de dados."""
    db = getattr(g, "_database", None)
    if db is None:
        db = g._database = pymysql.connect(
            host=DB_CONFIG["host"],
            user=DB_CONFIG["user"],
            password=DB_CONFIG["password"],
            database=DB_CONFIG["database"],
            cursorclass=pymysql.cursors.DictCursor
        )
    return db

@app.teardown_appcontext
def close_connection(exception):
    """Fecha a conexão com o banco ao encerrar o contexto."""
    db = getattr(g, "_database", None)
    if db is not None:
        db.close()

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/books")
def books():
    db = get_db()
    with db.cursor() as cursor:
        cursor.execute("SELECT * FROM books")
        books = cursor.fetchall()
    return render_template("books.html", books=books)

@app.route("/authors")
def authors():
    db = get_db()
    with db.cursor() as cursor:
        cursor.execute("SELECT * FROM authors")
        authors = cursor.fetchall()
    return render_template("authors.html", authors=authors)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
