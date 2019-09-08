import gql from "graphql-tag";

export default gql`
query ($id: ID) {
  personalDetails(where: {id: $id}) {
    createdAt
    updatedAt
    status
    id
    name
    description
  }
}`;
