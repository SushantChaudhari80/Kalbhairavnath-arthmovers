<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta http-equiv="Cache-Control"
          content="no-cache, no-store, must-revalidate">

    <meta http-equiv="Pragma"
          content="no-cache">

    <meta http-equiv="Expires"
          content="0">

    <link rel="icon"
          type="image/png"
          href="img/project_logo.png">

    <title>Transport ERP | Login</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <jsp:include page="url.jsp"/>


<style>

/* =========================================================
   RESET
========================================================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html,
body {
    width: 100%;
    height: 100%;
}

body {

    font-family:
        Inter,
        "Segoe UI",
        Roboto,
        Arial,
        sans-serif;

    background: #07111d;

    color: #ffffff;

    overflow: hidden;

    -webkit-font-smoothing: antialiased;
}


/* =========================================================
   COLORS
========================================================= */

:root {

    --yellow: #ffb21a;
    --yellow-dark: #e78a00;

    --navy: #07111d;
    --navy-light: #0d1a29;

    --text: #f8fafc;
    --muted: #8fa1b5;

    --border:
        rgba(255,255,255,.09);
}


/* =========================================================
   MAIN
========================================================= */

.erp-page {

    width: 100vw;
    height: 100vh;

    display: grid;

    grid-template-columns:
        minmax(0, 1fr)
        430px;

    overflow: hidden;

    background: #07111d;
}


/* =========================================================
   LEFT SIDE
========================================================= */

.visual-side {

    position: relative;

    overflow: hidden;

    min-width: 0;

    background:

        radial-gradient(
            circle at 75% 22%,
            rgba(255,177,25,.11),
            transparent 22%
        ),

        linear-gradient(
            180deg,
            #06121f 0%,
            #091725 55%,
            #111a21 100%
        );
}


/* =========================================================
   BACKGROUND LIGHT
========================================================= */

.background-light {

    position: absolute;

    width: 500px;
    height: 500px;

    right: 4%;
    top: -250px;

    border-radius: 50%;

    background:
        radial-gradient(
            circle,
            rgba(255,178,26,.13),
            transparent 68%
        );

    animation:
        lightPulse 7s ease-in-out infinite;
}

@keyframes lightPulse {

    0%,
    100% {
        transform: scale(1);
        opacity: .6;
    }

    50% {
        transform: scale(1.15);
        opacity: 1;
    }
}


/* =========================================================
   BRAND
========================================================= */

.brand {

    position: absolute;

    top: 33px;
    left: 48px;

    z-index: 20;

    display: flex;

    align-items: center;

    gap: 13px;
}

.brand-logo {

    width: 48px;
    height: 48px;

    border-radius: 13px;

    display: flex;

    align-items: center;
    justify-content: center;

    background:
        linear-gradient(
            135deg,
            #ffc42e,
            #f39a00
        );

    color: #101820;

    font-size: 21px;

    font-weight: 900;

    box-shadow:
        0 10px 30px
        rgba(255,178,26,.22);
}

.brand-name {

    font-size: 20px;

    font-weight: 700;

    line-height: 1.2;
}

.brand-subtitle {

    margin-top: 3px;

    color: #75869a;

    font-size: 10px;

    letter-spacing: 1.7px;

    text-transform: uppercase;
}


/* =========================================================
   HERO
========================================================= */

.hero {

    position: absolute;

    top: 20%;
    left: 6%;

    z-index: 15;

    max-width: 650px;
}

.system-badge {

    display: inline-flex;

    align-items: center;

    gap: 8px;

    padding:
        7px 12px;

    border:
        1px solid
        rgba(255,178,26,.25);

    border-radius: 30px;

    background:
        rgba(255,178,26,.055);

    color: #ffbd26;

    font-size: 10px;

    font-weight: 600;

    letter-spacing: .8px;

    text-transform: uppercase;
}

.live-dot {

    width: 7px;
    height: 7px;

    border-radius: 50%;

    background: #22c55e;

    box-shadow:
        0 0 10px
        rgba(34,197,94,.8);

    animation:
        livePulse 1.6s infinite;
}

@keyframes livePulse {

    0%,
    100% {
        transform: scale(1);
        opacity: 1;
    }

    50% {
        transform: scale(.55);
        opacity: .5;
    }
}


.hero h1 {

    margin-top: 20px;

    font-size:
        clamp(42px, 5vw, 70px);

    line-height: .98;

    letter-spacing: -3px;

    font-weight: 750;
}

.hero h1 .orange {

    color: var(--yellow);

    animation:
        orangeGlow 4s ease-in-out infinite;
}

@keyframes orangeGlow {

    0%,
    100% {
        text-shadow:
            0 0 0
            rgba(255,178,26,0);
    }

    50% {
        text-shadow:
            0 0 30px
            rgba(255,178,26,.25);
    }
}

.hero-description {

    max-width: 530px;

    margin-top: 22px;

    color: #91a4b8;

    font-size: 14px;

    line-height: 1.75;
}


/* =========================================================
   OPERATION CARD
========================================================= */

.operation-card {

    position: absolute;

    z-index: 30;

    top: 16%;

    right: 7%;

    width: 180px;

    padding: 16px;

    border:
        1px solid
        rgba(255,255,255,.08);

    border-radius: 15px;

    background:
        rgba(10,24,39,.65);

    backdrop-filter:
        blur(15px);

    box-shadow:
        0 20px 60px
        rgba(0,0,0,.20);

    animation:
        operationFloat 5s ease-in-out infinite;
}

@keyframes operationFloat {

    0%,
    100% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-7px);
    }
}

.operation-header {

    display: flex;

    justify-content:
        space-between;

    margin-bottom: 10px;

    color: #7d8ea2;

    font-size: 9px;

    letter-spacing: 1px;

    text-transform: uppercase;
}

.operation-live {

    width: 6px;
    height: 6px;

    border-radius: 50%;

    background: #22c55e;

    box-shadow:
        0 0 8px #22c55e;
}

.operation-row {

    display: flex;

    justify-content:
        space-between;

    padding: 8px 0;

    border-bottom:
        1px solid
        rgba(255,255,255,.055);

    font-size: 10px;
}

.operation-row:last-child {
    border-bottom: 0;
}

.operation-label {
    color: #66788c;
}

.operation-value {
    color: #dce4ec;
    font-weight: 600;
}

.operation-value.active {
    color: #ffb21a;
}


/* =========================================================
   SVG SCENE
========================================================= */

.scene {

    position: absolute;

    z-index: 10;

    left: 0;
    right: 0;

    bottom: 45px;

    width: 100%;

    height: 58%;

    overflow: visible;
}


/* =========================================================
   SVG ANIMATIONS
========================================================= */

/* Excavator body */

.excavator-machine {

    animation:
        machineFloat
        4s ease-in-out infinite;
}

@keyframes machineFloat {

    0%,
    100% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-3px);
    }
}


/* Excavator boom */

.excavator-boom {

    transform-box: fill-box;

    transform-origin: 0% 100%;

    animation:
        boomMove
        5s ease-in-out infinite;
}

@keyframes boomMove {

    0%,
    100% {
        transform: rotate(-8deg);
    }

    50% {
        transform: rotate(9deg);
    }
}


/* Excavator arm */

.excavator-arm {

    transform-box: fill-box;

    transform-origin: 0% 0%;

    animation:
        armMove
        5s ease-in-out infinite;
}

@keyframes armMove {

    0%,
    100% {
        transform: rotate(15deg);
    }

    50% {
        transform: rotate(-8deg);
    }
}


/* Bucket */

.excavator-bucket {

    transform-box: fill-box;

    transform-origin: 0% 20%;

    animation:
        bucketMove
        5s ease-in-out infinite;
}

@keyframes bucketMove {

    0%,
    100% {
        transform: rotate(4deg);
    }

    50% {
        transform: rotate(-15deg);
    }
}


/* Hydraulic */

.hydraulic {

    transform-box: fill-box;

    transform-origin: 0% 50%;

    animation:
        hydraulicMove
        5s ease-in-out infinite;
}

@keyframes hydraulicMove {

    0%,
    100% {
        transform: scaleX(.92);
    }

    50% {
        transform: scaleX(1.08);
    }
}


/* Track movement */

.track-animation {

    animation:
        trackMove
        .8s linear infinite;
}

@keyframes trackMove {

    from {
        stroke-dashoffset: 0;
    }

    to {
        stroke-dashoffset: -24;
    }
}


/* Dumper */

.dumper-machine {

    animation:
        dumperDrive
        15s linear infinite;
}

@keyframes dumperDrive {

    0% {
        transform:
            translateX(520px);
    }

    35% {
        transform:
            translateX(0);
    }

    62% {
        transform:
            translateX(0);
    }

    100% {
        transform:
            translateX(-900px);
    }
}


/* Wheels */

.dumper-wheel {

    transform-box: fill-box;

    transform-origin: center;

    animation:
        wheelSpin
        .55s linear infinite;
}

@keyframes wheelSpin {

    to {
        transform:
            rotate(360deg);
    }
}


/* Dumper bed */

.dumper-bed {

    transform-box: fill-box;

    transform-origin:
        15% 100%;

    animation:
        bedMove
        15s linear infinite;
}

@keyframes bedMove {

    0%,
    70%,
    100% {
        transform:
            rotate(0deg);
    }

    74%,
    80% {
        transform:
            rotate(-2deg);
    }
}


/* Dust */

.dust-cloud {

    animation:
        dustMove
        2.8s ease-out infinite;
}

.dust-cloud.delay-one {
    animation-delay: .8s;
}

.dust-cloud.delay-two {
    animation-delay: 1.5s;
}

@keyframes dustMove {

    0% {
        opacity: 0;

        transform:
            translate(0,0)
            scale(.4);
    }

    25% {
        opacity: .35;
    }

    100% {
        opacity: 0;

        transform:
            translate(-50px,-35px)
            scale(1.7);
    }
}


/* Road */

.road-animation {

    animation:
        roadMove
        2s linear infinite;
}

@keyframes roadMove {

    from {
        stroke-dashoffset: 0;
    }

    to {
        stroke-dashoffset: -160;
    }
}


/* =========================================================
   FEATURE BAR
========================================================= */

.features {

    position: absolute;

    z-index: 50;

    left: 6%;

    bottom: 30px;

    display: flex;

    gap: 8px;
}

.feature {

    min-width: 88px;

    padding:
        9px 12px;

    border:
        1px solid
        rgba(255,255,255,.08);

    border-radius: 9px;

    background:
        rgba(255,255,255,.035);

    backdrop-filter:
        blur(10px);

    animation:
        featureFloat
        4s ease-in-out infinite;
}

.feature:nth-child(2) {
    animation-delay: .4s;
}

.feature:nth-child(3) {
    animation-delay: .8s;
}

.feature:nth-child(4) {
    animation-delay: 1.2s;
}

@keyframes featureFloat {

    0%,
    100% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-4px);
    }
}

.feature-title {

    display: block;

    color: #e2e8f0;

    font-size: 11px;

    font-weight: 600;
}

.feature-subtitle {

    display: block;

    margin-top: 2px;

    color: #63758a;

    font-size: 8px;

    text-transform: uppercase;

    letter-spacing: .6px;
}


/* =========================================================
   LOGIN SIDE
========================================================= */

.login-side {

    position: relative;

    z-index: 100;

    display: flex;

    align-items: center;

    justify-content: center;

    padding: 35px;

    background:
        linear-gradient(
            145deg,
            #0b1827,
            #07111d
        );

    border-left:
        1px solid
        rgba(255,255,255,.07);
}


/* =========================================================
   LOGIN CARD
========================================================= */

.login-card {

    width: 100%;

    max-width: 390px;

    padding: 40px;

    border:
        1px solid
        rgba(255,255,255,.09);

    border-radius: 22px;

    background:
        rgba(255,255,255,.045);

    backdrop-filter:
        blur(20px);

    box-shadow:
        0 30px 80px
        rgba(0,0,0,.35);

    animation:
        loginAppear
        .7s ease-out;
}

@keyframes loginAppear {

    from {
        opacity: 0;

        transform:
            translateX(25px);
    }

    to {
        opacity: 1;

        transform:
            translateX(0);
    }
}


/* =========================================================
   LOGIN HEADER
========================================================= */

.login-header {
    margin-bottom: 28px;
}

.login-header h2 {

    font-size: 30px;

    line-height: 1.2;

    letter-spacing: -.8px;
}

.login-header p {

    margin-top: 8px;

    color: #718096;

    font-size: 13px;

    line-height: 1.6;
}


/* =========================================================
   INPUT
========================================================= */

.input-group {

    position: relative;

    margin-bottom: 16px;
}

.input-icon {

    position: absolute;

    left: 16px;

    top: 50%;

    transform:
        translateY(-50%);

    color: #607286;

    font-size: 12px;

    z-index: 2;
}

.form-input {

    width: 100%;

    height: 54px;

    padding:
        0 45px;

    border:
        1px solid
        rgba(255,255,255,.09);

    border-radius: 11px;

    outline: none;

    background:
        rgba(2,8,23,.55);

    color: #ffffff;

    font-size: 14px;

    transition:
        .2s;
}

.form-input::placeholder {
    color: #63758a;
}

.form-input:focus {

    border-color:
        rgba(255,178,26,.75);

    box-shadow:
        0 0 0 3px
        rgba(255,178,26,.08);
}


/* =========================================================
   PASSWORD
========================================================= */

.password-toggle {

    position: absolute;

    right: 14px;

    top: 50%;

    transform:
        translateY(-50%);

    border: none;

    background: transparent;

    color: #718096;

    cursor: pointer;

    font-size: 9px;

    font-weight: 700;

    letter-spacing: .5px;

    text-transform: uppercase;
}

.password-toggle:hover {
    color: #ffb21a;
}


/* =========================================================
   LOGIN BUTTON
========================================================= */

.login-button {

    position: relative;

    width: 100%;

    height: 54px;

    margin-top: 8px;

    border: none;

    border-radius: 11px;

    background:
        linear-gradient(
            135deg,
            #ffc029,
            #f59e0b
        );

    color: #111827;

    font-size: 13px;

    font-weight: 700;

    cursor: pointer;

    overflow: hidden;

    box-shadow:
        0 14px 30px
        rgba(245,158,11,.18);

    transition:
        transform .2s,
        box-shadow .2s;
}

.login-button:hover {

    transform:
        translateY(-1px);

    box-shadow:
        0 18px 35px
        rgba(245,158,11,.25);
}

.login-button:disabled {

    opacity: .65;

    cursor:
        not-allowed;

    transform:
        none;
}

.login-button::after {

    content: "";

    position: absolute;

    top: -60%;

    left: -100px;

    width: 65px;

    height: 220%;

    background:
        rgba(255,255,255,.27);

    transform:
        rotate(20deg);

    animation:
        buttonShine
        3.5s infinite;
}

@keyframes buttonShine {

    0% {
        left: -100px;
    }

    45%,
    100% {
        left: 120%;
    }
}


/* =========================================================
   LOGIN FOOTER
========================================================= */

.login-footer {

    margin-top: 23px;

    padding-top: 20px;

    border-top:
        1px solid
        rgba(255,255,255,.06);

    color: #526176;

    font-size: 9px;

    line-height: 1.7;

    text-align: center;
}


/* =========================================================
   ERROR
========================================================= */

#result {

    margin-top: 10px;

    color: #ef4444;

    font-size: 11px;

    text-align: center;
}


/* =========================================================
   LOADING
========================================================= */

.spinner-container {

    position: fixed;

    inset: 0;

    z-index: 99999;

    display: none;

    align-items: center;

    justify-content: center;

    background:
        rgba(2,8,23,.82);

    backdrop-filter:
        blur(9px);
}

.loading-box {

    min-width: 180px;

    padding: 25px;

    border:
        1px solid
        rgba(255,255,255,.08);

    border-radius: 16px;

    background:
        rgba(15,23,42,.92);

    text-align: center;
}

.spinner {

    width: 40px;
    height: 40px;

    margin:
        0 auto 14px;

    border:
        3px solid
        rgba(255,255,255,.10);

    border-top-color:
        var(--yellow);

    border-radius: 50%;

    animation:
        spinner 0.75s linear infinite;
}

@keyframes spinner {

    to {
        transform:
            rotate(360deg);
    }
}

.loading-text {

    color: #cbd5e1;

    font-size: 11px;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 1100px) {

    .erp-page {

        grid-template-columns:
            minmax(0, 1fr)
            390px;
    }

    .hero h1 {

        font-size: 52px;
    }

    .operation-card {

        right: 4%;
    }

    .scene {

        height: 53%;
    }
}


@media (max-width: 900px) {

    .erp-page {

        grid-template-columns:
            minmax(0, 1fr)
            360px;
    }

    .hero {

        left: 5%;
    }

    .hero h1 {

        font-size: 45px;
    }

    .operation-card {

        display: none;
    }

    .features {

        transform:
            scale(.9);

        transform-origin:
            bottom left;
    }
}


@media (max-width: 720px) {

    html {
        overflow: auto;
    }

    body {
        overflow: auto;
    }

    .erp-page {

        display: block;

        min-height: 100vh;

        width: 100%;
    }

    .visual-side {

        display: none;
    }

    .login-side {

        min-height: 100vh;

        width: 100%;

        padding: 20px;

        border: none;

        background:

            radial-gradient(
                circle at 20% 20%,
                rgba(255,178,26,.10),
                transparent 35%
            ),

            #07111d;
    }

    .login-card {

        max-width: 430px;

        padding:
            34px 26px;
    }
}


@media (max-width: 420px) {

    .login-side {
        padding: 14px;
    }

    .login-card {

        padding:
            30px 20px;

        border-radius: 18px;
    }

    .login-header h2 {
        font-size: 26px;
    }
}


/* =========================================================
   ACCESSIBILITY
========================================================= */

@media (prefers-reduced-motion: reduce) {

    *,
    *::before,
    *::after {

        animation-duration:
            .01ms !important;

        animation-iteration-count:
            1 !important;
    }
}

</style>

</head>


<body>


<div class="erp-page">


<!-- =========================================================
     LEFT SIDE
========================================================== -->

<section class="visual-side">


    <div class="background-light"></div>


    <!-- =====================================================
         BRAND
    ====================================================== -->

    <div class="brand">

        <div class="brand-logo">
            T
        </div>

        <div>

            <div class="brand-name">
                Transport ERP
            </div>

            <div class="brand-subtitle">
                Fleet & Operations
            </div>

        </div>

    </div>


    <!-- =====================================================
         HERO
    ====================================================== -->

    <div class="hero">

        <div class="system-badge">

            <span class="live-dot"></span>

            Fleet Operations System

        </div>


        <h1>

            Move.

            <span class="orange">
                Manage.
            </span>

            <br>

            Deliver.

        </h1>


        <p class="hero-description">

            Manage excavators, dumpers, trips,
            diesel, drivers, expenses and
            complete transport operations
            from one powerful platform.

        </p>

    </div>


    <!-- =====================================================
         OPERATION CARD
    ====================================================== -->

    <div class="operation-card">

        <div class="operation-header">

            <span>
                Operations
            </span>

            <span class="operation-live"></span>

        </div>


        <div class="operation-row">

            <span class="operation-label">
                Fleet
            </span>

            <span class="operation-value">
                Online
            </span>

        </div>


        <div class="operation-row">

            <span class="operation-label">
                Trips
            </span>

            <span class="operation-value active">
                Active
            </span>

        </div>


        <div class="operation-row">

            <span class="operation-label">
                Fuel
            </span>

            <span class="operation-value">
                Tracking
            </span>

        </div>


        <div class="operation-row">

            <span class="operation-label">
                Reports
            </span>

            <span class="operation-value">
                Ready
            </span>

        </div>

    </div>


    <!-- =====================================================
         SVG CONSTRUCTION SCENE
    ====================================================== -->

    <svg
        class="scene"
        viewBox="0 0 1200 650"
        preserveAspectRatio="xMidYMax meet"
        xmlns="http://www.w3.org/2000/svg"
    >


        <defs>


            <!-- Excavator yellow -->

            <linearGradient
                id="excYellow"
                x1="0"
                y1="0"
                x2="1"
                y2="1"
            >

                <stop
                    offset="0%"
                    stop-color="#ffd044"
                />

                <stop
                    offset="55%"
                    stop-color="#ffae13"
                />

                <stop
                    offset="100%"
                    stop-color="#d97706"
                />

            </linearGradient>


            <!-- Dark metal -->

            <linearGradient
                id="metal"
                x1="0"
                y1="0"
                x2="1"
                y2="1"
            >

                <stop
                    offset="0%"
                    stop-color="#475569"
                />

                <stop
                    offset="100%"
                    stop-color="#1e293b"
                />

            </linearGradient>


            <!-- Glass -->

            <linearGradient
                id="glass"
                x1="0"
                y1="0"
                x2="1"
                y2="1"
            >

                <stop
                    offset="0%"
                    stop-color="#65d5f5"
                />

                <stop
                    offset="45%"
                    stop-color="#1d536c"
                />

                <stop
                    offset="100%"
                    stop-color="#08121e"
                />

            </linearGradient>


            <!-- Dumper -->

            <linearGradient
                id="truckYellow"
                x1="0"
                y1="0"
                x2="1"
                y2="1"
            >

                <stop
                    offset="0%"
                    stop-color="#ffd34f"
                />

                <stop
                    offset="100%"
                    stop-color="#d97706"
                />

            </linearGradient>


            <!-- Ground -->

            <linearGradient
                id="ground"
                x1="0"
                y1="0"
                x2="0"
                y2="1"
            >

                <stop
                    offset="0%"
                    stop-color="#18242d"
                />

                <stop
                    offset="100%"
                    stop-color="#0a1118"
                />

            </linearGradient>


            <!-- Glow -->

            <filter
                id="machineGlow"
                x="-50%"
                y="-50%"
                width="200%"
                height="200%"
            >

                <feGaussianBlur
                    stdDeviation="12"
                />

            </filter>


            <!-- Shadow -->

            <filter
                id="shadow"
                x="-50%"
                y="-50%"
                width="200%"
                height="200%"
            >

                <feDropShadow
                    dx="0"
                    dy="12"
                    stdDeviation="12"
                    flood-color="#000000"
                    flood-opacity=".45"
                />

            </filter>


        </defs>


        <!-- =================================================
             SKY
        ================================================== -->


        <circle
            cx="1010"
            cy="115"
            r="55"
            fill="#ffb21a"
            opacity=".12"
        />

        <circle
            cx="1010"
            cy="115"
            r="34"
            fill="#ffc63a"
            opacity=".08"
        />


        <!-- =================================================
             DISTANT HILLS
        ================================================== -->

        <path
            d="
                M0 410
                L130 330
                L230 395
                L350 305
                L470 390
                L590 320
                L720 400
                L850 310
                L970 380
                L1100 300
                L1200 370
                L1200 650
                L0 650
                Z
            "
            fill="#0c1720"
        />


        <!-- =================================================
             GROUND
        ================================================== -->

        <path
            d="
                M0 430
                Q350 390 650 430
                Q950 470 1200 415
                L1200 650
                L0 650
                Z
            "
            fill="url(#ground)"
        />


        <!-- =================================================
             GROUND GRID
        ================================================== -->

        <g
            opacity=".17"
            stroke="#f59e0b"
            stroke-width="1"
        >

            <path d="M0 500 L1200 500"/>
            <path d="M0 545 L1200 545"/>
            <path d="M0 590 L1200 590"/>
            <path d="M0 635 L1200 635"/>

            <path d="M80 450 L250 650"/>
            <path d="M220 440 L360 650"/>
            <path d="M380 430 L470 650"/>
            <path d="M540 425 L580 650"/>
            <path d="M700 425 L680 650"/>
            <path d="M860 425 L800 650"/>
            <path d="M1020 425 L920 650"/>
            <path d="M1160 425 L1040 650"/>

        </g>


        <!-- =================================================
             ROAD
        ================================================== -->

        <path
            d="M0 522 L1200 522"
            stroke="#f59e0b"
            stroke-width="2"
            opacity=".65"
        />


        <path
            class="road-animation"
            d="M0 555 L1200 555"
            stroke="#64748b"
            stroke-width="2"
            stroke-dasharray="70 90"
            opacity=".35"
        />


        <!-- =================================================
             EXCAVATOR SHADOW
        ================================================== -->

        <ellipse
            cx="310"
            cy="535"
            rx="190"
            ry="22"
            fill="#000000"
            opacity=".38"
        />


        <!-- =================================================
             EXCAVATOR
        ================================================== -->

        <g
            class="excavator-machine"
            filter="url(#shadow)"
        >


            <!-- TRACK -->

            <g>

                <rect
                    x="105"
                    y="495"
                    width="310"
                    height="58"
                    rx="29"
                    fill="#0a0f15"
                    stroke="#475569"
                    stroke-width="7"
                />

                <rect
                    x="120"
                    y="510"
                    width="280"
                    height="27"
                    rx="13"
                    fill="none"
                    stroke="#64748b"
                    stroke-width="2"
                    stroke-dasharray="12 12"
                    class="track-animation"
                />

                <circle
                    cx="155"
                    cy="524"
                    r="10"
                    fill="#1e293b"
                />

                <circle
                    cx="365"
                    cy="524"
                    r="10"
                    fill="#1e293b"
                />

            </g>


            <!-- BASE -->

            <rect
                x="170"
                y="435"
                width="210"
                height="75"
                rx="18"
                fill="url(#excYellow)"
            />


            <!-- COUNTER WEIGHT -->

            <path
                d="
                    M340 450
                    Q395 450 400 485
                    Q395 515 355 510
                    L340 510
                    Z
                "
                fill="#c66a05"
            />


            <!-- CABIN -->

            <g>

                <path
                    d="
                        M190 435
                        L190 350
                        Q190 328 212 328
                        L280 328
                        Q305 328 305 352
                        L305 435
                        Z
                    "
                    fill="#1b2b3a"
                    stroke="#ffb21a"
                    stroke-width="6"
                />


                <!-- Glass -->

                <path
                    d="
                        M202 365
                        L202 345
                        Q202 338 214 338
                        L274 338
                        Q292 338 292 353
                        L292 365
                        Z
                    "
                    fill="url(#glass)"
                />


                <path
                    d="
                        M202 373
                        L292 373
                        L292 420
                        L202 420
                        Z
                    "
                    fill="url(#glass)"
                    opacity=".72"
                />


                <!-- Window reflection -->

                <path
                    d="
                        M215 344
                        L250 344
                        L210 385
                        L210 365
                        Z
                    "
                    fill="#ffffff"
                    opacity=".12"
                />

            </g>


            <!-- =================================================
                 BOOM
            ================================================== -->

            <g
                class="excavator-boom"
            >

                <path
                    d="
                        M280 350
                        L340 250
                        L365 258
                        L315 365
                        Z
                    "
                    fill="url(#excYellow)"
                    stroke="#c77708"
                    stroke-width="2"
                />


                <!-- Hydraulic -->

                <rect
                    class="hydraulic"
                    x="300"
                    y="286"
                    width="65"
                    height="7"
                    rx="4"
                    fill="#e2e8f0"
                />

            </g>


            <!-- =================================================
                 ARM
            ================================================== -->

            <g
                class="excavator-arm"
            >

                <path
                    d="
                        M360 255
                        L505 280
                        L498 302
                        L350 278
                        Z
                    "
                    fill="url(#excYellow)"
                    stroke="#c77708"
                    stroke-width="2"
                />


                <!-- Hydraulic -->

                <rect
                    x="390"
                    y="271"
                    width="90"
                    height="6"
                    rx="3"
                    fill="#e2e8f0"
                    opacity=".7"
                />


                <!-- BUCKET -->

                <g
                    class="excavator-bucket"
                >

                    <path
                        d="
                            M485 298
                            L535 305
                            L555 345
                            L520 370
                            L480 340
                            Z
                        "
                        fill="#a85d04"
                        stroke="#7c4302"
                        stroke-width="3"
                    />


                    <path
                        d="
                            M488 338
                            L525 365
                            L518 379
                            L480 350
                            Z
                        "
                        fill="#6b3b04"
                    />

                </g>

            </g>


            <!-- LIGHT -->

            <circle
                cx="197"
                cy="404"
                r="6"
                fill="#fff7c2"
            />

            <circle
                cx="197"
                cy="404"
                r="18"
                fill="#ffb21a"
                opacity=".15"
                filter="url(#machineGlow)"
            />

        </g>


        <!-- =================================================
             DUMPER
        ================================================== -->

        <g
            class="dumper-machine"
        >


            <!-- SHADOW -->

            <ellipse
                cx="880"
                cy="542"
                rx="190"
                ry="18"
                fill="#000000"
                opacity=".35"
            />


            <!-- BODY -->

            <path
                d="
                    M720 445
                    L835 445
                    L870 490
                    L1120 490
                    L1150 530
                    L710 530
                    Z
                "
                fill="url(#truckYellow)"
                stroke="#a85d04"
                stroke-width="3"
            />


            <!-- CABIN -->

            <path
                d="
                    M715 445
                    L715 375
                    Q715 355 735 355
                    L805 355
                    L835 445
                    Z
                "
                fill="url(#truckYellow)"
                stroke="#a85d04"
                stroke-width="3"
            />


            <!-- CABIN WINDOW -->

            <path
                d="
                    M730 370
                    L787 370
                    L805 425
                    L730 425
                    Z
                "
                fill="url(#glass)"
            />


            <!-- DUMPER BED -->

            <g
                class="dumper-bed"
            >

                <path
                    d="
                        M815 390
                        L1125 365
                        L1160 480
                        L850 480
                        Z
                    "
                    fill="url(#metal)"
                    stroke="#1e293b"
                    stroke-width="4"
                />


                <path
                    d="
                        M835 405
                        L1110 382
                    "
                    stroke="#94a3b8"
                    stroke-width="3"
                    opacity=".3"
                />

            </g>


            <!-- FRONT LIGHT -->

            <circle
                cx="716"
                cy="462"
                r="7"
                fill="#fff7c2"
            />


            <!-- WHEELS -->

            <g
                class="dumper-wheel"
            >

                <circle
                    cx="770"
                    cy="520"
                    r="31"
                    fill="#080d13"
                    stroke="#475569"
                    stroke-width="8"
                />

                <circle
                    cx="770"
                    cy="520"
                    r="8"
                    fill="#64748b"
                />

            </g>


            <g
                class="dumper-wheel"
            >

                <circle
                    cx="1080"
                    cy="520"
                    r="31"
                    fill="#080d13"
                    stroke="#475569"
                    stroke-width="8"
                />

                <circle
                    cx="1080"
                    cy="520"
                    r="8"
                    fill="#64748b"
                />

            </g>


        </g>


        <!-- =================================================
             DUST
        ================================================== -->

        <g
            class="dust-cloud"
            opacity=".35"
        >

            <circle
                cx="1110"
                cy="515"
                r="14"
                fill="#cbd5e1"
            />

            <circle
                cx="1130"
                cy="520"
                r="9"
                fill="#cbd5e1"
            />

        </g>


        <g
            class="dust-cloud delay-one"
            opacity=".25"
        >

            <circle
                cx="1080"
                cy="520"
                r="11"
                fill="#cbd5e1"
            />

        </g>


        <g
            class="dust-cloud delay-two"
            opacity=".25"
        >

            <circle
                cx="1050"
                cy="522"
                r="8"
                fill="#cbd5e1"
            />

        </g>


    </svg>


    <!-- =====================================================
         FEATURE BAR
    ====================================================== -->

    <div class="features">


        <div class="feature">

            <span class="feature-title">
                Fleet
            </span>

            <span class="feature-subtitle">
                Management
            </span>

        </div>


        <div class="feature">

            <span class="feature-title">
                Trips
            </span>

            <span class="feature-subtitle">
                Tracking
            </span>

        </div>


        <div class="feature">

            <span class="feature-title">
                Diesel
            </span>

            <span class="feature-subtitle">
                Monitoring
            </span>

        </div>


        <div class="feature">

            <span class="feature-title">
                Reports
            </span>

            <span class="feature-subtitle">
                Analytics
            </span>

        </div>


    </div>


</section>



<!-- =========================================================
     LOGIN SIDE
========================================================== -->

<section class="login-side">


    <div class="login-card">


        <div class="login-header">

            <h2>
                Welcome back
            </h2>

            <p>
                Sign in to access your
                transport operations dashboard.
            </p>

        </div>


        <form
            id="loginForm"
            action=""
            method="post"
            onsubmit="loginMeth(event)"
        >


            <!-- USERNAME -->

            <div class="input-group">

                <span class="input-icon">
                    ●
                </span>

                <input
                    class="form-input"
                    type="text"
                    name="email"
                    placeholder="Username"
                    autocomplete="username"
                    required
                >

            </div>


            <!-- PASSWORD -->

            <div class="input-group">

                <span class="input-icon">
                    ●
                </span>

                <input
                    class="form-input"
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Password"
                    autocomplete="current-password"
                    required
                >

                <button
                    type="button"
                    class="password-toggle"
                    id="passwordToggle"
                    onclick="togglePassword()"
                >
                    Show
                </button>

            </div>


            <!-- LOGIN -->

            <button
                type="submit"
                class="login-button"
                id="loginButton"
            >
                Sign In
            </button>


        </form>


        <div id="result"></div>


        <div class="login-footer">

            Transport ERP System

            <br>

            Fleet Management
            •
            Excavator
            •
            Dumper
            •
            Trips
            •
            Diesel
            •
            Reports

        </div>


    </div>

</section>

</div>



<!-- =========================================================
     LOADING
========================================================== -->

<div
    class="spinner-container"
    id="spinnerContainer"
>

    <div class="loading-box">

        <div class="spinner"></div>

        <div class="loading-text">
            Authenticating...
        </div>

    </div>

</div>



<script>

/* =========================================================
   PASSWORD
========================================================= */

function togglePassword() {

    const password =
        document.getElementById("password");

    const toggle =
        document.getElementById(
            "passwordToggle"
        );


    if (
        password.type ===
        "password"
    ) {

        password.type = "text";

        toggle.innerText = "Hide";

    }
    else {

        password.type = "password";

        toggle.innerText = "Show";

    }

}


/* =========================================================
   PREVENT BACK
========================================================= */

window.onload = function () {

    history.pushState(
        null,
        null,
        window.location.href
    );

    window.onpopstate =
        function () {

            history.pushState(
                null,
                null,
                window.location.href
            );

        };

};


/* =========================================================
   LOGIN
========================================================= */

function loginMeth(event) {

    event.preventDefault();


    const emailElement =
        document.getElementsByName(
            "email"
        )[0];


    const passwordElement =
        document.getElementsByName(
            "password"
        )[0];


    const email =
        emailElement.value.trim();


    const pass =
        passwordElement.value;


    /* -----------------------------------------
       VALIDATION
    ----------------------------------------- */

    if (!email) {

        emailElement.focus();

        return;
    }


    if (!pass) {

        passwordElement.focus();

        return;
    }


    /* -----------------------------------------
       SHOW LOADER
    ----------------------------------------- */

    $("#spinnerContainer").css(
        "display",
        "flex"
    );


    $("#loginButton")
        .prop("disabled", true)
        .text("Signing in...");


    $("#result").html("");


    /* -----------------------------------------
       API
    ----------------------------------------- */

    $.ajax({

        url:
            prod_url +
            "/login/user?email=" +
            encodeURIComponent(email) +
            "&pass=" +
            encodeURIComponent(pass),

        type: "GET",

        dataType: "json",

        timeout: 30000,


        success:
            function(response) {


                $("#spinnerContainer")
                    .hide();


                $("#loginButton")
                    .prop(
                        "disabled",
                        false
                    )
                    .text(
                        "Sign In"
                    );


                if (
                    response &&
                    response.message ===
                    "success"
                ) {


                    $("#loginButton")
                        .text(
                            "Welcome..."
                        );


                    setTimeout(
                        function () {

                            window.location.href =
                                "dashboard.jsp";

                        },
                        250
                    );

                }
                else {

                    alert(
                        response &&
                        response.message
                            ? response.message
                            : "Invalid username or password."
                    );

                }

            },


        error:
            function(
                xhr,
                status,
                error
            ) {


                $("#spinnerContainer")
                    .hide();


                $("#loginButton")
                    .prop(
                        "disabled",
                        false
                    )
                    .text(
                        "Sign In"
                    );


                if (
                    status ===
                    "timeout"
                ) {

                    alert(
                        "The server took too long to respond. Please try again."
                    );

                }
                else {

                    alert(
                        "Something went wrong. Please contact the Administrator."
                    );

                }


                $("#result").html(
                    "Error: " +
                    (
                        error ||
                        "Unable to connect to server."
                    )
                );

            }

    });

}

</script>


</body>

</html>