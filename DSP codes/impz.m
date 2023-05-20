function [x_r, t_r] = impz(b, a, n, fs)

  if nargin == 0 || nargin > 4
    usage("impz(b [, a, n, fs])");
  end
  if nargin < 2, a = [1]; end
  if nargin < 3, n = []; end
  if nargin < 4, fs = 1; end

  if isempty(n) && length(a) > 1
    precision = 1e-6;
    r = roots(a);
    maxpole = max(abs(r));
    if (maxpole > 1+precision)     # unstable -- cutoff at 120 dB
      n = floor(6/log10(maxpole));
    elseif (maxpole < 1-precision) # stable -- cutoff at -120 dB
      n = floor(-6/log10(maxpole));
    else                        # periodic -- cutoff after 5 cycles
      n = 30;
      
				# find longest period less than infinity
				# cutoff after 5 cycles (w=10*pi)
      rperiodic = r(find(abs(r)>=1-precision & abs(arg(r))>0));
      if !isempty(rperiodic)
	n_periodic = ceil(10*pi./min(abs(arg(rperiodic))));
	if (n_periodic > n)
	  n = n_periodic;
	end
      end
      
				# find most damped pole
				# cutoff at -60 dB
      rdamped = r(find(abs(r)<1-precision));
      if !isempty(rdamped)
	n_damped = floor(-3/log10(max(abs(rdamped))));
	if (n_damped > n)
	  n = n_damped;
	end
      end
    end
    n = n + length(b);
  elseif isempty(n)
    n = length(b);
  end

  if length(a) == 1
    x = fftfilt(b/a, [1, zeros(1,n-1)]);
  else
    x = filter(b, a, [1, zeros(1,n-1)]);
  end
  t = [0:n-1]/fs;

  if nargout >= 1 x_r = x; end;
  if nargout >= 2 t_r = t; end;
  if nargout == 0
    unwind_protect
      title "Impulse Response";
      if (fs > 1000)
      	t = t * 1000;
      	xlabel("Time (msec)");
      else
      	xlabel("Time (sec)");
      end
      plot(t, x, "^r;;");
    unwind_protect_cleanup
      title ("")
      xlabel ("")
    end_unwind_protect
  end