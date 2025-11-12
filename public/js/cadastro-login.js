  const form = document.getElementById('form-login');

  form.addEventListener('submit', (e) => {
    // Marca o formulário como "enviado"
    form.classList.add('enviado');

    // Se algum campo for inválido, impede o envio
    if (!form.checkValidity()) {
      e.preventDefault();
    }
  });

