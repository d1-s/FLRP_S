document.addEventListener('DOMContentLoaded', function(){
  if (document.getElementById('my-search-form')){
    const submit = document.getElementById('reset-btn');
    submit.addEventListener('click', () => {
      // e.preventDefault();

      document.getElementById('search-input').removeAttribute('name')
      document.getElementById('search-select').setAttribute('value', "")

      document.getElementById('my-search-form').submit();
    });
  };
});