From: Prantik Kundu <pkundu@andrew.cmu.edu>
Subject: P-M, ICH4 ACPI performance and throttling states and
	auto-switching, and hard drive standby-ing
Date: Fri, 16 Jan 2004 19:28:02 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1074299282.547.9.camel@3piece>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk


Hi. I have an IBM T40 P-M 1.6 with ICH4, I'm running 2.4.23 and have
applied the latest ACPI patch which included ACPI CA, so, I can change
both performance states and throttling states effectively

I have some questions and concerns:
Whats the difference between throttling and P-states? It seems that each
P-state has n T-states (where n=8 in my case), because I can slow my
system down so far gnome crawls, and then speed it up fast enough that
my kernel compiles in 3.5 minutes. For the P-M series, what should I use
to do automatic P-state/throttling changes? It seems that cpufreq
wouldnt works since I have an ICH4. Is there anything that can
effectively manage both? It would be nice to bring the CPU down to
~70Mhz (13% of 600MHz, P5 with T7) when I don't need any more than that.
Also, I would very much like to do automatic hard drive standby-ing,
what should I use to do that?

Thank you for your time, looking forward to a response.
 
-Prantik
