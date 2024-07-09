db = db.getSiblingDB('LocalMongo');
db.createUser({
  user: 'root',
  pwd: 'pass',
  roles: [
    {
      role: 'readWrite',
      db: 'LocalMongo',
    },
  ],
});
