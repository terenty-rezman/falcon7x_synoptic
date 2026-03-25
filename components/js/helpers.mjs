export function Interp1d(x_array, y_array) {
  this.x_array = x_array;
  this.y_array = y_array;

  this.interp = function (x_input) {
    let i2 = -1;

    for (let i = 0; i < x_array.length; i++) {
      if (x_input <= x_array[i]) {
        i2 = i;
        break;
      }
    }
    if (i2 == 0) {
      // left edge
      return y_array[0];
    }

    if (i2 == -1) {
      // right edge
      return y_array[y_array.length - 1];
    }

    let i1 = i2 - 1;
    let x1 = x_array[i1];
    let x2 = x_array[i2];
    let y1 = y_array[i1];
    let y2 = y_array[i2];

    return y1 + ((y2 - y1) * (x_input - x1)) / (x2 - x1);
  };
}

export function bisectLeft(arr, value, lo = 0, hi = arr.length) {
  while (lo < hi) {
    const mid = (lo + hi) >> 1;
    if (arr[mid] < value) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }

  lo = lo - 1;
  //   if (lo == arr.length) {
  //     lo = lo - 1
  //   }

  if (lo < 0) {
    lo = 0;
  }

  return lo;
}

export function isClose(a, b, epsilon = Number.EPSILON) {
  return Math.abs(a - b) < epsilon;
}

export function Request(options) {
  let http = {
    xhr: new XMLHttpRequest(),
    URLbase: "",
    method: "GET",
    userAgent: null,
    success: null,
    fail: null,
    callback: function () {
      if (http.xhr.readyState !== 4) {
        return;
      }
      if (http.xhr.status === 200 && http.success) {
        http.success(JSON.parse(http.xhr.responseText));
      } else if (http.fail) {
        http.fail(http.xhr.status, http.xhr.responseText);
      }
    },
    setHeaders: function (headers) {
      for (let hkey in headers) {
        if (headers.hasOwnProperty(hkey)) {
          this.xhr.setRequestHeader(hkey, headers[hkey]);
        }
      }
    },
    request: function (uri, async, user, password) {
      this.xhr.open(uri.method, uri.url, async, user, password);
      this.xhr.onreadystatechange = this.callback;
      if (uri.headers) {
        this.setHeaders(uri.headers);
      }

      let methods = ["GET", "COPY", "HEAD", "OPTIONS", "PURGE"];
      if (methods.indexOf(uri.method) > -1) {
        this.xhr.send(null);
      } else {
        this.xhr.send(uri.data);
      }
    },
    then: function (callback) {
      if (this.xhr.readyState === 4) {
        callback(JSON.parse(this.xhr.responseText));
      } else {
        this.success = callback;
      }
      return this;
    },
    catch: function (callback) {
      if (this.xhr.readyState === 4) {
        callback(this.xhr.status, this.xhr.responseText);
      } else {
        this.fail = callback;
      }
      return this;
    },
    get: function (url) {
      this.request(
        {
          method: "GET",
          url: this.URLbase + url,
        },
        true,
      );
      return this;
    },
    post: function (url, data) {
      this.request(
        {
          method: "POST",
          headers: {
            "Content-type": "application/json",
          },
          url: this.URLbase + url,
          data: JSON.stringify(data),
        },
        true,
      );
      return this;
    },
    put: function (url, data) {
      this.request(
        {
          method: "PUT",
          headers: {
            "Content-type": "application/json",
          },
          url: this.URLbase + url,
          data: JSON.stringify(data),
        },
        true,
      );
      return this;
    },
    del: function (url, data) {
      if (typeof data !== "object") {
        data = {
          id: data,
        };
      }
      this.request(
        {
          method: "DELETE",
          headers: {
            "Content-type": "application/json",
          },
          url: this.URLbase + url,
          data: JSON.stringify(data),
        },
        true,
      );
      return this;
    },
  };
  for (let op in options) {
    http[op] = options[op];
  }
  return http;
}
