import psycopg2
from psycopg2 import sql



def create_db():
    with psycopg2.connect(database="netology_db", user="postgres", password="PoStGrEs") as conn:
        with conn.cursor() as cur:
            cur.execute("""
            CREATE TABLE IF NOT EXISTS clients(
                id SERIAL PRIMARY KEY,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                email VARCHAR(100) NOT NULL UNIQUE
            );
            """)
            cur.execute("""
            CREATE TABLE IF NOT EXISTS phones(
                id SERIAL PRIMARY KEY,
                client_id INTEGER,
                phone VARCHAR(15),
                FOREIGN KEY (client_id) REFERENCES clients (id) ON DELETE CASCADE
            );
            """)
            conn.commit()


def add_client(first_name, last_name, email):
    with psycopg2.connect(database="netology_db", user="postgres", password="PoStGrEs") as conn:
        with conn.cursor() as cur:
            cur.execute('''
            INSERT INTO clients (first_name, last_name, email) VALUES (%s, %s, %s)
            RETURNING id
            ''', (first_name, last_name, email))
            client_id = cur.fetchone()[0]
            conn.commit()
    return client_id

def add_phone(client_id, phone):
    with psycopg2.connect(database="netology_db", user="postgres", password="PoStGrEs") as conn:
        with conn.cursor() as cur:
            cur.execute('''
            INSERT INTO phones (client_id, phone) VALUES (%s, %s)
            ''', (client_id, phone))
            conn.commit()

def update_client(client_id, first_name=None, last_name=None, email=None):
    with psycopg2.connect(database="netology_db", user="postgres", password="PoStGrEs") as conn:
        with conn.cursor() as cur:
            if first_name:
                cur.execute('UPDATE clients SET first_name = %s WHERE id = %s', (first_name, client_id))
            if last_name:
                cur.execute('UPDATE clients SET last_name = %s WHERE id = %s', (last_name, client_id))
            if email:
                cur.execute('UPDATE clients SET email = %s WHERE id = %s', (email, client_id))
            conn.commit()
            
def delete_phone(phone_id):
    with psycopg2.connect(database="netology_db", user="postgres", password="PoStGrEs") as conn:
        with conn.cursor() as cur:
            cur.execute('DELETE FROM phones WHERE id = %s', (phone_id,))
            conn.commit()
            
def delete_client(client_id):
    with psycopg2.connect(database="netology_db", user="postgres", password="PoStGrEs") as conn:
        with conn.cursor() as cur:
            cur.execute('DELETE FROM clients WHERE id = %s', (client_id,))
            conn.commit()
            
def find_client(search_term):
    with psycopg2.connect(database="netology_db", user="postgres", password="PoStGrEs") as conn:
        with conn.cursor() as cur:
            curs.execute(sql.SQL('''
                        SELECT * FROM clients WHERE first_name ILIKE %s OR last_name ILIKE %s OR email ILIKE %s
                        '''),
                           (f'%{search_term}%', f'%{search_term}%', f'%{search_term}%'))

            clients = cur.fetchall()

            cur.execute(sql.SQL('''
                        SELECT c.id, c.first_name, c.last_name, c.email, p.phone FROM clients c
                        LEFT JOIN phones p ON c.id = p.client_id WHERE p.phone ILIKE %s
                        '''), (f'%{search_term}%',))

            phones = cur.fetchall()

            print("Clients:")
            for client in clients:
                print(client)
            print("Phones:")
            for phone in phones:
                print(phone)
