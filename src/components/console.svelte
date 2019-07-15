<script>
  import { onMount } from "svelte";

  let welcomeMsg = "";
  let githubMsg = "GITHUB";
  let notRecognizedMsg = "";

  function showText(target, message, state, index, interval, callback) {
    if (index < message.length) {
      state += message[index++];
      document.getElementById(target).innerHTML = state;
      setTimeout(function() {
        showText(target, message, state, index, interval, callback);
      }, interval);
    } else {
      if (callback !== null) {
        console.log(callback);
        callback();
      }
    }
  }

  function inputEnableAndFocus() {
    document.getElementById("command-input").disabled = false;
    document.getElementById("command-input").focus();
  }

  function handleCommand() {
    if (event.which == 13) {
      event.preventDefault();
      var val = event.currentTarget.value;
      if (val === "Github" || val === "github") {
        event.currentTarget.value = "";
        document.getElementById("command-output").innerHTML = githubMsg;
      } else {
        document.getElementById("command-input").disabled = true;
        let msg = "zsh: command not found: " + val;
        event.currentTarget.value = "";
        showText(
          "command-output",
          msg,
          notRecognizedMsg,
          0,
          80,
          inputEnableAndFocus
        );
      }
    }
  }

  onMount(() => {
    document.getElementById("command-input").autofocus = true;
    let welcomeText =
      "Hello! I'm Yudi, a senior majoring in Computer Science and Economics at UC Berkeley.";

    showText("welcome-message", welcomeText, welcomeMsg, 0, 70, null);
  });
</script>

<style>
  #yellow {
    color: yellow;
  }

  .light {
    opacity: 0.6;
  }

  #cmds1 {
    color: #ff00ff;
  }

  #cmds2 {
    color: #6ff66a;
  }

  #cmds3 {
    color: #76d7ea;
  }

  #cmds4 {
    color: #ff6037;
  }

  input {
    background: black;
    border-color: black;
    color: #00bfff;
    font-weight: 500;
    border-width: 0;
    border: none;
    box-shadow: none;
    letter-spacing: 0.5px;
  }

  input:focus {
    outline: none;
  }

  input[type="text"] {
    font-size: 15px;
  }
</style>

<div>
  <p>
    $
    <span id="yellow">./yuditan.me</span>
  </p>
  <p class="light" id="welcome-message" />
  <p class="light">To reach out to me, type the following commands:</p>
  <ul>
    <li>
      <span id="cmds1">
        <p>Github</p>
      </span>
    </li>
    <li>
      <span id="cmds2">
        <p>Linkedin</p>
      </span>
    </li>
    <li>
      <span id="cmds3">
        <p>Resume</p>
      </span>
    </li>
    <li>
      <span id="cmds4">
        <p>Email</p>
      </span>
    </li>
    <br />
  </ul>
  <p id="command-output" />
  <p>
    $
    <input
      type="text"
      name="arg"
      maxlength="8"
      id="command-input"
      on:keypress={handleCommand} />
  </p>
  <p id="error" />
</div>
