function somar() {
    let tn1 = document.getElementById("txtn1")
    let tn2 = document.getElementById("txtn2")
    let res = document.getElementById("res")

    let s1 = Number(tn1.value)
    let s2 = Number(tn2.value)

    let soma = s1 + s2
    res.innerHTML = `A soma entre ${s1} + ${s2} é igual ${soma} `
}


function mult() {
    let mc1 = document.getElementById("txtn1")
    let mc2 = document.getElementById("txtn2")
    let res = document.getElementById("res");

    let m1 = Number(mc1.value)
    let m2 = Number(mc2.value)

    let produto = m1 * m2
    res.innerHTML = `A multiplicação entre ${m1} x ${m2} é igual a ${produto}`
}

function divisão() {
    let dv1 = document.getElementById("txtn1")
    let dv2 = document.getElementById("txtn2")
    let res = document.getElementById("res")

    let dd1 = Number(dv1.value)
    let dd2 = Number(dv2.value) 

    let divi1 = dd1 / dd2
    res.innerHTML = `A divisão entre ${dd1} ÷ ${dd2} é igual a ${divi1} ` 
}

function subtr() {
    let sub1 = document.getElementById("txtn1")
    let sub2 = document.getElementById("txtn2")
    let res = document.getElementById("res")


    let su1 = Number(sub1.value)
    let su2 = Number(sub2.value)

    let subt1 = su1 - su2
    res.innerHTML = `A divisão entre ${su1} - ${su2} é igual a ${subt1} `
}
