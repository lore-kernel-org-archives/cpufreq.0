From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq/ does not exist
Date: Thu, 9 Sep 2004 18:13:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040909161313.GA5182@dominikbrodowski.de>
References: <Pine.LNX.4.58.0409091132010.31562@marfim.cpad.pucrs.br>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0409091132010.31562@marfim.cpad.pucrs.br>
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
Content-Transfer-Encoding: 7bit
To: Marco Aurelio Stelmar Netto <stelmar@cpad.pucrs.br>
Cc: cpufreq@www.linux.org.uk

On Thu, Sep 09, 2004 at 11:46:35AM -0300, Marco Aurelio Stelmar Netto wrote:
> 
> Hello,
> 
> I have a machine (desktop machine) HP EP-C c10 with a Pentium III
> (Coppermine) 1GHz and I'm making some performance tests so I would like
> to have the machine processor working at 500 MHz. I have configured the
> cpufreq option (kernel 2.6.6) but the cpufreq directory in
> /sys/devices/system/cpu/cpu0 does not exist.
... 
> I don't know if I have made some mistake or my cpu does not support the
> cpufreq. I have tried to modify the clock frequency via BIOS, but such an
> option is not available. All I want is to modify the clock frequency. It
> does not need be on-the-fly.

A desktop Coppermine Pentium III does not support SpeedStep, so no cpufreq
support exists. Possibly you can change the CPU speed in your system BIOS.

	Dominik
