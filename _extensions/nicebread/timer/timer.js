// Credit: Mateusz Rybczonec

// dash array value is the circumference of the circle radius (here 45)
const FULL_DASH_ARRAY = 2 * Math.PI * 45;
// the second limits for color change
const THRESHOLDS = [10, 5];

// Funktion zur Initialisierung des Timers in einem Container
function initializeTimer(containerId, timeLimit, startOn, size = "100%", soundStr = "false") {

  let active = true;
  let timePassed = 0;
  let timeLeft = timeLimit;
  let timerId = null;
  const playSound = (soundStr === "true");

  let audioObj = null;
  if (playSound) {
    let soundUrl = window.quartoTimerSound;
    if (!soundUrl) {
      soundUrl = "bing.wav";
      const scripts = document.getElementsByTagName("script");
      for (let i = 0; i < scripts.length; i++) {
        if (scripts[i].src && scripts[i].src.includes("timer.js")) {
          soundUrl = scripts[i].src.replace("timer.js", "bing.wav");
          break;
        }
      }
    }
    audioObj = new Audio(soundUrl);
  }

  // Berechne die Größe basierend auf dem size-Parameter.
  // Standardgröße des Timers ist 300px (entspricht 100%).
  let timerSize = "300px";
  if (size.endsWith("%")) {
    const percent = parseFloat(size);
    if (!isNaN(percent)) {
      timerSize = `${(percent / 100) * 300}px`;
    }
  } else {
    timerSize = size; // Fallback, falls jemand einen festen Wert wie "150px" angibt
  }

  // Dynamisches Erstellen des Timer-HTML-Inhalts für jeden Container
  document.getElementById(containerId).innerHTML = `
    <div class="base-timer" style="width: ${timerSize}; height: ${timerSize};">
      <svg id="${containerId}-timer-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
          <circle id="${containerId}-circle" class="base-timer__path-elapsed" cx="50" cy="50" r="45"></circle>
          <path
            id="${containerId}-path-remaining"
            stroke-dasharray="${FULL_DASH_ARRAY}"
            class="base-timer__path-remaining"
            d="M 50 50 m 0 -45 a 45 45 0 0 1 0 90 a 45 45 0 0 1 0 -90">
          </path>
          <text id="${containerId}-label" x="50%" y ="50%" dominant-baseline="middle" text-anchor="middle">
            ${formatTime(timeLeft)}
          </text>
          <g id="${containerId}-reset" class="timer-reset" transform="translate(44, 72) scale(0.5)">
            <circle class="timer-reset-bg" cx="12" cy="12" r="16"></circle>
            <path class="timer-reset-icon" d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path>
            <path class="timer-reset-icon" d="M3 3v5h5"></path>
          </g>
      </svg>
    </div>
    `;

  document.getElementById(`${containerId}-timer-svg`).addEventListener("click", (event) => {
    toggleTimer();
  });

  document.getElementById(`${containerId}-reset`).addEventListener("click", (event) => {
    event.stopPropagation();
    resetTimer();
  });

  // Set the timer to inactive and then change to type slide
  if (startOn === "interaction") {
    toggleTimer();
    startOn = "slide";
  }

  // Startet den Timer für einen bestimmten Container
  function startTimer() {
    // only advance time when focus is required and slide is in focus
    if (active && (startOn === 'presentation' || (startOn === 'slide' && !isHidden()))) {

      timePassed += 1;
      timeLeft = timeLimit - timePassed;

      document.getElementById(`${containerId}-label`).innerHTML = formatTime(
        timeLeft
      );

      setCircleDasharray();
      setRemainingPathColor(timeLeft);

      // Sound abspielen, wenn der Timer genau jetzt abgelaufen ist
      if (timeLeft === 0 && playSound && audioObj) {
        audioObj.currentTime = 0;
        audioObj.play().catch(e => console.warn("Sound konnte nicht abgespielt werden:", e));
      }

    }
    if (timeLeft > 0) {
      timerId = setTimeout(startTimer, 1000);
    } else {
      timerId = null;
    }
  }

  // Initialer Start des Timers
  startTimer();

  function isHidden() {
    let timecont = document.getElementById(containerId);
    let ancestor = timecont.parentNode;

    while (ancestor.tagName !== "SECTION") {
      ancestor = ancestor.parentNode;
    }
    return ancestor.hidden;
  }

  function toggleTimer() {
    if (!active && audioObj) {
      // Audio-Element entsperren (für iOS/Chrome Autoplay Policies bei langen Timern)
      audioObj.muted = true;
      let playPromise = audioObj.play();
      if (playPromise !== undefined) {
        playPromise.then(() => {
          audioObj.pause();
          audioObj.currentTime = 0;
          audioObj.muted = false;
        }).catch(e => {
          audioObj.muted = false;
        });
      }
    }

    if (active) {
      document.getElementById(`${containerId}-circle`).style.fill = '#fcb';
    } else {
      document.getElementById(`${containerId}-circle`).style.fill = '';
    }
    active = !active;
  }

  function resetTimer() {
    timePassed = 0;
    timeLeft = timeLimit;
    active = false; // Pausiere den Timer beim Zurücksetzen

    document.getElementById(`${containerId}-label`).innerHTML = formatTime(timeLeft);
    setCircleDasharray();

    // Setze die Farben zurück
    const pathId = `${containerId}-path-remaining`;
    for (let i = 0; i < THRESHOLDS.length; i += 1) {
      document.getElementById(pathId).classList.remove(`lvl${i - 1}`);
      document.getElementById(pathId).classList.remove(`lvl${i}`);
    }

    // Füllung zurücksetzen (wie im pausierten Zustand)
    document.getElementById(`${containerId}-circle`).style.fill = '#fcb';

    // Wenn der Timer schon abgelaufen war, müssen wir den Loop neu starten
    if (timerId === null) {
      startTimer();
    }
  }

  // Funktion zur Formatierung der verbleibenden Zeit
  function formatTime(time) {
    const minutes = Math.floor(time / 60);
    let seconds = time % 60;

    if (seconds < 10) {
      seconds = `0${seconds}`;
    }

    return `${minutes}:${seconds}`;
  }

  // Funktion zur Festlegung der Farbe des verbleibenden
  // Pfades basierend auf der verbleibenden Zeit
  function setRemainingPathColor(timeLeft) {
    const pathId = `${containerId}-path-remaining`;

    for (let i = 0; i < THRESHOLDS.length; i += 1) {
      if (timeLeft < THRESHOLDS[i]) {
        document.getElementById(pathId).classList.remove(`lvl${i - 1}`);
        document.getElementById(pathId).classList.add(`lvl${i}`);
      }
    }
  }

  // Funktion zur Festlegung der Strichlänge des verbleibenden
  // Pfades basierend auf dem Anteil der verstrichenen Zeit
  function setCircleDasharray() {
    let circle_proportions = timeLeft / timeLimit * FULL_DASH_ARRAY + " ";
    circle_proportions += (1 - timeLeft / timeLimit) * FULL_DASH_ARRAY;

    document
      .getElementById(`${containerId}-path-remaining`)
      .setAttribute("stroke-dasharray", circle_proportions);
  }
}
