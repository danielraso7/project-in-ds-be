import express from "express";
import categories from "./routes/category_route.js";
import goals from "./routes/goals_route.js";
import friends from "./routes/friend_route.js";
import trips from "./routes/trips_route.js";
import profile from "./routes/profile_route.js";
import cors from "cors";
const port = process.env.PORT || 8000;

const app = express();

// Body parser middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(
  cors({
    origin: "https://steady-crumble-0c4aac.netlify.app/",
    // origin: "http://localhost:5173",
    methods: ["GET", "POST", "PUT", "DELETE"],
    credentials: true,
  })
);

// Routes
app.use("/trips", trips);
app.use("/categories", categories);
app.use("/friends", friends);
app.use("/goals", goals);
app.use("/profile", profile);

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke! Default error handler catch.");
});

app.listen(port, () => console.log(`Server is running on port ${port}`));
