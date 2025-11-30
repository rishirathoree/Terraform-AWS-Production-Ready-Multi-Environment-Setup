import axios from 'axios'
// env

const axiosInstance = axios.create({
    baseURL: import.meta.env.VITE_BASE_URL,
});

export default axiosInstance