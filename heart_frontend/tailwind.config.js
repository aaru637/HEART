import { content as _content, plugin } from "flowbite-react/tailwind";

/** @type {import('tailwindcss').Config} */
export const content = ["./src/**/*.{js,jsx,ts,tsx}", _content()];
export const theme = {
  fontFamily: {
    sora: ["Sora", "sans-serif"],
    bree: ["Bree Serif", "sans-serif"],
    exo: ["Exo 2", "Georgia"],
    roboto: ["Roboto", "sans-serif"],
    ubuntu: ["Ubuntu", "sans-serif"],
  },
};
export const plugins = [plugin()];
