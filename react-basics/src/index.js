import ReactDOM from 'react-dom';
import React from "react";

const element = <h1>Hello world</h1>;

function Webpage() {
  const name = "Oguz Aktas";
  const date = new Date();

  return <> <section>
    <header><h1>Hello {name}</h1></header>
    <p>sadasdasfjwj lqrqkdsfa şkwrekl jqwklasdkşarew jkldasjkdsa</p>
  </section>
  <Clock time={date}/>
  </>
}

function Clock(props) {
return <p>It's currently: {props.time.toLocaleTimeString("TR")}</p>
}

ReactDOM.render(<Webpage />, document.getElementById('main'));
