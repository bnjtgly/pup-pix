import React from 'react';
import PropTypes from 'prop-types';

const ErrorMessage = ({ error }) => {
    return error && React.createElement('p', { className: 'text-red-500 mt-4' }, error);
};

ErrorMessage.propTypes = {
    error: PropTypes.string,
};

export default ErrorMessage;
