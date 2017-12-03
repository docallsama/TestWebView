function changeImage() {
    document.getElementById("userIcon").src="https://www.w3schools.com/css/img_lights.jpg";
}

function actionLogin() {
    invoke(2,"login","from=ios");
}

function actionSetting() {
    invoke(1,"setting","from=ios");
}

function invoke(type,action,params) {
    if (type == 1) {
        try {
            window.action.execParam(action,params);
        } catch (e) {
            console.log(e.message);
        }
    } else {
        try {
            var iframe;
            iframe = document.createElement('iframe');
            iframe.setAttribute('src', action + '://uzai?' + params);
            iframe.setAttribute('style', 'display:none;');
            iframe.setAttribute('height', '0px');
            iframe.setAttribute('width', '0px');
            iframe.setAttribute('frameborder', '0');
            document.body.appendChild(iframe);
            iframe.parentNode.removeChild(iframe);
            iframe = null;
        } catch (e) {
            console.log(e.message);
        }
    }
}
