From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Mon, 14 Jan 2013 01:26:38 +0000 (UTC)
Message-ID: <20130114012638.49AE311F98D@bugzilla.kernel.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-50721-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721





--- Comment #11 from rocko <rockorequin@hotmail.com>  2013-01-14 01:26:38 ---
No, the command doesn't work. I ran into the issue again with 3.7.2, and
although the command does set scaling_max_frequency to equal
scaling_min_frequency, turbostat still shows the core running at a much higher
frequency:


root@sierra:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_min_freq  >
scaling_max_freq 

root@sierra:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_max_freq 
800000

root@sierra:/sys/devices/system/cpu/cpu0/cpufreq# turbostat 
cor CPU    %c0  GHz  TSC    %c1    %c3    %c6    %c7   %pc2   %pc3   %pc6  
%pc7
          0.54 2.04 1.99   0.99   0.04   0.00  98.44   0.00   0.00   0.00  
0.00
  0   0   1.09 2.00 1.99   0.78   0.06   0.00  98.06   0.00   0.00   0.00  
0.00
  0   1   0.04 1.99 1.99   1.83
  1   2   0.52 2.00 1.99   0.38   0.00   0.00  99.10
  1   3   0.08 1.99 1.99   0.81
  2   4   1.14 2.17 1.99   0.26   0.01   0.00  98.59
  2   5   0.01 1.99 1.99   1.39
  3   6   1.42 1.99 1.99   0.51   0.07   0.00  98.00
  3   7   0.01 2.00 1.99   1.91

cor CPU    %c0  GHz  TSC    %c1    %c3    %c6    %c7   %pc2   %pc3   %pc6  
%pc7
          0.31 2.01 1.99   0.70   0.02   0.00  98.97   0.00   0.00   0.00  
0.00
  0   0   0.92 1.99 1.99   0.68   0.03   0.00  98.37   0.00   0.00   0.00  
0.00
  0   1   0.02 1.99 1.99   1.58
  1   2   0.27 1.99 1.99   0.36   0.00   0.00  99.37
  1   3   0.10 1.99 1.99   0.53
  2   4   0.57 2.05 1.99   0.15   0.01   0.00  99.27
  2   5   0.01 2.00 1.99   0.71
  3   6   0.47 1.99 1.99   0.64   0.02   0.00  98.87
  3   7   0.12 1.99 1.99   0.99

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
