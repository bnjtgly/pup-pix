import React from 'react';

const SubmitButton = () => {
    return React.createElement('button', {
        id: 'search-button',
        type: 'submit',
        className: 'bg-blue-500 text-white p-2',
    }, 'Submit');
};

export default SubmitButton;
