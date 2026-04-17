const authService = require('./services/auth.service');

(async () => {
  try {

    const user = await authService.register({
      name: "Admin",
      email: "admin2@test.com",
      password: "123456",
      role: "admin"
    });

    console.log("Usuario registrado:", user);

    const login = await authService.login(
      "admin2@test.com",
      "123456"
    );

    console.log("Login:", login);

  } catch (error) {
    console.error("ERROR:", error.message);
  }
})();
