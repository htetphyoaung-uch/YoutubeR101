# Basic structure of function 
name <- function(arguments){
  code
  code
  # comment explaining code
  code
}

ctf <- function(x){
  x*(9/5)+32
}

ctf <- function(x){
  y=x*(9/5)+32
  return(paste(y,"degree Fahrenheit"))
}

ctf <- function(x){
  y=x*(9/5)+32
  return(paste("The entered Celsius temperature is", y,"degree Fahrenheit"))
}

ctf <- function(x){
  y=x*(9/5)+32
  return(paste(x," degrees Celsius is", y,"degrees Fahrenheit"))
}

ss_nd <- function(x){
  y1=length(x)
  y2=mean(x)
  y3=sd(x)
  y=c(N=y1,Mean=y2,SD=y3)
  return(y)
}

ss_nnd <- function(x){
  y1=length(x)
  y2=median(x)
  y3=IQR(x)
  y=c(N=y1,Median=y2,IQR=y3)
  return(y)
}

mytab_rp <-function(r,c){
  t=addmargins(table(r,c),2)
  p=addmargins(prop.table(table(r,c),1)*100,2)
  chi=chisq.test(table(r,c))
  fisher=fisher.test(table(r,c))
  return(list(Freq.Table=t,Percent.Table=p,Chi.sqaured.test=chi,Fisher.exact.test=fisher))
}

# Basic structure of function 
