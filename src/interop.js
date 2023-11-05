// This returns the flags passed into your Elm application
export const flags = ({ env }) => {
  return {
    width: window.innerWidth,
    height: window.innerHeight,
  }
}

console.log("@@Flags: ", flags)

// This function is called once your Elm app is running
export const onReady = ({ app, env }) => {
  console.log('Elm is ready', app)
}