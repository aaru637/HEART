import axios from "axios";

const getImages = async () => {
  let response = await axios.get(
    "https://api.pexels.com/videos/popular?per_page=10",
    {
      headers: {
        Authorization:
          "HgRQ4pgfIrGMtQ7nP5qHLW3rzOtlK8FeaNY9UwLbp7tpHOJyV6h64A45",
      },
    }
  );
  console.log(response.data.videos);
  let data = await response.data.videos;
  return data;
};

export default getImages;
