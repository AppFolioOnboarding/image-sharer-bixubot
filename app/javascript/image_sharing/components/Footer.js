import React from 'react';
import PropTypes from 'prop-types';

export default function Footer(props) {
  return (
    <p className="text-center"><small>{props.content}</small></p>
  );
}

Footer.propTypes = {
  content: PropTypes.string.isRequired
};
