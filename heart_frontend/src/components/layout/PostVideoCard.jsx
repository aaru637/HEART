import { Pause, PlayArrow, VolumeOff, VolumeUp } from "@mui/icons-material";
import React, { useEffect, useRef, useState } from "react";
import "../../components/specific/DashboardPage/HomePage/PostCard/post-card-style.css";

const PostVideoCard = ({ item, ...props }) => {
  const videoRef = useRef(null);
  const [videoFile] = useState(item.video);
  const [playing, setPlaying] = useState(false);
  const [volumeOn, setVolumeOn] = useState(false);
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    const videoElement = videoRef.current;
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setIsVisible(true);
            observer.unobserve(videoElement);
          }
        });
      },
      {
        threshold: 0.5, // Adjust the threshold value as needed
      },
      { videoElement }
    );

    if (videoElement) {
      observer.observe(videoElement);
    }

    return () => {
      if (videoElement) {
        observer.unobserve(videoElement);
      }
    };
  }, [videoRef]);

  const handleControl = () => {
    if (playing) {
      videoRef.current.pause();
      setPlaying(false);
    } else {
      videoRef.current.play();
      setPlaying(true);
    }
  };
  return (
    <>
      <div className="relative">
        <div
          className={`absolute z-[2] w-full h-full flex justify-center items-center`}
          onClick={() => handleControl()}
        >
          {!playing && <Pause fontSize="large" className="pause-animation" />}
          {playing && (
            <PlayArrow fontSize="large" className="pause-animation" />
          )}
        </div>
        <div
          className="absolute z-[2] bottom-2 right-3"
          onClick={() => setVolumeOn(!volumeOn)}
        >
          {volumeOn ? (
            <VolumeOff fontSize="small" />
          ) : (
            <VolumeUp fontSize="small" />
          )}
        </div>
        <video
          ref={videoRef}
          className="w-fit"
          src={isVisible ? videoFile : undefined}
          {...props}
          loop={true}
          // poster={item.image}
        />
      </div>
    </>
  );
};

export default PostVideoCard;
