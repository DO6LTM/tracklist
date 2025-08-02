import initSqlJs from 'sql.js';

const sqlPromise = initSqlJs({
  locateFile: file => `https://sql.js.org/dist/${file}`
});

const dataPromise = fetch("/tracklist.sqlite").then(res => res.arrayBuffer());

const [SQL, buf] = await Promise.all([sqlPromise, dataPromise]);

const db = new SQL.Database(new Uint8Array(buf));

export function getDatabase() {
  return db;
}

