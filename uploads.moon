lapis = require "lapis"

import respond_to from require "lapis.application"

class extends lapis.Application
  @path: "/upload"
  @name: "upload_"

  [endpoint: ""]: respond_to {
    POST: =>
      -- @params.qquuid -> UUID for this file

      -- chunked request:
      -- qqchunksize -> size in bytes of this chunk
      -- qqpartbyteoffset -> starting byte of this chunk
      -- qqpartindex -> which chunk of the file this is
      -- qqtotalparts -> how many chunks there are

      -- qqresume: true if attempting an upload resume
      -- dwdw

    DELETE: =>
      -- TODO
  }

  [finished: "/finished"]: respond_to {
    POST: =>
      -- should receive when a file is done uploading and needs to be assembled!

      -- will receive:
      -- qquuid
      -- qqfilename
      -- qqtotalfilesize
      -- qqtotalparts

      -- send empty 204 status No Content on success
      -- else send json response w error: 'string'
  }

  -- defined above as part of upload endpoint
  -- [delete: "/delete"]: respond_to {
  --   POST: =>
  --     -- TODO
  -- }

  -- always return json
  -- success: true / false always required
  -- error: 'error message to display'
  -- preventRetry: true if it shouldn't try again
  -- reset: true if upload needs to start over
  -- newUuid: "value" if the UUID needs to be changed
  -- thumbnailUrl: "/path/to/img.whatever" if you want to specify a thumbnail image to use for this file
