class PasswordStrengthChecker {
    constructor() {
        this.passwordInput = document.querySelector('input[name="password"]');
        this.repassword = document.querySelector('input[name="repassword"]');
        this.sfz = document.getElementById('sfz');
        this.bir = document.getElementById('bir');
        this.nv = document.getElementById('nv');
        this.nan = document.getElementById('nan');
        // 添加失去焦点事件监听器
        this.passwordInput.addEventListener('blur', () => {
            this.passwordInput.setAttribute('type', 'text');
            const password = this.passwordInput.value;
            const strength = this.checkPasswordStrength(password);
            if (strength < 3) {
                alert('密码太弱，请重新输入');

            } else {
                this.passwordInput.setAttribute('type', 'password');
            }
        });
        this.repassword.addEventListener('blur', () => {

            const pass1 = this.passwordInput.value.trim();
            const pass2 = this.repassword.value.trim();
            if (pass1.length > 0 && pass2 !== pass1) {
                alert('两次密码不一致，请重新输入');
                this.passwordInput.setAttribute('type', 'text');
                this.repassword.setAttribute('type', 'text');
            } else {
                this.passwordInput.setAttribute('type', 'password');
                this.repassword.setAttribute('type', 'password');
            }

        });
        this.sfz.addEventListener('blur', () => {
            const sfzVal = this.sfz.value.trim();
            if (sfzVal.length === 0) return;

            function validateID(sfzVal) {
                const reg = /^[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2]\d|3[0-1])\d{3}[\dX]$/;
                return reg.test(sfzVal);
            }

            if (!validateID(sfzVal)) {
                alert('重新输入，身份证不合法');
                this.value = '';
            } else {
                const birthYear = sfzVal.substr(6, 4);
                const birthMonth = sfzVal.substr(10, 2);
                const birthDay = sfzVal.substr(12, 2);
                this.bir.value = `${birthYear}-${birthMonth}-${birthDay}`;
                const genderNum = parseInt(sfzVal.charAt(16));
                if (genderNum % 2 === 0) {
                    this.nv.checked = true;
                } else {
                    this.nan.checked = true;
                }
            }
        });
        let cityOptions = {
            sichuan: ["成都市", "绵阳市", "乐山市"],
            zhejiang: ["杭州市", "宁波市", "温州市"]
        };

        let provinceSelect = document.getElementById("province");
        let citySelect = document.getElementById("city");
        provinceSelect.addEventListener("change", function () {
            let cities = cityOptions[this.value];
            while (citySelect.options.length > 0) {
                citySelect.remove(0);
            }
            if (cities) {
                for (let i = 0; i < cities.length; i++) {
                    let option = new Option(cities[i], cities[i]);
                    citySelect.add(option);
                }
            } else {
                let option = new Option("请选择城市", "");
                citySelect.add(option);
            }
        });
    }

    checkPasswordStrength(password) {
        // 检查密码强度，这里使用了一个简单的正则表达式
        const pattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (pattern.test(password)) {
            return 5;
        } else if (password.length >= 8 && /[A-Za-z]/.test(password) && /\d/.test(password)) {
            return 3;
        } else if (password.length >= 6 && /[A-Za-z]/.test(password)) {
            return 2;
        } else {
            return 1;
        }
    }
}

new PasswordStrengthChecker();
