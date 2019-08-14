import * as React from "react";

interface Props {
}

interface State {}

class Test extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);
  }

  render = () => (
    <div>
      <p>dekitayo</p>
    </div>
  );
}

export default Test;
