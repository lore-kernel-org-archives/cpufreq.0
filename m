From: Reynaldo Cordero <reynaldo.cordero@uah.es>
Subject: Pentium III Coppermine and SiS 630 southbridge
Date: Fri, 27 Feb 2004 12:20:04 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1077880804.12506.22.camel@localhost.localdomain>
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

Hi!
I have a laptop with Pentium III Coppermine and SiS 630
southbridge (clevo 2700s [1], kernel 2.6.3 on debian
unstable).

I want to recompile it with CPU Frequency scaling,
and I wondered if I can use:

- 'powersave' governor
or
- 'userspace' governor for userspace frequency scaling

And which of the drivers are the correct:

- Intel Speedstep on ICH-M chipsets (ioport interface) or
- Intel SpeedStep on 440BX/ZX/MX chipsets (SMI interface)
or anithing else.

[1] http://hemmerling.free.fr/html/en/linux01.html

Thanks!
