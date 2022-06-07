// given ring (r, (*_r, +_r)) we can define matrix multiplication for vectors formed over cede ring.
// more percisly, these vectors are n-dimensional arrays whose entries are elements of r

// step 1: lift scalar x scalar multiplication into scalar x vector multiplication
function mul_scal_vec(scalar_mul){ // scalar_mul = *_r : r x r -> r
    return (
        (scalar, vector) => {
            const resultantVector = []
            for (i = 0; i < vector.length; i++)
                resultantVector.push(scalar_mul(vector[i], scalar)) // v'[i] = a *_r v[i]
            return resultantVector // v' = a * v
        }
    )
}

// step 2: lift scalar + scalar addition into vector x vector addition
function add_vec_vec(scalar_add){ // scalar_add = +_r : r x r ->
    return (
        (vector1, vector2) => {
            const resultantVector = []
            for (i = 0; i < vector1.length; i++) 
                resultantVector.push(scalar_add(vector1[i], vector2[i])) // V'[i] = V1[i] +_r V2[i]
            return resultantVector // v' = v1 + v2
        }
    )
}

// step 3: scalar x vector multiplicatino and vector + vector addition into matrix vector multiplication
function mul_matrix_vec(scal_vec_mul, vec_vec_add){
    return (
        (matrix, vector) => {
            let resultantVector = new Array(vector.length).fill(0)
            for (j = 0; j < vector.length; j++)
                resultantVector = vec_vec_add(resultantVector, scal_vec_mul (vector[j], matrix[j])) // V' +=_r V[j]*_rM[j] 
            
            return resultantVector // v' = M v
        }
    )
}

// matrix vector multiplication over mod 2 equipped with standard (*, +)
const mul_2 = (a, b) => (a * b) % 2
const add_2 = (a, b) => (a + b) % 2
const bin_matrix_vec_mul = mul_matrix_vec( mul_scal_vec(mul_2), add_vec_vec(add_2) )

let I = [ [1, 1], [0, 1] ]
// 1 0
// 1 1
  
const fs = require('fs');

function two_by_two_bin_verifier(){ // verifies output of 2 x 2 binary matrix vec multiplication

    fs.readFile('./test.txt', 'utf8', (err, data) => {
        if (err) {
            console.error(err);
            return;
        }
        trials = data.split('\n');
        trials.forEach(trial => {
            const nums = trial.split(' ')
            const M = [[nums[0], nums[3], nums[6]], [nums[1], nums[4], nums[7]], [nums[2], nums[5], nums[8]]]
            const v = [nums[9], nums[10], nums[11]]

            const vout = bin_matrix_vec_mul(M, v);

            if (vout[0] != parseInt(nums[12]) | vout[1] != parseInt(nums[13]) | vout[2] != parseInt(nums[14])){
                console.log('failed')
                console.log(vout);
                console.log(M)
                console.log(v)
                console.log()
            }
        })
    });   
}

//console.log(bin_matrix_vec_mul(I, [1, 0]))

two_by_two_bin_verifier();