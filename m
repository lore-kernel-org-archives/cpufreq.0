From: David  <davidendless@email.it>
Subject: Powernow-k7 hang on Acer Aspire 1304XC
Date: Fri, 25 Jul 2003 23:01:15 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307252301.16017.davidendless@email.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

I experienced hangs when I used powernow-k7, so I started to experiment.

I found that the computer hangs only when I switch between performance and 
powersave echoing to scaling_governor, while if I change scaling_max_freq 
everything works fine.
So if I set powersave and then I turn back to performance, most of the times 
the computer hangs, but if I am in performance state and I change 
scaling_max_freq to 665000 kHz and then I change again scaling_max_freq to 
1529000 kHz everything works fine (even iterating it)
The cpu speed really changes in both cases (accordingly to /proc/cpuinfo, 
bogomips, and monitoring time of execution of a small script I wrote).

My experience maybe means something, maybe not.

Hope this helps solving the problem.

David
