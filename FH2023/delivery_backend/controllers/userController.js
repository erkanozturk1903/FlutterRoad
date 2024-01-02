const User = require("../models/user");

module.exports = {
  register(req, res) {
    const user = req.body; // I capture the data that the client sends me
    User.create(user, (err, data) => {
      if (err) {
        return res.status(501).json({
          succes: false,
          message: "Kullanıcı kaydı yapılamadı",
          error: err,
        });
      }
      return res.status(201).json({
        succes: true,
        message: "Kullanıcı kaydı başarılı",
        data: data,
      });
    });
  },
};
