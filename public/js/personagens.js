async function carregarPersonagens() {
  const resposta = await fetch('../data/personagens.json');
  const personagens = await resposta.json();

  const container = document.getElementById('personagens-container');

  // Cada "container-sessao1" vai conter 3 personagens
  for (let i = 0; i < personagens.length; i += 3) {
    const grupo = personagens.slice(i, i + 3);

    const containerSessao = document.createElement('div');
    containerSessao.classList.add('container-sessao1');
    containerSessao.style.top = `${(i / 3) * 100}vh`;

    grupo.forEach(personagem => {
      const caixa = document.createElement('div');
      caixa.classList.add('caixa-sessao1');

      caixa.innerHTML = `
        <div class="container border1 slideshow-container">
          <section class="mySlides fade">
            <figure class="card card-background">
              <img class="card-img card-trans" src="${personagem.img}" alt="${personagem.nome}">
            </figure>
            <div class="content">
              <h3>${personagem.nome.toUpperCase()}</h3>
              <p class="description">${personagem.descricao}</p>
              <button class="btn-saiba" onclick="location.href='${personagem.link}?id=${personagem.id}'">Saiba Mais</button>
            </div>
          </section>
        </div>
      `;

      containerSessao.appendChild(caixa);
    });

    container.appendChild(containerSessao);
  }
}

carregarPersonagens();
