import pool from "./db.connection.js";


// let results = await pool.query('SELECT NOW()');
// console.log(results.rows[0]);

//insertando datos a cuentas

let cuentaBank = {
    n_cuenta: 333,
    saldo: 300_000
}

const insertCta = async (ctaB)=>{
    try {
        let query = {
            text: 'INSERT INTO cuentas (n_cuenta, saldo) VALUES ($1,$2) RETURNING id, n_cuenta, saldo' ,
            values:[ctaB.n_cuenta, ctaB.saldo]
        }

        let result = await pool.query(query);
        let cta_b = result.rows;
        console.log(cta_b);
    } catch (error) {
        console.log(error);
        throw new Error("Error al registrar nueva cuentas bancaria");
    }
};

// insertCta(cuentaBank);

const consultCtaBankAll =  async ()=>{
    try {
        let consulta = await pool.query('SELECT * FROM cuentas');
        console.log(consulta.rows)
    } catch (error) {
        console.log();
    }
}

consultCtaBankAll();


const transaccion = async (monto, id_ctaOrigen, id_ctaDestino)=>{
    try {
        await pool.query('BEGIN');

        let descontar = {
            text: 'UPDATE cuentas SET saldo = saldo - $1 WHERE id = $2 RETURNING id, n_cuenta, saldo',
            values:[monto, id_ctaOrigen]
        }

        let descontarResults = await pool.query(descontar);

        if(descontarResults.rowCount == 0){
            console.log("No se puede transferir monto indicado");
        }
        console.log(descontarResults.rows);

        let agregar = {
            text: 'UPDATE cuentas SET saldo = saldo + $1 WHERE id = $2 RETURNING id, n_cuenta, saldo',
            values:[monto, id_ctaDestino]
        }

        let agregarRessults = await pool.query(agregar);
        console.log(agregarRessults.rows);

        await pool.query('COMMIT');

         let prueba = {
            montoT: monto,
            cta_origen: id_ctaOrigen,
            cta_destino: id_ctaDestino
        }

        trans(prueba);

    } catch (error) {
        await pool.query('ROLLBACK');
        if(error.code == "23514"){
            console.log("No posee saldo suficiente para realizar operación")
        } else {
            console.log(error);
        }
    }
};

// transaccion (26_000, 2,1);


const trans = async(p)=>{
    try {
        let insertar = {
            text: 'INSERT INTO transferencias (monto, n_cta_origen, n_cta_destino) VALUES ($1, $2, $3) returning id_trans, fecha, hora, monto ,n_cta_origen, n_cta_destino',
            values:[ p.montoT, p.cta_origen, p.cta_destino]
        }

        let result = await pool.query(insertar);
        console.log(result.rows);
    } catch (error) {
        console.log(error);
    }
}

//consulta de último 10 registros de transferencia

const ultimosMovimientos = async ()=>{
    try {
        let consuta = 'select t.fecha, t.hora, t.glosa, t.monto, c.n_cuenta from transferencias t inner join cuentas c on t.n_cta_origen = c.id order by t.id_trans limit 10;';
        let result = await pool.query(consuta);
        console.table(result.rows);
    } catch (error) {
        console.log();
    }
}

ultimosMovimientos();

// consulta cuenta con mayor saldo

const ctaSaldo = async ()=>{
    try {
        let consultaSaldo = 'SELECT n_cuenta, saldo FROM cuentas WHERE id = 2'
        let result = await pool.query(consultaSaldo);
        console.log(result.rows);
    } catch (error) {
        console.log("Error al realizar consulta de saldo")
    }
}

ctaSaldo();


