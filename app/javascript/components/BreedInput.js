import React from 'react';
import PropTypes from 'prop-types';

const BreedInput = ({ breed, setBreed }) => {
    return React.createElement('input', {
        type: 'text',
        value: breed,
        onChange: (e) => setBreed(e.target.value),
        placeholder: 'Breed',
        className: 'border p-2',
    });
};

BreedInput.propTypes = {
    breed: PropTypes.string.isRequired,
    setBreed: PropTypes.func.isRequired,
};

export default BreedInput;
