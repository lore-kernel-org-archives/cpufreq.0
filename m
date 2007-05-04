From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 01:37:29 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
	<200705042320.41278.dj@david-web.co.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200705042320.41278.dj@david-web.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Johnson <dj@david-web.co.uk>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org


On May 4 2007 23:20, David Johnson wrote:
>
>longhaul: VIA C3 'Nehemiah C' [C5P] CPU detected.  Powersaver supported.
>longhaul: Using ACPI support.
>
>It seems that longhaul on my system is 'using ACPI support' whereas on yours 
>it is 'using northbridge support'. I'm getting lockups after approx. 2-3 
>hours using the ondemand governor. It has no problem changing the clock 
>speed, and runs at the minimum speed most of the time.

I had tried this:

-  if (enable_arbiter_disable()) {
+  if (0 && enable_arbiter_disable()) {

to skip enabling the northbridge. Unfortunately, I do not seem to have
southbridge or ACPI support.

>I seem to recall that I get an oops when my system locks-up (the system runs 
>headless normally, so it isn't easy to check). I'll investigate.

I think I did not see any oops, though I (1) did not redirect the
kernel output back to tty0 [the distro moves it away to tty11]
so I might have missed something, but (2) netconsole did not send
anything. IIRC, the kernel still catches sysrq if it paniced, i.e.
as a result of not finding a proper root device during startup;
but no sysrq, so it seems a harder lockup. Maybe I should try
without all the modules loaded and/or disable some hw in the bios.


Jan
-- 
