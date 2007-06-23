From: "Phil Endecott" <phil_fvnqz_endecott@chezphil.org>
Subject: Power measurements
Date: Sat, 23 Jun 2007 13:54:17 +0100
Message-ID: <1182603257511@dmwebmail.belize.chezphil.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Dear All,

I would like to share some power consumption numbers that I have just 
measured on my VIA C7-M system.  It uses the e_powersaver module and 
can run at 400MHz or 1.2GHz.  I have measured the power consumption 
when idle and when running a "while(1){}" program at each speed:

         400    1200
Idle    16W    16W
Busy    17W    20W

What I find interesting is that the idle power at 1.2GHz is identical 
to that at 400 MHz.

This makes me wonder if the on-demand governor would actually save any 
power at all.

I plan to do some more accurate measurements and to experiment with 
some different workloads.  Has anyone else done anything like this?


Regards,

Phil.
