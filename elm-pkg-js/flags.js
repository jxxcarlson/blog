exports.init =  async function(app) {

     const flags = ({ env }) => {
      return {
        width: window.innerWidth,
        height: window.innerHeight,
      }
    }

    console.log("@@Flags: ", flags)

    }
