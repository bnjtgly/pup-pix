import React from 'react';
import PropTypes from 'prop-types';

const BreedImage = ({ imageUrl, breed }) => {
    return React.createElement(
        'div',
        { className: 'mt-4' },
        React.createElement('p', { className: 'font-bold' }, breed.charAt(0).toUpperCase() + breed.slice(1)),
        React.createElement('img', { src: imageUrl, alt: breed, className: 'w-64 h-64 object-cover' })
    );
};

BreedImage.propTypes = {
    imageUrl: PropTypes.string.isRequired,
    breed: PropTypes.string.isRequired,
};

export default BreedImage;
