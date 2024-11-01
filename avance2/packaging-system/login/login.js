const leftDiv = document.getElementById('leftDiv');
const rightDiv = document.getElementById('rightDiv');
const link = document.getElementById('link');
const toggleImage = document.getElementById('toggleImage');
const toggleText = document.getElementById('toggleText');
const paragraph = document.getElementById('paragraph');
const images = [
    '../structures/svg/padlock-unlocked.svg',
    '../structures/svg/user.svg'
];

link.addEventListener('click', event => {
    event.preventDefault();

    leftDiv.style.opacity = '0';
    rightDiv.style.opacity = '0';

    leftDiv.classList.toggle('swapped');
    rightDiv.classList.toggle('swapped-right');

    setTimeout(() => {
        const isLogin = leftDiv.classList.contains('swapped');

        rightDiv.innerHTML = isLogin
            ? `

            <form action="">
                <strong style="font-size: 20px;">¡Solicita tu código!</strong>
                <p>Te enviaremos instrucciones al correo electronico.</p>
                <input class="form-control" type="text" required placeholder="Ingresa tu correo electrónico">
                <input class="form-control" type="text" required placeholder="Confirma tu correo electrónico">
                <button class="btn-primary">Siguiente</button>
            </form>`
            : `
            <form action="">
                <strong style="font-size: 20px;">¡Hola de nuevo!</strong>
                <p>¡Nos alegramos de volver a verte!</p>
                <input class="form-control" type="text" required placeholder="Usuario">
                <input class="form-control" type="text" required placeholder="Password">
                <button class="btn-primary">Iniciar sesión</button>
            </form>`;

        toggleImage.src = images[+isLogin];

        toggleText.textContent = isLogin ? '¿Ya tienes una cuenta?' : '¿Has olvidado la contraseña?';

        paragraph.textContent = isLogin ? 'Selecciona el icono para iniciar sesión.' : 'Selecciona el icono para solicitar instrucciones.';

        leftDiv.style.opacity = '1';
        rightDiv.style.opacity = '1';
    }, 800);
});