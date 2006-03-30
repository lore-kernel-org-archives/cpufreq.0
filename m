From: =?UTF-8?B?0JzQuNGF0LDQuNC7INCY0LLQsNC90L7Qsg==?= <ivans@isle.spb.ru>
Subject: Powernow on MSI L715 megabook
Date: Thu, 30 Mar 2006 12:11:36 +0400
Message-ID: <442B92B8.7060709@isle.spb.ru>
Reply-To: ivans@isle.spb.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hallo! Recently I have acquired a L715 megabook with MT34 Turion processor.
I think I have some problem with temperature control. The average CPU
temperature stabilizes around 54*C on idle notebook. Processor frequency
is set to 800Mhz (lowest), but the fan rotates on the higher speed.
Occasionally it switches to lower speed, but after a second or a two
it switches back to higher speed. This speed change occurs once in
15...30 seconds.

I'm running kernel 2.6.16, this behaviour is observed with both ondemand
and conservative governors. I also had the same pattern with userspace
governor (I used powernowd).

I also observe constant acpi events from CPU: 00000080 00000000. This
event is generated once in a couple of seconds, sometimes more frequently.
maybe this is related to the fan problem.

Can anybody advise me on this problem? Thanks!
