From: Marco Aurelio Stelmar Netto <stelmar@cpad.pucrs.br>
Subject: last alternative : program to consume CPU?!
Date: Thu, 9 Sep 2004 13:35:56 -0300 (BRT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0409091321560.6133@marfim.cpad.pucrs.br>
References: <Pine.LNX.4.58.0409091132010.31562@marfim.cpad.pucrs.br>
	<20040909161313.GA5182@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040909161313.GA5182@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk


The BIOS of my machine does not support the modification of the CPU speed.

My problem is that I have a homogeneous cluster composed of 16 machines
and I need to perform some tests of my application on a heterogeneous
cluster. So my first option was to change the cpu speed in the BIOS, but
failed. The second option was to find some support in the linux itself.
I have found the cpufreq, but failed. My last option is to implement or
find a program to consume a percentage of CPU. Do you know where I can
find a good program to perform this task? Or do you know another alternative
to solve my problem?

Thank you very much for your attention.

Marco

On Thu, 9 Sep 2004, Dominik Brodowski wrote:

> On Thu, Sep 09, 2004 at 11:46:35AM -0300, Marco Aurelio Stelmar Netto wrote:
> >
> > Hello,
> >
> > I have a machine (desktop machine) HP EP-C c10 with a Pentium III
> > (Coppermine) 1GHz and I'm making some performance tests so I would like
> > to have the machine processor working at 500 MHz. I have configured the
> > cpufreq option (kernel 2.6.6) but the cpufreq directory in
> > /sys/devices/system/cpu/cpu0 does not exist.
> ...
> > I don't know if I have made some mistake or my cpu does not support the
> > cpufreq. I have tried to modify the clock frequency via BIOS, but such an
> > option is not available. All I want is to modify the clock frequency. It
> > does not need be on-the-fly.
>
> A desktop Coppermine Pentium III does not support SpeedStep, so no cpufreq
> support exists. Possibly you can change the CPU speed in your system BIOS.
>
> 	Dominik
>
