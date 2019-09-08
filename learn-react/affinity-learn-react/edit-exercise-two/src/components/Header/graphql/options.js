export default {
  options: (props) => {
    return {
      fetchPolicy: "cache-and-network",
      variables: {
        id: "cjo7mteu5d9n20932f28yh40j"
      }
    };
  },

  props: (result) => {
    return { ...result.data };
  }
};
