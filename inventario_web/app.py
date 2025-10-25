import sqlite3
from flask import Flask, render_template, request, redirect, url_for, g

app = Flask(__name__)
DATABASE = 'inventory.db'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
        db.row_factory = sqlite3.Row
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()

@app.cli.command('init-db')
def init_db_command():
    """Initializes the database."""
    init_db()
    print('Initialized the database.')

@app.route('/')
def index():
    db = get_db()
    cur = db.execute('SELECT * FROM inventory ORDER BY id DESC')
    inventory = cur.fetchall()
    return render_template('index.html', inventory=inventory)

@app.route('/add', methods=['POST'])
def add():
    db = get_db()
    db.execute('INSERT INTO inventory (description, quantity, unit, unit_price) VALUES (?, ?, ?, ?)',
               [request.form['description'], request.form['quantity'], request.form['unit'], request.form['unit_price']])
    db.commit()
    return redirect(url_for('index'))

@app.route('/edit/<int:id>', methods=['GET', 'POST'])
def edit(id):
    db = get_db()
    if request.method == 'POST':
        db.execute('UPDATE inventory SET description = ?, quantity = ?, unit = ?, unit_price = ? WHERE id = ?',
                   [request.form['description'], request.form['quantity'], request.form['unit'], request.form['unit_price'], id])
        db.commit()
        return redirect(url_for('index'))
    
    cur = db.execute('SELECT * FROM inventory WHERE id = ?', [id])
    item = cur.fetchone()
    return render_template('edit.html', item=item)

@app.route('/delete/<int:id>')
def delete(id):
    db = get_db()
    db.execute('DELETE FROM inventory WHERE id = ?', [id])
    db.commit()
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
