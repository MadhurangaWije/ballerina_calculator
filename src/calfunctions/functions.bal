#Calculates the factorial of the given number
# 
# +n - The input number
# + return - The factorial of the given number
public function fact(int n)returns int{
    if n<=1 {
        return 1;
    }else{
        return n * fact(n-1);
    }
}

# Sorts the input integer array
# + input - the input integer array to be sorted
public function sort(int[] input){
    int i=0;
    boolean swaped;
    while i<input.length()-1{
        int j=0;
        swaped=false;
        while j<input.length()-i-1{

            if input[j]>input[j+1]{
                int temp=input[j];
                input[j]=input[j+1];
                input[j+1]=temp;
                swaped=true;
            }
            j+=1;
        }
        if (!swaped) {
            break;
        }
        i+=1;
    }
}
