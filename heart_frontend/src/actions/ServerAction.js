export const server = (data) => {
  return {
    type: "SERVER_DOWN",
    payload: data,
  };
};
