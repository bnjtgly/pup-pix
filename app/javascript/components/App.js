import React, { useState } from 'react';
import BreedInput from './BreedInput';
import SubmitButton from './SubmitButton';
import BreedImage from './BreedImage';
import ErrorMessage from './ErrorMessage';
import Spinner from './Spinner';

const App = () => {
    const [inputBreed, setInputBreed] = useState('');
    const [resultBreed, setResultBreed] = useState('');
    const [imageUrl, setImageUrl] = useState('');
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        setError('');
        setImageUrl('');
        let params = encodeURIComponent(inputBreed)

        try {
            const response = await fetch(`/fetch_breed?breed=${params}`);
            const data = await response.json();

            if (response.ok) {
                setImageUrl(data.image_url);
                setResultBreed(data.breed);
            } else {
                throw new Error(data.error);
            }
        } catch (error) {
            setError(error.message);
        } finally {
            setLoading(false);
        }
    };


    return (
        <div className="flex flex-row">
            <div className="w-1/2 flex flex-col justify-center items-center">
                <form onSubmit={handleSubmit} className="flex space-x-4">
                    <BreedInput breed={inputBreed} setBreed={setInputBreed}/>
                    <SubmitButton/>
                </form>
                <div className="mt-4">
                    <ErrorMessage error={error}/>
                </div>
            </div>
            <div className="w-1/2 flex justify-center items-center">
                <div className="h-64 w-full flex justify-center items-center"> {/* Added fixed height */}
                    {loading ? (
                        <Spinner />
                    ) : (
                        imageUrl && <BreedImage imageUrl={imageUrl} breed={resultBreed}/>
                    )}
                </div>
            </div>
        </div>
    );
};

export default App;
