export function Interp1d(x_array, y_array) {
    this.x_array = x_array;
    this.y_array = y_array;

    this.interp = function(x_input) {
        let i2 = -1;

        for (let i = 0; i < x_array.length; i++) {
            if (x_input <= x_array[i]) {
                i2 = i;
                break
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

        return y1 + (y2 - y1) * (x_input - x1) / (x2 - x1)
    }
}

export function bisectLeft(arr, value, lo=0, hi=arr.length) {
  while (lo < hi) {
    const mid = (lo + hi) >> 1;
    if (arr[mid] < value) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }

  lo = lo - 1
//   if (lo == arr.length) {
//     lo = lo - 1
//   }

  if (lo < 0) {
    lo = 0
  }

  return lo;
}
