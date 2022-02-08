const Dom = {
    urlSelector: "url-input",
    errorSelector: "result-error",
    urlDetailsSelector: "result-placeholder",
    css: {
        error: ["bg-red", "bg-box"]
    }
};

window.addEventListener('load', () => {
    var url = document.getElementById(Dom.urlSelector);
    if (url) {
        url.addEventListener('change', urlChanged);
        url.addEventListener('keyup', urlChanged);
    }
});

function urlChanged(e) {
    resetErrors();
    const text = e.target.value;
    if (text === '' || text.trim() === '') {
        return;
    }
    try {
        const url = new URL(text);
        renderUrlDetails(url);
    } catch (error) {
        resetUrlDetails();
        renderError(error);
    }
}

function renderError(error) {
    console.error("Text is not a valid URL:", error);

    var res = document.getElementById(Dom.errorSelector);
    res.textContent = "The inserted text is not a valid URL \n" + error;
    res.classList.add(...Dom.css.error);
    res.style.visibility = "visible";
}

function resetErrors() {
    var res = document.getElementById(Dom.errorSelector);
    res.style.visibility = "hidden";
}

function resetUrlDetails() {
    var res = document.getElementById(Dom.urlDetailsSelector);
    removeAllChildElements(res);
    return res;
}

function removeAllChildElements(elem) {
    // idea from https://stackoverflow.com/a/3955238/797369
    elem.textContent = '';
}

function renderUrlDetails(url) {
    var res = resetUrlDetails();
    res.appendChild(createProp("URL Is Valid!"));
    res.appendChild(createProp("origin", url.origin));
    res.appendChild(createProp("protocol", url.protocol));
    res.appendChild(createProp("host", url.host));
    res.appendChild(createProp("port", url.port));
    res.appendChild(createProp("path", url.pathname));
    res.appendChild(createProp("fragment", url.hash));
    const hasQsParams = !url.searchParams.keys().next().done;
    if (hasQsParams) {
        res.appendChild(createProp("Query String Decomposition:"));
        for (let param of url.searchParams) {
            res.appendChild(createProp(param[0], param[1]));
        }
    }
    res.style.visibility = "visible";
}

function createProp(key, value) {
    var prop = document.createElement('p');
    if (value === undefined) {
        prop.textContent = key;
    } else {
        prop.textContent = `${key}: ${value}`;
    }
    return prop;
}