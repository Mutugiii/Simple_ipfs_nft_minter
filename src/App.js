import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

import Main from "./components/Main";
import Images from "./components/Images";
import UploadImage from "./components/image/UploadImage";

function App() {
  return (
      <Router>
        <div className="App">
          <Main>
            <Switch>
              <Route exact path="/" component={Images} />
              <Route exact path="/uploadimage" component={UploadImage} />
            </Switch>
          </Main>
        </div>
      </Router>
  );
}

export default App;