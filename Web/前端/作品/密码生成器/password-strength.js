class PasswordGenerator {
    constructor(length, lowercase, uppercase, numbers, special) {
        this.length = length;
        this.lowercase = lowercase;
        this.uppercase = uppercase;
        this.numbers = numbers;
        this.special = special;
    }

    generatePassword() {
        let charset = '';
        if (this.lowercase) charset += 'abcdefghijklmnopqrstuvwxyz';
        if (this.uppercase) charset += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        if (this.numbers) charset += '0123456789';
        if (this.special) charset += '!@#$%^&*()_+~`|}{[]\:;?><,./-=';
        let password = '';
        for (let i = 0; i < this.length; i++) {
            let randomIndex = Math.floor(Math.random() * charset.length);
            password += charset[randomIndex];
        }
        return password;
    }
}

const lengthInput = document.getElementById('length');
const lowercaseInput = document.querySelector('input[value="lowercase"]');
const uppercaseInput = document.querySelector('input[value="uppercase"]');
const numbersInput = document.querySelector('input[value="numbers"]');
const specialInput = document.querySelector('input[value="special"]');
const generateBtn = document.getElementById('generate-btn');
const passwordInput = document.getElementById('password');
const copyBtn = document.getElementById('copy-btn');

generateBtn.addEventListener('click', function(){
    const length = parseInt(lengthInput.value);
    const lowercase = lowercaseInput.checked;
    const uppercase = uppercaseInput.checked;
    const numbers = numbersInput.checked;
    const special = specialInput.checked;
    const generator = new PasswordGenerator(length, lowercase, uppercase, numbers, special);
    const password = generator.generatePassword();
    passwordInput.value = password;
    // passwordInput.setAttribute('value', generator.generatePassword());
});

copyBtn.addEventListener('click', () => {
    passwordInput.select();
    document.execCommand('copy');
    alert('Password copied to clipboard!');
});
