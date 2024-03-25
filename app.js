const express = require('express');
const path = require('path');

const app = express();
const port = 3000;

app.use('/website', express.static(path.join(__dirname, 'public')));

app.use((req, res) => {
    res.status(404);
    res.send(`<h1>Error 404: Request not found!</h1>`);
});

app.listen(port, () => {
    console.log("App listening on port 3000");
})
