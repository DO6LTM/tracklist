import initSqlJs from 'sql.js';

const sqlPromise = initSqlJs({
  locateFile: file => `/node_modules/sql.js/dist/${file}`
});

const dataPromise = fetch("/src/sql/tracklist.sqlite").then(res => res.arrayBuffer());

const [SQL, buf] = await Promise.all([sqlPromise, dataPromise]);

const db = new SQL.Database(new Uint8Array(buf));

export function getDatabase() {
  return db;
}

