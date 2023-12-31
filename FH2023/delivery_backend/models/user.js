const db = require("../config/config.js");
const bcrypt = require("bcryptjs");

const User = {};
User.findById = (id, result) => {
  const sql = `
  SELECT 
  id,
  email,
  name,
  lastname,
  image,
  password
  FROM
   users
    WHERE id = ?
    `;
};

User.create = async (user, result) => {
  const hash = await bcrypt.hash(user.password, 10);

  const sql = `
  INSERT INTO
  users(
    email,
    name,
    lastname,
    phone,
    image,
    password,
    created_at,
    updated_at
    )
    VALUES(?,?,?,?,?,?,?,?)
  `;

  db.query(
    sql,
    [
      user.email,
      user.name,
      user.lastname,
      user.phone,
      user.image,
      hash,
      new Date(),
      new Date(),
    ],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
      } else {
        console.log("User created: ", res.insertId);
        result(null, res.insertId);
      }
    }
  );
};

module.exports = User;
