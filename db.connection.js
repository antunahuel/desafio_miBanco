import pg from "pg";

const {Pool} = pg;


const pool = new Pool({
    user:'postgres',
    host:'localhost',
    port:5432,
    password:'123456',
    database:'db_bank_review',
    idleTimeoutMillis:100
});

export default pool;