From: Martin Cracauer <cracauer@cons.org>
Subject: Need to reuse cpufreq's recalibration code
Date: Thu, 9 Nov 2006 16:32:28 -0500
Message-ID: <20061109213228.GA72108@cons.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Hi,

I am messing with the CPU clocks outside the cpufreq framework (direct
ICS manipulation).  While I plan to integrate the code into cpufreq,
at this time I cannot since all the math is pocket calculator.

What I need to do is recalibrate the CPU clocks after I change the
frequency.  I observe that the real time clock is correct, but that
CPU time is wrongly accounted for and obviously /proc/cpuinfo isn't
updated.  That happens if I use the TCS, mptmr and hpet.

I figured that the best way to proceed is that I reuse some code from
cpufreq, namely cpufreq_notify_transition().

I am looking for advise how to achieve this best without messing up
too much other code.

Maybe I can write an "empty" cpufreq implementation that does nothing
but call cpufreq_notify_transition when I touch one of it's /proc
files? 

Platform is x86_64, hardware is Core2 Conroe on D975XBX (975x chipset).

Martin
-- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Martin Cracauer <cracauer@cons.org>   http://www.cons.org/cracauer/
