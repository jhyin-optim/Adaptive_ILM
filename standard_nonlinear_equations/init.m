% init 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [nprob,n,m,x0]=initf(nprob)
% This function sets n,m, and the standard starting    
% point based on the nprob and returns it to initpt     
% function.                                                                                                    
% Created on 10/30/94 by Madhu Lamba                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [nprob,x0,m,n] = init(NO)

%global FIRSTIME

switch NO
    %% nprob='problem1'; cuter
      case 1
        nprob='problem1';
        m = 1000;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem1'; cuter
      case 2
        nprob='problem1';
        m = 1000;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem1'; cuter
      case 3
        nprob='problem1';
        m = 1000;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem1'; cuter
      case 4
        nprob='problem1';
        m = 1000;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem1'; cuter
      case 5
        nprob='problem1';
        m = 1000;
        n = 2*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem1'; cuter
      case 6
        nprob='problem1';
        m = 2500;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem1'; cuter
      case 7
        nprob='problem1';
        m = 2500;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem1'; cuter
      case 8
        nprob='problem1';
        m = 2500;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem1'; cuter
      case 9
        nprob='problem1';
        m = 2500;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem1'; cuter
      case 10
        nprob='problem1';
        m = 2500;
        n = 2*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem1'; cuter
      case 11
        nprob='problem1';
        m = 4000;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem1'; cuter
      case 12
        nprob='problem1';
        m = 4000;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem1'; cuter
      case 13
        nprob='problem1';
        m = 4000;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem1'; cuter
      case 14
        nprob='problem1';
        m = 4000;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem1'; cuter
      case 15
        nprob='problem1';
        m = 4000;
        n = 2*m;
        x0 = -m*ones(n,1); 
        
    %% nprob='problem2'; cuter
      case 16
        nprob='problem2';
        m = 1000;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem2'; cuter
      case 17
        nprob='problem2';
        m = 1000;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 18
        nprob='problem2';
        m = 1000;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem2'; cuter
      case 19
        nprob='problem2';
        m = 1000;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 20
        nprob='problem2';
        m = 1000;
        n = 2*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 21
        nprob='problem2';
        m = 2500;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem2'; cuter
      case 22
        nprob='problem2';
        m = 2500;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 23
        nprob='problem2';
        m = 2500;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem2'; cuter
      case 24
        nprob='problem2';
        m = 2500;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 25
        nprob='problem2';
        m = 2500;
        n = 2*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 26
        nprob='problem2';
        m = 4000;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem2'; cuter
      case 27
        nprob='problem2';
        m = 4000;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 28
        nprob='problem2';
        m = 4000;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem2'; cuter
      case 29
        nprob='problem2';
        m = 4000;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 30
        nprob='problem2';
        m = 4000;
        n = 2*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 31
        nprob='problem3';
        m = 1000;
        n = 3*m;
        x0 = repmat([10^-5;-m/2],1500,1);
        
    %% nprob='problem3'; cuter
      case 32
        nprob='problem3';
        m = 1000;
        n = 3*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 33
        nprob='problem3';
        m = 1000;
        n = 3*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem3'; cuter
      case 34
        nprob='problem3';
        m = 1000;
        n = 3*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 35
        nprob='problem3';
        m = 1000;
        n = 3*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 36
        nprob='problem3';
        m = 2500;
        n = 3*m;
        x0 = repmat([10^-5;-m/2],3750,1);
        
    %% nprob='problem3'; cuter
      case 37
        nprob='problem3';
        m = 2500;
        n = 3*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 38
        nprob='problem3';
        m = 2500;
        n = 3*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem3'; cuter
      case 39
        nprob='problem3';
        m = 2500;
        n = 3*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 40
        nprob='problem3';
        m = 2500;
        n = 3*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 41
        nprob='problem3';
        m = 4000;
        n = 3*m;
        x0 = repmat([10^-5;-m/2],6000,1);
        
    %% nprob='problem3'; cuter
      case 42
        nprob='problem3';
        m = 4000;
        n = 3*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 43
        nprob='problem3';
        m = 4000;
        n = 3*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem3'; cuter
      case 44
        nprob='problem3';
        m = 4000;
        n = 3*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 45
        nprob='problem3';
        m = 4000;
        n = 3*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 46
        nprob='problem4';
        m = 1000;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem4'; cuter
      case 47
        nprob='problem4';
        m = 1000;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 48
        nprob='problem4';
        m = 1000;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem4'; cuter
      case 49
        nprob='problem4';
        m = 1000;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 50
        nprob='problem4';
        m = 1000;
        n = 2*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 51
        nprob='problem4';
        m = 2500;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem4'; cuter
      case 52
        nprob='problem4';
        m = 2500;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 53
        nprob='problem4';
        m = 2500;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem4'; cuter
      case 54
        nprob='problem4';
        m = 2500;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 55
        nprob='problem4';
        m = 2500;
        n = 2*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 56
        nprob='problem4';
        m = 4000;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem4'; cuter
      case 57
        nprob='problem4';
        m = 4000;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 58
        nprob='problem4';
        m = 4000;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem4'; cuter
      case 59
        nprob='problem4';
        m = 4000;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 60
        nprob='problem4';
        m = 4000;
        n = 2*m;
        x0 = -m*ones(n,1);
        
     %% nprob='problem5'; cuter
      case 61
        nprob='problem5';
        m = 1000;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem5'; cuter
      case 62
        nprob='problem5';
        m = 1000;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem5'; cuter
      case 63
        nprob='problem5';
        m = 1000;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem5'; cuter
      case 64
        nprob='problem5';
        m = 1000;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem5'; cuter
      case 65
        nprob='problem5';
        m = 1000;
        n = 2*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem5'; cuter
      case 66
        nprob='problem5';
        m = 2500;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem5'; cuter
      case 67
        nprob='problem5';
        m = 2500;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem5'; cuter
      case 68
        nprob='problem5';
        m = 2500;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem5'; cuter
      case 69
        nprob='problem5';
        m = 2500;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem5'; cuter
      case 70
        nprob='problem5';
        m = 2500;
        n = 2*m;
        x0 = -m*ones(n,1);
        
    %% nprob='problem5'; cuter
      case 71
        nprob='problem5';
        m = 4000;
        n = 2*m;
        x0 = repmat([10^-5;-m/2],m,1);
        
    %% nprob='problem5'; cuter
      case 72
        nprob='problem5';
        m = 4000;
        n = 2*m;
        x0 = m/2*ones(n,1);
        
    %% nprob='problem5'; cuter
      case 73
        nprob='problem5';
        m = 4000;
        n = 2*m;
        x0 = m*ones(n,1);
    
    %% nprob='problem5'; cuter
      case 74
        nprob='problem5';
        m = 4000;
        n = 2*m;
        x0 = -m/2*ones(n,1);
        
    %% nprob='problem5'; cuter
      case 75
        nprob='problem5';
        m = 4000;
        n = 2*m;
        x0 = -m*ones(n,1);
        
        
        
%     %% nprob='problem1'; cuter
%       case 1
%         nprob='problem1';
%         m = 1000;
%         n = 2*m;
%         x0 = repmat([10^-5;-m/2],m,1);
%         
%     %% nprob='problem1'; cuter
%       case 2
%         nprob='problem1';
%         m = 2500;
%         n = 2*m;
%         x0 = repmat([10^-5;-m/2],m,1);
        
%     %% nprob='problem1'; cuter
%       case 3
%         nprob='problem1';
%         m = 4000;
%         n = 2*m;
%         x0 = repmat([10^-5;-m/2],m,1);
%         
%     %% nprob='problem2'; cuter
%       case 4
%         nprob='problem2';
%         m = 1000;
%         n = 2*m;
%         x0 = m/100*ones(n,1);
%     
%     %% nprob='problem2'; cuter
%       case 5
%         nprob='problem2';
%         m = 2500;
%         n = 2*m;
%         x0 = m/100*ones(n,1);
%         
%     %% nprob='problem2'; cuter
%       case 6
%         nprob='problem2';
%         m = 4000;
%         n = 2*m;
%         x0 = m/100*ones(n,1);
%     
%     %% nprob='problem3'; cuter
%       case 7
%         nprob='problem3';
%         m = 1000;
%         n = 3*m;
%         x0 = -m/2*ones(n,1);
%         
%     %% nprob='problem3'; cuter
%       case 8
%         nprob='problem3';
%         m = 2500;
%         n = 3*m;
%         x0 = -m/2*ones(n,1);
%         
%     %% nprob='problem3'; cuter
%       case 9
%         nprob='problem3';
%         m = 4000;
%         n = 3*m;
%         x0 = -m/2*ones(n,1);
%     
%     %% nprob='problem4'; cuter
%       case 10
%         nprob='problem4';
%         m = 1000;
%         n = 2*m;
%         x0 = -m/2*ones(n,1);
% 
%     %% nprob='problem4'; cuter
%       case 11
%         nprob='problem4';
%         m = 2500;
%         n = 2*m;
%         x0 = -m/2*ones(n,1);
%     
%     %% nprob='problem4'; cuter
%       case 12
%         nprob='problem4';
%         m = 4000;
%         n = 2*m;
%         x0 = -m/2*ones(n,1);
%         
%     %% nprob='problem5'; cuter
%       case 13
%         nprob='problem5';
%         m = 1000;
%         n = 2*m;
%         x0 = -m/2*ones(n,1);
% 
%     %% nprob='problem5'; cuter
%       case 14
%         nprob='problem5';
%         m = 2500;
%         n = 2*m;
%         x0 = -m/2*ones(n,1);
%     
%     %% nprob='problem5'; cuter
%       case 15
%         nprob='problem5';
%         m = 4000;
%         n = 2*m;
%         x0 = -m/2*ones(n,1);

end