From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep won't load even with acpi tables
Date: Tue, 5 Oct 2004 23:53:50 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041005215350.GA1299@dominikbrodowski.de>
References: <4162DCE2.4030008@comcast.net> <1097011299.4909.11.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1097011299.4909.11.camel@localhost>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

Hi,

You already got speedstep up and running using the ACPI cpufreq driver:

> > acpi 4684 0 - Live 0xe09cc000

> > CONFIG_X86_ACPI_CPUFREQ=m

> > #cpu
> > non-fatal
> > acpi

you load it _before_ speedstep-centrino, even. disabling it should allow you
to load the (faster) speedstep-centrino module...

> > Oct  5 12:30:29 shake cpufreq: CPU0 - ACPI performance management activated.
> > Oct  5 12:30:29 shake cpufreq: *P0: 1700 MHz, 21000 mW, 100 uS
> > Oct  5 12:30:29 shake cpufreq:  P1: 1400 MHz, 17500 mW, 100 uS
> > Oct  5 12:30:29 shake cpufreq:  P2: 1200 MHz, 15000 mW, 100 uS
> > Oct  5 12:30:29 shake cpufreq:  P3: 1000 MHz, 12500 mW, 100 uS
> > Oct  5 12:30:29 shake cpufreq:  P4: 800 MHz, 10000 mW, 100 uS
> > Oct  5 12:30:29 shake cpufreq:  P5: 600 MHz, 7500 mW, 100 uS

... with which you should get 10uS latencies instead of 100 uS.

	Dominik
