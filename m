From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Thu, 14 Mar 2013 16:07:16 +0000 (UTC)
Message-ID: <20130314160717.0134811FA4C@bugzilla.kernel.org>
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


Vadim Fint <mocksoul@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mocksoul@gmail.com




--- Comment #14 from Vadim Fint <mocksoul@gmail.com>  2013-03-14 16:07:16 ---
Got absolutely the same behaviour with 3.7.5 kernel on i7-2620M cpu.
As far as I can see -- it occurs after long sleeps > 5-10 mins. I occurs 100% 
after long sleep (going to work -- it happens, going home at evening -- it 
happens again).

cpufreq shows what it sets lowest freq possibly, but once I try "-w" switch it 
shows 2.7GHz real hardware clock.

I tried plain vanilla 3.7.10 kernel with no luck.

Cant try 3.8.x yet, because there is no pf-patches for it (I *need* BFS ;)).

Will try to downgrade onto 3.6.x and post results here...


Cpufreq from unprivileged user shows 800MHz:

csl linux/tools/power/x86/turbostat # sudo -u mocksoul cpufreq-info| grep
'curre
nt CPU'
  current CPU frequency is 800 MHz.
  current CPU frequency is 800 MHz.
  current CPU frequency is 800 MHz.
  current CPU frequency is 800 MHz.

While root can read hw freq and it shows 2.7GHz :(
mcsl linux/tools/power/x86/turbostat # cpufreq-info| grep 'current CPU'
  current CPU frequency is 2.70 GHz (asserted by call to hardware).
  current CPU frequency is 2.70 GHz (asserted by call to hardware).
  current CPU frequency is 2.70 GHz (asserted by call to hardware).
  current CPU frequency is 2.70 GHz (asserted by call to hardware).

Turbostat (as well as powertop 1.x) shows that my cpu mostly in c7 state:

mcsl linux/tools/power/x86/turbostat # ./turbostat
cor CPU    %c0  GHz  TSC    %c1    %c3    %c6    %c7   %pc2   %pc3   %pc6  
%pc7

          0.42 2.69 2.69   1.34   0.03   0.00  98.22   0.00   0.00   0.00  
0.00

  0   0   0.86 2.69 2.69   2.41   0.05   0.00  96.67   0.00   0.00   0.00  
0.00

  0   1   0.63 2.69 2.69   2.64
  1   2   0.15 2.69 2.69   0.09   0.00   0.00  99.76
  1   3   0.02 2.69 2.69   0.22

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
